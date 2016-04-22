<?php
$pagetitle = 'Evaluation';
include 'header.php';

function PrintCheck($questions, $x, $val)
{
    if (array_key_exists('answer' . $x, $questions) && $questions['answer' . $x] == $val)
    {
        echo 'checked';
    }
}

?>

<div class="row top">
    <div class="col-md-12">
        <h1><i class="fa fa-file-text accent"></i>Course Evaluation</h1>
        <p><?php echo $message; ?></p>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <h2><?php echo $course->title; ?></h2>

        <h3><?php echo $course->tag(true) . ', ' . $course->termName() . ' ' . $course->year() . ' &mdash; ' . $course->instructorName(); ?></h3>
    </div>
</div>
<form id="evaluation" method="post" action="<?php echo base_url(); ?>evaluations/postback">
    <div class="table-responsive">
        <table id="evals-table" class="table">
            <thead>
            <tr class="legend">
                <th colspan="2"></th>
                <th id="legend-left" colspan="5">
                    <div class="pull-left">
                        <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
                        low
                    </div>
                    <div class="pull-right">
                        high
                        <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
                    </div>
                </th>
                <th></th>
            </tr>
            <tr>
                <th></th>
                <th>N/A</th>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>4</th>
                <th>5</th>
                <th>Comments</th>
            </tr>
            </thead>

            <tbody>
            <?php for ($i = 1; $i <= $num_questions; $i++)
            { ?>

                <tr>
                    <td class="description"><?php echo '<span class="num">' . $i . '.</span>' . $question['description' . $i] ?></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="0" <?php if ($questions['answer' . $x] == null)
                            {
                                echo 'checked';
                            } ?> /></label></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="1" <?php PrintCheck($question, $i, 1); ?> /></label></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="2" <?php PrintCheck($question, $i, 2); ?> /></label></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="3" <?php PrintCheck($question, $i, 3); ?> /></label></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="4" <?php PrintCheck($question, $i, 4); ?>/></label></td>
                    <td><label><input type="radio" name="question<?php echo $i ?>"
                                      value="5" <?php PrintCheck($question, $i, 5); ?> /></label></td>
                    <input type="hidden" name="q_id<?php echo $i ?>" value=<?php echo $question['q_id' . $i] ?>>
                    <td><textarea class="form-control comment-box" rows="2" placeholder="&hellip;"
                                  name="comment<?php echo $i ?>"><?php
                            if (!empty($question['comment' . $i]))
                            {
                                echo $question['comment' . $i];
                            }
                            ?></textarea></td>
                </tr>

            <?php } ?>
            </tbody>

            <input type="hidden" name="section_id" value=<?php echo $section_id ?>>
            <input type="hidden" name="num_questions" value=<?php echo $num_questions ?>>
            <?php if ($viewingType != 'admin') : ?>
                <input type="hidden" id="unsaved_changes" value="0">
            <?php endif; ?>
        </table>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4>General Comments</h4>
            <textarea id="comments" class="form-control" rows="7" name="comments"
                      placeholder="&hellip;"><?php if (!empty($comments))
                {
                    echo $comments;
                } ?></textarea>
        </div>
    </div>

    <div class="row">
        <?php if ($viewingType == 'student') : ?>
            <input type="submit" name="save" value="Save" class="btn btn-default btn-lg" id="saveButton"/>
            <input type="submit" name="submit" value="Submit" class="btn btn-primary btn-lg" id="submitButton"/>
        <?php else : ?>
            <input type="button" value="Save" class="btn btn-default btn-lg" disabled/>
            <input type="button" value="Submit" class="btn btn-primary btn-lg" disabled/>
        <?php endif; ?>
    </div>
</form>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#submitButton').click(function () {
            return confirm("After submitting, no further changes can be made. Are you sure you want to submit?");
        });

        $('input').change(function () {
            $('#unsaved_changes').val('1');
        });

        $('#saveButton, #submitButton').click(function () {
            $('#unsaved_changes').val('0');
        });

        window.onbeforeunload = function () {
            if ($('#unsaved_changes').val() === '1') {
                return 'You have unsaved changes.';
            }
            return null;
        };
    });
</script>
</body>
</html>