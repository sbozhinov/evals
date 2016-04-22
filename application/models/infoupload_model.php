<?php if (!defined('BASEPATH'))
{
    exit('No direct script access allowed');
}
require_once dirname(__FILE__) . "/../libraries/odataphp/framework/CourseEnrollmentEntities.php";

class infoUpload_model extends CI_model
{
    /*Keys used in regards to keeping track of courses by giving them unique identifiers*/
    var $instructor_count = 'count_instructor';
    var $upload_course_count = 'upload_count';
    var $upload_course_key = 'upload-course-';
    var $course = 'course';
    /*Keys that correspond to all the properties of a course*/
    var $term = 'term';
    var $year = 'year';
    var $subject = 'subject';
    var $number = 'number';
    var $section = 'section';
    var $title = 'title';
    var $start_date = 'start_date';
    var $end_date = 'end_date';
    var $eval_start_date = 'eval_start_date';
    var $eval_end_date = 'eval_end_date';
    var $instructor = 'instructor';
    var $serviceUrl = 'https://webapps.eastern.ewu.edu/datainterfaces/CourseEnrollment.svc';

    /*Keys that correspond to all the properties that are used in relation to an instructor*/
    var $name = 'name';
    var $username = 'username';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->model("course_model");
        $this->load->model("user_model");
    }

    /*
     * Name: getCoursesInstructorsIntoSession
     * Description: Puts course and instructor data contained in the ODATA service into CodeIgnitor's
     * session, so that data is persistent and can be accessed from a single access point.
     * Parameters: None
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Create an array to store fields of data contained in the Members ODATA property
     *(as a nested entity).
     * 2) Create variables to hold  the expand properties of the courses entity, the expand
     * properties of the members entity, the role property (a property of the members entity),
     * and the value of the role property by which to filter users.
     * 3) Create an array to hold the properties contained in the courses entity.
     * 4) Retrieve course entity information from the ODATA service.							(F)
     * 5) Parse the data retrieved from the ODATA service using the keys in $expandFields.		(F)
     * 6) Assign unique keys to each of the retrieved courses.									(F)
     * 7) Merge the data concerning courses and instructors into a single array.
     * 8) Count the number of courses.
     * 9) Store the current quarter and year in variables and add that data to the array that
     * contains the course and instructor data.
     * 10) Add the current course and instructor data into the current session for use.
     */
    public function GetCoursesInstructorsIntoSession()
    {
        //This calls the method responsible for retrieving the "COURSES" entities from the ODATA service.
        $entities = $this->RetrieveEntityInfo();

        if (!isset($entities) || count($entities) <= 0)
            return false;

        // Step 5
        //This calls the method responsible for parsing out the data from the "COURSES" entities into arrays with the appropriate keys before database insertion or updating.
        $this->ParseODataValues($entities, $courses, $instructors);

        // Step 6
        //This calls the method responsible for uniquely identifying the courses that are to be stored in the session
        $this->NormalizeCourses($courses);
        $reformattedData = array();

        // Step 7
        //The following statements simply merge the uniquely identified arrays of instructors and courses
        $reformattedData = array_merge($reformattedData, $courses);
        $reformattedData = array_merge($reformattedData, $instructors);

        // Step 8
        $reformattedData[$this->upload_course_count] = count($courses);

        // Step 9
        //The two following values are necessary to describing the courses that are being stored in the session.
        $currentQuarter = $courses[$this->upload_course_key . "0"][$this->term];
        $currentYear = $courses[$this->upload_course_key . "0"][$this->year];
        $reformattedData[$this->term] = $currentQuarter;
        $reformattedData[$this->year] = $currentYear;

        // Step 10
        //The quarter,course,and instructor information is stored  in the session.
        $this->session->set_userdata($reformattedData);
        return true;
    }

    /*
     * IS THIS METHOD ACTUALLY DOING ANYTHING USEFULL (elise)
     * Name: NormalizeCourses
     * Description: Assigns unique identifiers (keys) to each course retrieved from Eastern's
     * ODATA service.
     * Parameters: &$courses - the course data retrieved from Eastern's ODATA service
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Sort the courses based on subject, course number, and section.
     * WHY DO THE COURSES NEED TO BE SOURTED!!?? (elise)
     * 2) For each course, copy the course into the $keyed_courses array, where each
     * index serves as a unique course key.														(L)
     * ISNT THERE AN AUTO INCREMENT FEATURE IN THE DATABASE FOR THIS (elise)
     * 3) Replace the old array of courses with the array of courses that contains unique
     * identifiers.
     */
    public function NormalizeCourses(&$courses)
    {
        // Step 1
        $this->bubble_sort_compare($courses);
        $keyed_courses = array();
        $course_index = 0;

        // Step 2
        foreach ($courses as $course)
        {
            $key = $this->upload_course_key . $course_index;
            $keyed_courses[$key] = $course;
            $course_index++;
        }

        // Step 3
        $courses = $keyed_courses;
    }

    /*
     * Name: bubble_sort_compare
     * Description: A bubble sort to sort the course array based on key value pairs in the array.
     * Parameters: &$courses - the array of courses retrieved from the ODATA service.
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Count the number of courses that were passed into the method.
     * 2) Sort the courses in ascending order based on subject, course number, and section.		(L)(F)
     */
    public function bubble_sort_compare(&$courses)
    {
        $done = false;

        // Step 1
        $numOfCourses = count($courses);

        // Step 2
        while (!$done)
        {
            $swap = false;
            for ($curr_index = 0, $next_index = 1; $next_index < $numOfCourses; $curr_index++, $next_index++)
            {
                $curr_course = $courses[$curr_index];
                $next_course = $courses[$next_index];
                $diff = $this->course_compare_ascend($curr_course, $next_course);
                if ($diff > 0)
                {
                    $courses[$curr_index] = $next_course;
                    $courses[$next_index] = $curr_course;
                    $swap = true;
                }
            }
            if (!$swap)
            {
                $done = true;
            }
        }
    }

    /*
     * Name: course_compare_ascend
     * Description: Compares two courses based on the sort criterion that's defined (subject, course
     * number, and section number). Returns a numerical value that indicates the difference between
     * the two courses.
     * Parameters: $array_a - the array containing the information on the first course, $array_b -
     * the array containing the information on the second course
     * Return: int -  the value which indicates the difference between the two courses
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Create an array to hold the sort criteria.
     * 2) For each criterion, compare the data stored in the array that corresponds to that
     * criterion and assign a corresponding difference value.									(L)
     * 3) Return the indicated difference value.
     */
    public function course_compare_ascend($array_a, $array_b)
    {
        // Step 1
        $sort_criterion = array("subject", "number", "section");
        $diff = 0;

        // Step 2
        foreach ($sort_criterion as $criterion)
        {
            $a_value = $array_a[$criterion];
            $b_value = $array_b[$criterion];
            if ($a_value < $b_value)
            {
                $diff = -1;
                break;
            }
            else
            {
                if ($a_value > $b_value)
                {
                    $diff = 1;
                    break;
                }
            }
        }

        // Step 3
        return $diff;
    }

    /*
     * Name: UpdateCoursesInstructors
     * Description: This method receives an array of identifiers that follow the key format for
     * referring to courses stored in the session. It then proceeds to retrieve and store those
     * courses and the instructors that teach them into the "course" and "user" tables, respectively,
     * as well as place the quarter information into the "quarter_subject" table.
     * Parameters: $course_list - the collection of identifiers for currently-offered courses
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Break the course list apart into individual array elements - one for each course.
     * 2) Retrieve each course's information from the session.									(L)
     * 3) Retrieve the data on the instructor who is teaching each course.						(L)
     * 4) If a key does not already exist for the retrieved instructor, create one.				(L)
     * 5) Check to see if each instructor is already in the database.							(L)(F)
     * 6) If an instructor is not already in the database, add them.							(L)(F)
     * 7) Add the courses to the database.														(F)
     */
    public function UpdateCoursesInstructors($course_list)
    {
        
        // Step 1
        $course_indexes = explode(',', $course_list);
        $courses = array();
        $instructors = array();
        
        if(sizeof($course_indexes)<6){
            foreach ($course_indexes as $course_identifier)
            {
                // Step 2
                $course = $this->session->userdata($course_identifier);
                // get student count from OData stream
                $course['student_count'] = $this->GetStudentCount($course['crn']);
                unset($course['crn']);    

                $courses[] = $course;

                // Step 3
                $course_instructor = $course[$this->instructor];

                // Step 4
                if (!array_key_exists($course_instructor, $instructors))
                {
                    $instructors[$course_instructor] = $this->session->userdata($course_instructor);
                }
            }
        }
        else{
            $compareArray =$this->FindAllStudents();
			$sessArray = array();
                foreach ($course_indexes as $course_identifier)
                {
                // Step 2
                $course = $this->session->userdata($course_identifier);
                // get student count from $compareArray
                  $count = 0;
                    for($i = 0; $i < sizeof($compareArray);$i++){                
                          if($compareArray[$i]== $course['crn']){  
                            $count++;
                          }
                    }
                //update db/unset
             $sessArray[] = $course['crn'] ;
                    $course['student_count'] = (string)$count;
                  
                           $courses[] = $course;
                       $course_instructor = $course[$this->instructor];
                // Step 4
                if (!array_key_exists($course_instructor, $instructors))
                {
                    $instructors[$course_instructor] = $this->session->userdata($course_instructor);
                }
            }   
			  unset($sessArrray);	
        }

        foreach ($instructors as $instructor)
        {
            // Step 5
            //Only add user if the user doesn't already exist in the database.
            $user = $this->user_model->getInstructor($instructor[$this->username]);

            // Step 6
            if (!$user['valid'])
            {
                $this->user_model->addInstructor($instructor[$this->name], $instructor[$this->username], '');
            }
        }

        // Step 7
        $this->course_model->addCourses($courses);
    }


    public function GetStudentCount($crn)
    {
        try
        {
            $proxy = new CourseEnrollmentEntities($this->serviceUrl);
            return $proxy->MEMBERS()->AddQueryOption('$filter',"CRN eq '$crn' and ROLE ne 'faculty'")->Count();
        }
        catch (ODataServiceException $e)
        {
            echo "Error:" . $e->getError() . "<br>" . "Detailed Error:" . $e->getDetailedError();
        }
    }
    
    public function FindAllStudents()
    {          
        try
        {
          $storeResult = array();     
            //load up crn info
          $proxy = new CourseEnrollmentEntities($this->serviceUrl);
          $res = $proxy->MEMBERS()
                   ->AddQueryOption('$select', "CRN")
                   ->Filter("ROLE ne 'faculty'")->Execute();
                $i=0;
                foreach($res->Result as $entityObject)
                {
                    $storeResult[$i] = $entityObject->CRN;
                        $i++;                        
                }
            return $storeResult;
        }
        
        catch (ODataServiceException $e)
        {
            echo "Error:" . $e->getError() . "<br>" . "Detailed Error:" . $e->getDetailedError();
        }
    }

    /*
     * Name: RemoveCoursesInstructorsFromSession
     * Description: Removes the instructors and courses from the session
     * Parameters: None
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Retrieve the number of courses currently stored in the session.
     * 2) For each course stored in the session, retrieve its unique key value.					(L)
     * 3) Delete each course's data from the session.											(L)
     * 4) Remove the total number of courses from the session.
     */
    public function RemoveCoursesInstructorsFromSession()
    {        
        // Step 1
        $course_count = $this->session->userdata($this->upload_course_count);
        if ($course_count != false)
        {
            $array_items = array();
            for ($c = 0; $c < $course_count; $c++)
            {

                // Step 2
                $course = $this->session->userdata($this->upload_course_key . $c);
                              
                $array_items[$course[$this->instructor]] = '';
                $array_items[$this->upload_course_key . $c] = '';
                $array_items['selected-' . $this->upload_course_key . $c] = '';
                // Step 3
                
            }
            $this->session->unset_userdata($array_items);
            // Step 4
            $this->session->unset_userdata($this->upload_course_count);
        }
    }

    /*
     * Name: RetrieveEntityInfo
     * Description: Retrieves the entity info concerning entities in the ODATA service.
     * (The method ParseODATAValues is the method that will take this data and assign it unique
     * key values for insertion into the database.)
     * Parameters: $array_a - the array containing the information on the first course, $array_b -
     * the array containing the information on the second course
     * Return: int -  the value which indicates the difference between the two courses
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Retrieve the course enrollment entities from the Eastern's ODATA service and expand the
     * data to count the number of members.
     * 2) Loop through each course entity and store its attributes (if the attribute does not
     * match the property "members").															(L)
     * 3) If the attribute matches the "members" property, count the number of members.			(L)
     * 4) For each member in the "members" property attribute, check to see if that member
     * is faculty. If so, add the member to the $expandFilterEntities array.					(L)
     * 5) Store the faculty member information in the $attributes array.						(L)
     * 6) Store the attributes in the $entities array.											(L)
     * 7) If the ODATA service data requests fail, print out a detailed error message to the user.
     * 8) Return the course and instructor information.
     */
    public function RetrieveEntityInfo()
    {
        $memberFields = array('FIRST_NAME' => 'first_name',
                      'LAST_NAME'  => 'last_name',
                      'ID'         => 'id');

        $courseFields = array('TERM'       => 'term',
                              'SUBJ'       => 'subject',
                              'TITLE'      => 'title',
                              'CRSENUMB'   => 'number',
                              'SECTION'    => 'section',
                              'START_DATE' => 'start_date',
                              'END_DATE'   => 'end_date',
                              'CRN'        => 'crn');
    
        $entities = array();

        try
        {
            $proxy = null;
            $entityResponse = null;
            $nextEntityToken = null;

            $proxy = new CourseEnrollmentEntities($this->serviceUrl);
            $query = $proxy->MEMBERS()->Expand('COURSES')->AddQueryOption('$filter', "ROLE eq 'faculty'")->IncludeTotalCount();
            $entityResponse = $query->Execute();

            $coursesQuery = $proxy->COURSES();
            $coursesResponse = $coursesQuery->Execute();

            //will be used to see if we have already seen a course or not
            $courseTable = array();

            do
            {
                $attributes = array();
                
                if ($nextEntityToken != null)
                {
                    $entityResponse = $proxy->Execute($nextEntityToken);
                }
                
                // loop through entities
                foreach ($entityResponse->Result as $entityObject)
                {
                    $courses = $entityObject->COURSES[0];

                    $courseKey = $courses->TERM . $courses->SUBJ . $courses->CRSENUMB . $courses->SECTION;
                    $courseTable[$courseKey] = 1;

                    $attributes['members'] = array();
                    $attributes['members'][0] = array();

                    // go through course fields
                    foreach ($courseFields as $field => $attr)
                    {
                        $attributes[$attr] = $courses->$field;
                    }

                    // go through member fields
                    foreach ($memberFields as $field => $attr)
                    {
                        $attributes['members'][0][$attr] = $entityObject->$field;
                    }

                    $entities[] = $attributes;
                }
            }
            while (($nextEntityToken = $entityResponse->GetContinuation()) != null);

            $nextEntityToken = null;

            /* now we check if any of our courses are already in */
            do
            {
                $attributes = array();

                if ($nextEntityToken != null)
                {
                    $coursesResponse = $proxy->Execute($nextEntityToken);
                }

                // loop through entities
                foreach ($coursesResponse->Result as $entityObject)
                {
                    $courses = $entityObject;

                    $courseKey = $courses->TERM . $courses->SUBJ . $courses->CRSENUMB . $courses->SECTION;
                    if($courseTable[$courseKey] == 1)
                        continue;

                    $attributes['members'] = array();
                    $attributes['members'][0] = array();

                    // go through course fields
                    foreach ($courseFields as $field => $attr)
                    {
                        $attributes[$attr] = $courses->$field;
                    }

                    // go through member fields
                    foreach ($memberFields as $field => $attr)
                    {
                        $attributes['members'][0][$attr] = $entityObject->$field;
                    }

                    $attributes['members'][0]["first_name"] = 'TBA';
                    $attributes['members'][0]["last_name"] = 'TBA';
                    $attributes['members'][0]["id"] = '00000000';

                    $entities[] = $attributes;
                }
            } while(($nextEntityToken = $coursesResponse->GetContinuation()) != null);

        }
        catch (DataServiceRequestException $ex)
        {
//            echo 'Error: while running the query ' . $ex->Response->getQuery();
//            echo "<br/>";
//            echo $ex->Response->getError();
        }
        catch (ODataServiceException $e)
        {
            echo "Error:" . $e->getError() . "<br>" . "Detailed Error:" . $e->getDetailedError();
        }

        // Step 8
        return $entities;
    }

    /*
     * Name: ParseODataValues
     * Description: Extracts the data from the entities return by Eastern's ODATA service -
     * "instructor" from "members". as well as "quarter" and "year" from "term". The values are then
     * unset. Quarter, year, and instructor information is then stored into each course and
     * course evaluation dates are generated.
     * Parameters: $entities - the collection of data entities from the ODATA service, &$courses -
     * the array of data that will contain the course information, &$instructors - the array of
     * data that will contain instructor information
     * Return: None
     * Documentation Modified: 3/4/14 (LW)
     *
     * 1) Create arrays to hold the names, emails, and IDs of instructors.
     * 2) For each attribute contained in an ODATA entity, retrieve the information
     * concerning the course instructor and store the information in the names,
     * emails, and IDs arrays (the ID is a generated hash code).							(L)
     * 3) Once the information about the instructors for a course is stored, remove
     * the instructor information from the session.
     * 4) Retrieve and store the current year and quarter information from the ODATA
     * entities.
     * 5) Once the year and quarter information has been stored, remove the data
     * from the session.
     * 6) Retrieve and store the starting and ending dates for each course.
     * 7) Calculate the starting and ending dates for the evaluation period for a course,
     * based on 75% of the difference between the course start and end dates.
     * 8) Store the course attributes (instructor, year, quarter, start date, end date,
     * and evaluation dates included).
     * 9) Count the number of instructors that teach that particular course.
     * 10) Store each instructor that teaches that particular course in the $instructors
     * array.																				(L)
     */
    public function ParseODataValues($entities, &$courses, &$instructors)
    {
        // Step 1
        $names = array();
        $emails = array();
        $ids = array();
        $course_count = 0;

        foreach ($entities as $attributes)
        {
            // Step 2
            $attributes[$this->instructor] = array();
            /*Get Instructor, if there is one then proceed*/
            $members = $attributes['members'];
            //print_r($members); // DEBUG 4/11/14
            if (empty($members)) // No data supplied for instructor - add a temporary fix
            {
                $members = array(array('first_name' => 'TBA', 'last_name' => 'TBA', 'id' => '00000000'));
                //$members = $attributes['members'];
            }
            else
            {
                foreach ($members as $member)
                {
                    $first_name = $member['first_name'];
                    $last_name = $member['last_name'];
                    $attributes['instructor'] = $first_name . " " . $last_name;
                    if (!in_array($attributes['instructor'], $names))
                    {
                        $names[] = $attributes['instructor'];
                        //The following statement is necessary so that the instructor's id is not divulged but at the same time they can
                        //be still uniquely identified.
                        $hash = do_hash($member['id'], 'md5');
                        $ids[] = $hash;
                        //$emails[] = $member->EMAIL;
                    }
                    // Step 3
                    unset($attributes['members']);
                }
                // Step 4
                /*Get Year and Quarter*/
                $value = $attributes['term'];
                $pattern = "/(?P<year>[[:digit:]]{4})(?P<quarter>[[:digit:]]{2})/";
                $success = preg_match($pattern, $value, $matches);
                if ($success)
                {
                    $attributes['year'] = $matches['year'];
                    $attributes['quarter'] = $matches['quarter'];
                }
                // Step 5
                unset($attributes['term']);

                // Step 6
                /*Get Dates : ####-##-##*/
                $start_date = $attributes['start_date'];
                $end_date = $attributes['end_date'];
                $pattern = "/([[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2})/";

                $success = preg_match($pattern, $start_date, $matches);
                if ($success)
                {
                    $attributes['start_date'] = $matches[1];
                }

                $success = preg_match($pattern, $end_date, $matches);
                if ($success)
                {
                    $attributes['end_date'] = $matches[1];
                }
                // Step 7
                //Find eval start based on 75% of days during the diff period between start and end dates
                // Here for legacy purposes. This algorithm is no longer used.
                $start = date_create($attributes['start_date']);
                $end = date_create($attributes['end_date']);
                $interval = date_diff($start, $end);
                $timespan = $interval->format('%a');
                $onepercent_days = $timespan / 100;
                $days_from_start = (int)($onepercent_days * 75);
                date_add($start, date_interval_create_from_date_string($days_from_start . ' days'));

                $eval_interval = date_diff($start, $end);
                $eval_timespan = $eval_interval->format('%a');
                if ($eval_timespan < 7)
                {
                    $diff = 7 - $eval_timespan;
                    date_sub($start, date_interval_create_from_date_string($diff . ' days'));
                }
                $attributes['eval_start_date'] = $start->format('Y-m-d');
                $attributes['eval_end_date'] = $end->format('Y-m-d');

                // Step 8
                /*Store the COURSE's attributes*/
                $courses[] = $attributes;
                $course_count++;
            }
        }
        // Step 9
        $instructor_count = count($names);

        // Step 10
        for ($i = 0; $i < $instructor_count; $i++)
        {
            $instructors[$names[$i]] = array($this->name => $names[$i], $this->username => $ids[$i]);//,'email' => $emails[$i]);
        }
    }

    public function GetQuarterSubjectInfo()
    {
        return array($this->year => $this->course_model->getCurrentYear(), $this->term => $this->course_model->getCurrentTerm(), "subjects" => $this->course_model->getCurrentSubjects());
    }

    public function GetFormattedTermData()
    {
        $newTermData[$this->term] = $this->course_model->termNumToName($this->course_model->getCurrentTerm());
        $newTermData['subjects'] = implode(', ', $this->course_model->getCurrentSubjects());
        return $newTermData;
    }
}