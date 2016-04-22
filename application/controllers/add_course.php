<?php if (!defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

//class for the adding the admin
class add_course extends MY_Controller
{
	public function index()
    {
    	$this->load->view('add_course_view');
    }
}