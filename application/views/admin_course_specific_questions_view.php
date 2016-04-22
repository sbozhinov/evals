<?php
    $pagetitle = 'Course Questions';
    $scripts = array('core.js', 'admin_course_specific_questions_view.js');
    include 'header.php';

    function printCheckboxNew($sect_id, $csub, $cnum, $csect, $title)
    {
        $fancyid = $csub . $cnum . '-' . sprintf('%02d', $csect);
        echo "<input type='checkbox' name='course' value='$sect_id' class='sectionQuestionBox' id='section$sect_id'>";
        echo "$fancyid: $title";
    }

?>

<div class="row">
    <div class="col-md-8">
        <div class="alert alert-danger alert-dismissible" role="alert" id="selectionAlert" hidden>
            <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Wait!</strong> You must select a question.
        </div>

        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="addModalLabel">Add question</h4>
                    </div>
                    <div class="modal-body">
                        <div id="addModalAlert" class="alert alert-info" role="alert">All fields required.</div>
                        <form>
                            <div class="form-group">
                                <label for="questionType" class="control-label">Type:</label>
                                <select class="form-control" name="questionType" id="questionType">
                                    <option value="1">Optional</option>
                                    <option value="3">Departmental</option>
                                    <option value="2">ABET</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="questionDescription" class="control-label">Question:</label>
                                <input type="text" class="form-control" name="questionDescription" id="questionDescription">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Courses:</label>
                                <div id="checkboxList" class="well">
                                    <ul class="list-group">
                                        <li class="list-group-item active">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="checkAll" value="Check / Uncheck All" class="sectionQuestionBox" id="checkAll" >
                                                    Check / Uncheck All
                                                </label>
                                            </div>
                                        </li>
<?php foreach ($results2 as $row) : ?>
                                        <li class="list-group-item">
                                            <div class="checkbox">
                                                <label>
<?php printCheckboxNew($row['section_id'], $row['course_subject'], $row['course_num'], $row['course_section'], $row['title']); ?>
                                                </label>
                                            </div>
                                        </li>
<?php endforeach; ?>
                                    </ul>
                                </div>
                            </div>
                            <input type="hidden" id="modalOperation" value="add">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="addModalSubmit" type="button" class="btn btn-primary">Add question</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="removeModal" tabindex="-1" role="dialog" aria-labelledby="removeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="removeModalLabel">Remove question</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to remove this question?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button id="removeModalSubmit" type="button" class="btn btn-danger">Remove question</button>
                    </div>
                </div>
            </div>
        </div>
        
        <h1><span class="glyphicon glyphicon-question-sign accent" aria-hidden="true"></span>Course Questions</h1>
        <select name="ListBox1" id="mainSelect" size="10" style="width: 100%;  overflow-x: scroll; overflow: -moz-scrollbars-horizontal;">
            <?php

            foreach ($questions as $qid => $data)
            {
                $sections = implode('_', $data['sections']);
                $type = $data['type'];
                $descr = $data['description'];
                echo "<option value='$qid"."_$sections'>$type"."_$descr</option>";
            }

            ?>
        </select>

        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal" data-operation="add">Add</button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addModal" data-operation="modify">Modify</button>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#removeModal">Remove</button>
    </div>
    <div class="col-md-4">
        <div id="sidebar">
            <h2>Directions</h2>
            <ul>
                <li>This page allows the administrator to add, modify, or remove course-specific questions (ABET, departmental, or optional).</li>
                <li>To add a question: click "Add", fill in the required fields, and click "Add Question".</li>
                <li>To modify a question: click on the question you want to modify and click "Modify", or you can double click the question in the list box.</li>
                <li>To remove a question: click on the question you want to remove and click "Remove".</li>
            </ul>
        </div>
    </div>
</div>