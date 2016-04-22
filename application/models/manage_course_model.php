<?php if (!defined('BASEPATH'))
{
    exit('No direct script access allowed');
}

class Manage_course_model extends CI_model
{
    public function __construct()
    {
        $this->load->database();
    }

    public function clean_up($section_id)
    {
        $this->db->where('section_id', $section_id);
        $this->db->delete('section');
    }

    public function update_inst($inst, $cid)
    {

        $instID = $this->getInstructorID($inst);

        // then set instructor to new instructor
        $data = array(
            'instructor' => $instID
        );

        $this->db->where('section_id', $cid);
        $this->db->update('section', $data);
    }

    public function duplicate_course($inst, $cid)
    {
        // first get all the class info
        $sub = $this->getSingleCourseSubject($cid);
        $num = $this->getSingleCourseNum($cid);
        $section = $this->getSingleCourseSection($cid);
        $term = $this->getSingleCourseTerm($cid);
        $title = $this->getSingleCourseTitle($cid);
        $startDate = $this->getSingleCourseStartDate($cid);
        $endDate = $this->getSingleCourseEndDate($cid);
        $startEval = $this->getSingleCourseEvalStart($cid);
        $endEval = $this->getSingleCourseEvalEnd($cid);
        $count = $this->getSingleCourseStudentCount($cid);
        $instID = $this->getInstructorID($inst);

        // insert tuple
        $data = array(
            'section_id'     => 'null',
            'course_subject' => $sub,
            'course_num'     => $num,
            'course_section' => $section,
            'term'           => $term,
            'title'          => $title,
            'instructor'     => $instID,
            'start_date'     => $startDate,
            'end_date'       => $endDate,
            'eval_start'     => $startEval,
            'eval_end'       => $endEval,
            'student_count'  => $count
        );

        $this->db->insert('section', $data);
        echo $this->db->last_query();
    }

    private function getInstructorID($inst)
    {
        // split into first and last name
        $firstLast = explode(' ', $inst);
        $first = $firstLast[0];
        $last = $firstLast[1];

        // get id of instructor using name
        $this->db->select('inst_id_hashed');
        $this->db->where('last_name', $last);
        $this->db->where('first_name', $first);

        return $this->db->get('instructor')->first_row()->inst_id_hashed;
    }

    private function getSingleCourseSubject($cid)
    {
        $this->db->select('course_subject');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->course_subject;
    }

    private function getSingleCourseNum($cid)
    {
        $this->db->select('course_num');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->course_num;
    }

    private function getSingleCourseSection($cid)
    {
        $this->db->select('course_section');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->course_section;
    }

    private function getSingleCourseTitle($cid)
    {
        $this->db->select('title');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->title;
    }

    private function getSingleCourseTerm($cid)
    {
        $this->db->select('term');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->term;
    }

    private function getSingleCourseStartDate($cid)
    {
        $this->db->select('start_date');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->start_date;
    }

    private function getSingleCourseEndDate($cid)
    {
        $this->db->select('end_date');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->end_date;
    }

    private function getSingleCourseEvalStart($cid)
    {
        $this->db->select('eval_start');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->eval_start;
    }

    private function getSingleCourseEvalEnd($cid)
    {
        $this->db->select('eval_end');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->eval_end;
    }

    private function getSingleCourseStudentCount($cid)
    {
        $this->db->select('student_count');
        $this->db->where('section_id', $cid);

        return $this->db->get('section')->first_row()->student_count;
    }
}

