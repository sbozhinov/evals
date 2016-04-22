<?php
    $pagetitle = ($required) ? 'Required Questions' : 'Optional Questions';
    $scripts = array('core.js', 'admin_questions_view.js');
    include 'header.php';
?>

<!-- TODO set limit on how long a question can be, i.e. no hundred character question, maybe 50 at most -->

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
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="calculated" id="calculatedYes" value="Calculated">
                                        This question <strong>will</strong> be used in calculations for instructor-specific metrics 
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="calculated" id="calculatedNo" value="Not Calculated" checked>
                                        This question <strong>will not</strong> be used for such metrics
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="questionDescription" class="control-label">Question:</label>
                                <input type="text" class="form-control" name="questionDescription" id="questionDescription">
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
        
        <h1><span class="glyphicon glyphicon-question-sign accent" aria-hidden="true"></span><?php echo $pagetitle; ?></h1>
        <select name="lstboxQuestions" id="mainSelect" size="10" style="width: 100%;  overflow-x: scroll; overflow: -moz-scrollbars-horizontal;">
            <?php
            $c = "";
            foreach($results as $row)
            {
                if($row['tenure'] == 1)
                    $c = "***";
                else
                    $c = "##";

                echo "<option value=".$row['q_id'].">". $row['type'] ."_". $c ."_". $row['description']. "</option>";
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
                <li>This page allows the administrator to add, modify, or remove questions which will be <?php echo ($required) ? 'required' : 'optional'; ?> on all evaluations.</li>
                <li>To add a question: click "Add", fill in the required fields, and click "Add Question".</li>
                <li>To modify a question: click on the question you want to modify and click "Modify", or you can double click the question in the list box.</li>
                <li>To remove a question: click on the question you want to remove and click "Remove".</li>
            </ul>
        </div>
    </div>
</div>