$(document).ready(function () {
    sortList();
    setupDefaultHandlers();

    var description = $('#questionDescription');

    function clearErrors() {
        description.parent().removeClass('has-error');
        updateTips('All fields required', false);
    }

    function parseCalcString(value) {
        return parseGivenIndex(value, 1);
    }

    function parseDescription(value) {
        return parseGivenIndex(value, 2);
    }

    function getCalcString(isCalculated) {
        return isCalculated ? '***' : '##';
    }

    function modifyQuestionOpen() {
        loopThroughSelectedOptions(function (opt) {
            if (parseCalcString(opt.text) === '***') {
                document.getElementById('calculatedYes').checked = true;
            } else {
                document.getElementById('calculatedNo').checked = true;
            }

            $('#questionDescription').val(parseDescription(opt.text));
        });
    }

    function addQuestionSubmit(e) {
        e.preventDefault();
        clearErrors();

        var valid, calc;
        valid = checkLength(description, 0) && checkUnderscore(description);
        calc = (document.getElementById('calculatedYes').checked) ? 1 : 0;

        if (!valid) {
            return;
        }

        $.ajax({
            url: 'AddQuestion',
            data: {
                calculated: calc,
                description: description.val()
            },
            type: 'POST',
            success: function (data) {
                if (data === 0) {
                    alert('That question is already a department question or instructor question.\nPlease remove that question and then try to add it again.');
                } else if (data === -1) {
                    alert('That question is already a required question.');
                } else {
                    addOptionToList('required_' + getCalcString(calc) + '_' + description.val(), data);
                }
                description.val('');
            },
            error: handleError
        });

        $('#addModal').modal('hide');
    }

    function removeQuestionSubmit() {
        loopThroughSelectedOptions(function (opt) {
            $.ajax({
                url: 'RemoveQuestion',
                data: 'q_id=' + opt.value,
                type: 'POST',
                success: function (data) {
                    loopThroughOptions(function (opt, list, index) {
                        if (opt.value === data) {
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

        var valid, calc, qidMod;
        valid = checkLength(description, 0) && checkUnderscore(description);
        calc = (idIsChecked('calculatedYes')) ? 1 : 0;
        qidMod = getFirstSelectedOption();

        if (!valid) {
            return;
        }

        $.ajax({
            url: 'ModifyQuestion',
            data: {
                calculated: calc,
                description: description.val(),
                qid: qidMod
            },
            type: 'POST',
            success: function (data) {
                if (data === 0) {
                    alert('That question is already a department question or instructor question.\nPlease remove that question and then try to add it again.');
                } else if (data === -1) {
                    alert('That question is already a required question.');
                } else {
                    loopThroughOptions(function (opt, list, index) {
                        if (parseQid(opt.value) === qidMod) {
                            list.remove(index);
                        }
                    });
                    addOptionToList('required_' + getCalcString(calc) + '_' + description.val(), data);
                }
                description.val('');
            },
            error: handleError
        });

        $('#addModal').modal('hide');
    }

    function triggerAddModal(isAdd, event) {
        var alertBox, modal, words;
        alertBox = $('#selectionAlert');

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