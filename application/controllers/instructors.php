<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class instructors extends MY_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("course_model");
	}
	
	public function index()
	{
		$this->loadCourses();
	}
	
	/*
		 * Name: loadCourses
		 * Description: Loads the courses from the database. Also populates the drop-down lists for
		 * filtering the list based on instructor, course number, subject, quarter, or year.
		 * Parameters: None
		 * Return: Nonvoid - the collection of courses and the drop-down list contents
		 * Documentation Modified: 4/15/14 (LW)
		 *
		 * 1) Retrieve list of all courses from the database
		 * 2) Assign an English equivalent to the quarter attribute
		 * 3) Store all the course data in the $data variable
		 * 4) Populate instructor drop-down filter
		 * 5) Populate the course number drop-down filter
		 * 6) Populate the subject drop-down filter
		 * 7) Populate the year drop-down filter
		 * 8) Populate the quarter drop-down filter
		 */
	public function loadCourses()
	{
			//getting all of the courses
			$results= $this->course_model->allCourses();
			
			//for loop for all courses
			$i = 0;
			foreach ($results->result_array() as $row )
			{
				$term = $this->course_model->termNumToName($row['term']);

				$date = DateTime::createFromFormat("Y-m-d", $row['start_date']);
				$data['course']['year'.$i] = $date->format("Y");
				$data['course']['quarter'.$i] = $term;
				$data['course']['c_id'.$i] = $row['section_id'];
				$data['course']['instructor'.$i] = $row['first_name'] . ' ' . $row['last_name'];
				$data['course']['section'.$i] = $row['course_section'];
				$data['course']['number'.$i] = $row['course_num'];
				$data['course']['subject'.$i] = $row['course_subject'];
				$data['course']['title'.$i] = $row['title'];
				$i++;	
			}

			//getting just distinct instructors
			$res = $this->course_model->getDistinctInstructors();
			//distinct course values
			$j = 0;
			foreach($res as $tuple) // Populates "Instructor" drop-down filter
			{
				$data['course']['distInst'.$j] = $tuple['first_name'] . ' ' . $tuple['last_name'];
				$j++;
			}
			$data['inst_dist'] = $j;
			
			//getting just distinct numbers
			$res = $this->course_model->getDistinctNumbers();
			//distinct course values
			$j = 0;
			foreach($res as $tuple) // Populates "Course Number" drop-down filter
			{
				$data['course']['distNum'.$j] = $tuple['course_num'];
				$j++;
			}
			//distinct course value count
			$data['num_dist'] = $j;

			//get distinct section
			$res = $this->course_model->getDistinctSubjects();
			$j = 0;
			foreach($res as $tuple) // Populates "Subject" drop-down filter
			{
				$data['course']['distSub'.$j] = $tuple['course_subject'];
				$j++;
			}
			//distinct section value count
			$data['sub_dist'] = $j;
			
			//get distinct year
			$res = $this->course_model->getDistinctYears();
			$j = 0;
			foreach($res as $tuple) // Populates "Year" drop-down filter
			{
				$date = DateTime::createFromFormat("Y-m-d", $row['start_date']);
				$data['course']['distYear'.$j] = $date->format("Y");
				$j++;
			}
			//distinct year value count
			$data['year_dist'] = $j;
			
			//get distinct quarter
			$res = $this->course_model->getDistinctTerms();
			$j = 0;
			foreach($res as $row) // Populates "quarter" drop-down filter
			{
				$term = $this->course_model->termNumToName($row['term']);
				$data['course']['distQuar'.$j] = $term;
				$j++;
			}
			//distinct quarter value count
			$data['quar_dist'] = $j;
			$data['num_course'] = $i;
			$this->load->view("update_instructor_view", $data);
	}
	
	public function modifyInstructor()
	{
		ob_clean();
		$course = $this->input->post('course');
		$teacher = $this->input->post('instructor');
		//$matches;
		//preg_match("/^[a-z]*[" "][a-z]+$/", $courseInstructor[1], $matches);
		//if(count($matches) == 0) // Failure
	//	{
		//	echo 0;
		//}
		//else
		//{
			$courseArray = explode("_", $course);
			$this->course_model->updateInstructor($courseArray, $teacher);
		//}
	}
}