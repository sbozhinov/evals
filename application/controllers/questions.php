<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
    
    class questions extends MY_Controller
	{
		public function __construct()
		{
			parent::__construct();
			$this->load->model("questions_model");
			$this->load->model("course_model");
		}	
		
		public function required()
		{
			$data['required'] = true;
			$data['results'] = $this->questions_model->getRequiredQuestions();
			$this->load->view('admin_questions_view', $data);
		}

		public function optional()
		{
			$data['required'] = false;
			$data['results'] = $this->questions_model->getOptionalQuestions();
			$this->load->view('admin_questions_view', $data);
		}

		/*
		 * Name: AddQuestion
		 * Description: add a question
		 * Parameters: None
		 * Return: None
		 * Documentation Modified: 4/5/14 (MW)
		 */
		public function AddQuestion()
		{
			ob_clean();
			$calculated = $this->input->post('calculated');
			$description = $this->input->post('description');		
			$notDup = $this->questions_model->checkDup($description);

			if($notDup)
			{
				$qid = $this->questions_model->addQuestion($description, 0, $calculated, 'admin');
				echo $qid;
			}
				
			else 
			{
				if($this->questions_model->isARequiredQuestion($description))
				{
					echo -1;
				}				
				else 
				{
					$notValid = 0;
					echo $notValid;
				}				
			}	
		}
		/*
		 * Name: ModifyQuestion
		 * Description: Modifies a question
		 * Parameters: None
		 * Return: None
		 * Documentation Modified: 4/5/14 (MW)
		 */
		public function ModifyQuestion()
		{
			ob_clean();
			$calculated = $this->input->post('calculated');
			$description = $this->input->post('descriptionMod');
			$qid = $this->input->post('qid');
			
			$notDup = $this->questions_model->checkDupOnMod($qid, $description);
			
			if ($notDup)
			{
				$this->questions_model->deleteQuestion($qid);
				$this->questions_model->deleteFromCourseSpecific($qid);
				$newQid = $this->questions_model->addQuestion($description, 0, $calculated, "admin");				
				echo $newQid;
			}			
			else 
			{
				if($this->questions_model->isARequiredQuestion($description))
				{
					echo -1;
				}				
				else 
				{
					$notValid = 0;
					echo $notValid;
				}
			}
			
		}
		/*
		 * Name: RemoveQuestion
		 * Description: removes question
		 * Parameters: None
		 * Return: None
		 * Documentation Modified: 4/5/14 (MW)
		 */
		
		public function RemoveQuestion()
		{
			ob_clean();
			$q_id = $this->input->post('q_id');
			$this->questions_model->deleteQuestion($q_id);
		    echo $q_id;
		}
	}