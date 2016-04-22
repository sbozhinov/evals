<?php if (!defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

//class for the adding the admin
class delete_course extends MY_Controller
{
	public function index()
    {
        MY_Controller::getCourse("delete_course_view");
    }   

        /*
     * Name: queryInstructor
     * Description: getting all of the courses by instructor
     * Parameters: None
     * Return: None
     * Documentation Modified: 4/5/14 (MW)
     */
    public function queryInstructor()
    {
        ob_clean();
        //ajax post back for inst
        $instructor = $this->input->post('instructor');

        $results = $this->course_model->getCoursesByInst($instructor);
        $i = 0;
        foreach ($results as $row)
        {
            $rows['course' . $i] = $row;
            $i++;
        }
        $data['courses'] = $rows;
        $data['count'] = $i;

        echo json_encode($data);
    }

    public function queryCourseNumber()
    {
        ob_clean();
        //ajax post back variables
        $courseNum = $this->input->post('courseNum');


        $data = array('course_num' => "$courseNum");
        $results = $this->course_model->getCoursesByData($data);

        $i = 0;
        foreach ($results as $row)
        {
            $rows['course' . $i] = $row;
            $i++;
        }
        $data['courses'] = $rows;
        $data['count'] = $i;

        echo json_encode($data);
    }

    /*
     * Name: querySubject
     * Description: getting all of the courses by section number and instructor
     * Parameters: None
     * Return: None
     * Documentation Modified: 4/5/14 (MW)
     */
    public function querySubject()
    {
        ob_clean();
        //ajax post back variables
        $subject = $this->input->post('subject');
        //checking to see if * is selected

        $data = array('course_subject' => "$subject");
        $results = $this->course_model->getCoursesByData($data);

        $i = 0;
        foreach ($results as $row)
        {
            $rows['course' . $i] = $row;
            $i++;
        }
        $data['courses'] = $rows;
        $data['count'] = $i;

        echo json_encode($data);
    }

}