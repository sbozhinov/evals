<?php
	$pagetitle = 'Delete Courses';
	$scripts = array('delete_courses_view.js');
	include 'header.php';
?>

<div class="row">
	<div class="col-md-8">
		<h1><span class="glyphicon glyphicon-user accent" aria-hidden="true"></span>Delete Courses</h1>
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
			<button id="DeleteButton" class="btn btn-danger">Delete</button>
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
				<li>This page allows the administrator to delete a course so that it will not be evaluated.</li>
				<li>To delete a course select the course you want to delete and click "Delete".</li>
			</ul>
			<h2>Notes</h2>
			<ul>
				<li>Once a course has been deleted refresh the page to see the changes.</li>
			</ul>
		</div>
	</div>
</div>

<div id="report_url" data-url="<?php echo $url?>"></div>