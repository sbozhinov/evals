<?php
	$pagetitle = 'Duplicate Courses';
	$scripts = array('duplicate_courses_view.js');
	include 'header.php';
?>

<div class="row">
	<div class="col-md-8">
		<h1><span class="glyphicon glyphicon-user accent" aria-hidden="true"></span>Duplicate Courses</h1>
		<div class="post">
			<h3>Select a Course:</h3>

			<label id="instructorLabel" class="alignLabel">Instructor</label>
			<select name="instructor" id="instructor" class="alignBox">
				<option value="*">*</option>
				<?php
				for($i = 0; $i<$inst_dist;$i++)
				{
					echo "<option>" . $course['distInst'.$i] . "</option>";
				}
				?>
			</select>
			<label id="subjectLabel" class="alignLabel">Subject</label>
			<select name="subject" id="subject" class="alignBox">
				<option value="*">*</option>
				<?php
				for($i = 0; $i<$sub_dist;$i++)
				{
					echo "<option>" . $course['distSub'.$i] . "</option>";
				}
				?>
			</select>
			<label id="courseLabel" class="alignLabel">Course Number</label>
			<select name="courseNumber" id="courseNumber" class="alignBox">
				<option value="*">*</option>
				<?php
				for($i = 0; $i<$num_dist;$i++)
				{
					echo "<option>" . $course['distNum'.$i] . "</option>";
				}
				?>
			</select>
			
			
			<div style="clear:both"></div>
			<button id="DuplicateButton" class="btn btn-danger">Duplicate</button>
			<select id="mainSelect" size="10" multiple="multiple">
				<?php
				for($i = 0;$i<$num_course;$i++)
				{
					echo "<option value="
						. $course['c_id'.$i] . ">"
						. $course['year'.$i] . " "
						. $course['quarter'.$i] . " "
						. $course['subject'.$i] . " "
						. $course['number'.$i] . "-"
						. $course['section'.$i] . " "
						. $course['title'.$i] . " "
						. $course['instructor'.$i]
						. "</option>";
				}
				?>
			</select>
		</div>
	</div>

	<div class="col-md-4">
		<div id="sidebar">
			<h2>Directions</h2>
			<ul>
				<li>This page allows the administrator to duplicate a course in the case that there are multiple instructors so that it can be evaluated multiple times, once for each instructor.</li>
				<li>To duplicate a course select the course you want to duplicate and click "Duplicate" follow the instructions to add a new instructor to the duplicate course.</li>
			</ul>
			<h2>Notes</h2>
			<ul>
				<li>Once a course has been duplicated refresh the page to see the changes.</li>
			</ul>
		</div>
	</div>
</div>

