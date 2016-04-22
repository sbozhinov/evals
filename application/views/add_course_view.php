<?php
	$pagetitle = 'Add Courses';
	$scripts = array('add_course_view.js');
	include 'header.php';
?>

<div class="row">
	<div class="col-md-8">
		<h1><span class="glyphicon glyphicon-book accent" aria-hidden="true"></span>Add Courses</h1>
		<div class="post">
			<h3>Add a Course:</h3>
			<button id="AddButton" class="btn btn-default">Add</button>
			<form id="add_course" method="post">
			<div class="row">
				<div class="col-md-12">
					<h4>Course Title</h4>
					<input id="title" class="form-control" rows="1" name="title" id="course_title"></input>
				</div>

				<div class="col-md-12">
					<h4>Course Department</h4>
					<input id="department" class="form-control" rows="1" name="dept" id="course_dept"></input>
				</div>

				<div class="col-md-12">
					<h4>Course Number</h4>
					<input id="course_num" class="form-control" rows="1" name="num" id="course_num"></input>
				</div>

				<div class="col-md-12">
					<h4>Section Number</h4>
					<input id="section_num" class="form-control" rows="1" name="section"></input>
				</div>

				<div class="col-md-12">
					<h4>Existing Instructor</h4>
					<input id="instructor" class="form-control" rows="1" name="instructor"></input>
				</div>

				<div class="col-md-12">
					<h4>Create New Instructor</h4>
					<button id="AddInstructorButton" class="btn btn-default">New Instructor</button>
				</div>

				<div class="col-md-12">
					<h4>Students</h4>
					<h6>Enter the student id's of all students allowed to evaluate the course as a comma seperated list.</h6>
					<input id="studentIDs" class="form-control" rows="3" name="studentIDs"></input>
				</div>
			</form>
			</div>

			<div style="clear:both"></div>
			<button id="AddButton" class="btn btn-default">Add</button>
			
		</div>
	</div>

	<div class="col-md-4">
		<div id="sidebar">
			<h2>Directions</h2>
			<ul>
				<li>This page allows the administrator to add a course so that it will be evaluated.</li>
				<li>To add a course enter all of the corresponding data and click "Add".</li>
			</ul>
		</div>
	</div>
</div>
