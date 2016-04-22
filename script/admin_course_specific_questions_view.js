$(document).ready(function () {
    sortList();
    setupDefaultHandlers();

    // handle 'check all' buttons
    $('#checkAll').click(handleCheckAll);
    $('#checkAllMod').click(handleCheckAll);

    var type, description;
    type = $('#questionType');
    description = $('#questionDescription');

    // check to see if a box is unselected and unselect the checkAll box
    $(':checkbox').change(function () {
        if (!this.checked) {
            $('#checkAll').prop('checked', false);
        }
    });

    function clearErrors() {
        description.parent().removeClass('has-error');
        updateTips('All fields required', false);
    }

    function uncheckAll() {
        uncheckBoxes();
        $('#checkAll').prop('checked', false);
    }

    function modifyQuestionOpen() {
        loopThroughSelectedOptions(function (opt) {
            var typeName, selectedCourses, i, courseSelector;
            typeName = parseGivenIndex(opt.text, 0);
            type.val(globalUtil.typeNameToNum(typeName));
            description.val(parseGivenIndex(opt.text, 1));

            selectedCourses = opt.value.split('_');
            for (i = 1; i < selectedCourses.length; i += 1) {
                courseSelector = '#section' + selectedCourses[i];
                $(courseSelector).prop('checked', true);
            }
        });
    }

    function addQuestionSubmit(e) {
        e.preventDefault();
        clearErrors();

        var valid, checkedBoxes;
        valid = checkLength(description, 0) && checkUnderscore(description) && checkedBoxesExist();
        checkedBoxes = getCheckedBoxes();

        if (!valid) {
            return;
        }

        $.ajax({
            url: 'course_questions/AddQuestion',
            data: {
                type: type.val(),
                description: description.val(),
                courses: checkedBoxes
            },
            type: 'POST',
            success: function (data) {
                if (data === 0) {
                    alert('That question is already a required question or an instructor question.\n\n' +
                    'Required questions will appear on all course evaluations.\n\n' +
                    'You can delete an instructor question and add it as a department question.\n\t' +
                    '* Be sure to check the instructor\'s course checkbox so that it is available to them.');
                } else {
                    var text, value;
                    text = globalUtil.typeNumToName(type.val()) + '_' + description.val();
                    value = data + '_' + checkedBoxes.join('_');

                    addOptionToList(text, value);
                    sortList();
                }
                uncheckAll(false);
                description.val('');
                type.val('departmental');
            },
            error: handleError
        });

        $('#addModal').modal('hide');
    }

    function removeQuestionSubmit() {
        loopThroughSelectedOptions(function (opt) {
            $.ajax({
                url: 'course_questions/RemoveQuestion',
                data: 'q_id=' + parseQid(opt.value),
                type: 'POST',
                success: function (data) {
                    loopThroughOptions(function (opt, list, index) {
                        if (parseQid(opt.value) === data) {
                            list.remove(index);
                        }
                    });
                }
            });
        });

        $('#removeModal').modal('hide');
    }

    function modifyQuestionSubmit(e) {
        e.preventDefault();
        clearErrors();

        var valid, qidMod, checkedBoxes;
        valid = checkLength(description, 0) && checkUnderscore(description) && checkedBoxesExist();
        qidMod = parseQid(getFirstSelectedOption());
        checkedBoxes = getCheckedBoxes();

        if (!valid) {
            return;
        }

        $.ajax({
            url: 'course_questions/ModifyQuestion',
            data: {
                typeMod: type.val(),
                descriptionMod: description.val(),
                courses: checkedBoxes,
                qid: qidMod
            },
            type: 'POST',
            success: function (data) {
                if (data === 0) {
                    alert('That question is already a required question or an instructor question.\n\n' +
                    'Required questions will appear on all course evaluations.\n\n' +
                    'You can delete an instructor question and add it as a department question.\n\t' +
                    '* Be sure to check the instructor\'s course checkbox so that it is available to them.');
                } else {
                    loopThroughOptions(function (opt, list, index) {
                        if (parseQid(opt.value) === qidMod) {
                            list.remove(index);
                        }
                    });

                    var text, value;
                    text = globalUtil.typeNumToName(type.val()) + '_' + description.val();
                    value = data + '_' + checkedBoxes.join('_');

                    addOptionToList(text, value);
                    sortList();
                }
                description.val('');
                uncheckAll(true);
            },
            error: handleError
        });

        $('#addModal').modal('hide');
    }

    function triggerAddModal(isAdd, event) {
        var alertBox, modal, words;
        alertBox = $('#selectionAlert');

        uncheckAll(false);
        clearErrors();
        $('#questionDescription').val('');

        modal = $('#addModal');
        words = isAdd ? 'Add question' : 'Modify question';
        alertBox.hide();

        modal.find('.modal-title').text(words);
        modal.find('.modal-footer .btn-primary').text(words);
        modal.find('#modalOperation').val(isAdd ? 'add' : 'modify');

        // modification
        if (!isAdd) {
            // load selection
            modifyQuestionOpen();

            // trying to modify with nothing selected
            if (!listItemIsSelected()) {
                alertBox.show();
                event.preventDefault();
            }
        }
    }

    // new modal
    $('#addModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        triggerAddModal(button.data('operation') === 'add', event);
    });

    $('#addModalSubmit').click(function (e) {
        if ($('#modalOperation').val() === 'add') {
            addQuestionSubmit(e);
        } else {
            modifyQuestionSubmit(e);
        }
    });

    $('#removeModalSubmit').click(removeQuestionSubmit);

    $('#mainSelect').dblclick(function () {
        $('#mainSelect option:selected').each(function () {
            $('#addModal').modal('show');
            triggerAddModal(false);
        });
    });
});