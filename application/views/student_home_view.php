<?php
$pagetitle = 'Course Evaluations';
include 'header.php';
?>

<div class="row">
    <div class="col-md-12">
        <?php if ($alert != null) : ?>
            <div class="alert <?php echo $alert_type; ?>" role="alert"><?php echo $alert; ?></div>
        <?php endif; ?>
        <h1><i class="fa fa-graduation-cap accent"></i>Course Evaluations</h1>
        <p><?php echo $message; ?></p>
    </div>
</div>

<!-- Student classes listed in a table. -->
<div class="table-responsive">
    <table id="evaluations-table" class="table">
        <thead>
        <tr>
            <th>Course Number</th>
            <th>Title</th>
            <th>Instructor</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($courses as $course)
        {
            $courseUrl = base_url() . 'evaluations/index/' . $course->section_id;
            $isUnavailable = ($course->status($student_id) == 'Submitted' || $course->status($student_id) == 'Unavailable');

            $beginLink = $isUnavailable ? '<span class="course-link">' : '<a class="course-link" href="'.$courseUrl.'">';
            $endLink = $isUnavailable ? '</span>' : '</a>';

            ?>
            <tr>
                <td><?php echo $beginLink . $course->tag(true) . $endLink; ?></td>
                <td><?php echo $beginLink . $course->title . $endLink; ?></td>
                <td><?php echo $course->instructorName(); ?> </td>
                <td><?php echo $course->status($student_id); ?> </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</div>
</body>
</html>