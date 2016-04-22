$(document).ready(function () {
    //sorting the list box that holds the admins
    sortList();

    //fetching the variables from the inputs from the add user form
    var name = $("#fName"),
        UserName = $("#UserName"),
        Email = $("#Email"),
        allFields = $([]).add(name).add(UserName).add(Email);

    //variable to hold the name of the admins
    var oldName, oldUserName, oldEmail;

    //fetching the variables from the inputs from the modify user form
    var modName = $("#modName"),
        modUserName = $("#modUserName"),
        modEmail = $("#modEmail"),
        modAllFields = $([]).add(modName).add(modUserName).add(modEmail);

    //resizing all of the elements on the page
    $('#AdminHeader').resize();
    $('#HomeButton').resize();
    $('#ModifyButton').resize();
    $('#RemoveButton').resize();
    $('#selectAdmin').resize();

    //gets the validateTips class
    tips = $(".validateTips");
    //updating the <p> field on top of the dialog box
    function updateTips(t) {
        tips
            .text(t)
            .addClass("ui-state-highlight");
        setTimeout(function () {
            tips.removeClass("ui-state-highlight", 1500);
        }, 500);
    }

    //checking length of input from user
    function checkLength(o, min, n) {
        if (o.val().length < min) {
            o.addClass("ui-state-error");
            updateTips("Length of " + n + " must be greater than " + min + ".");
            return false;
        }
        else {
            return true;
        }
    }

    //making sure the user inputs the right data
    function checkRegexp(o, regexp, n) {
        if (!( regexp.test(o.val()) )) {
            o.addClass("ui-state-error");
            updateTips(n);
            return false;
        }
        else {
            return true;
        }
    }

    //checking to see if the listbox is empty
    function checkListBox() {
        var listBox = document.getElementById("selectAdmin");
        if (listBox.options.length == 0) {
            return true;
        }
        else {
            var x;
            for (x = 0; x < listBox.options.length; x++) {
                if (listBox.options[x].selected == true) {
                    return false;
                }
            }
            return true;
        }
    }

    //compareTo for admins for sorting by last name
    function customSortByLastName(a, b) {
        if (a.lName > b.lName) {
            return 1;
        }

        else if (a.lName < b.lName) {
            return -1;
        }

        return 0;
    }

    //sorting function for the admins list bos
    function sortList() {
        var list = document.getElementById("selectAdmin");
        var ara = new Array();
        var array;
        var str;

        //traversing through the list box
        for (i = 0; i < list.options.length; i++) {
            //checking to see if the item in the list box is add and creating a name object
            if (list.options[i].text == "add") {
                ara[i] = new Name("add", "", "");
            }
            else {
                //splitting the name of the admin into first and last name
                array = list.options[i].text.split(" ")
                str = list.options[i].value;
                //creating a new name object and storing it into an array
                ara[i] = new Name(array[0], array[1], str);
            }
        }

        //sorting the array with a custom sort function
        ara.sort(customSortByLastName);

        //redefining the text and values of the list box in sorted order
        for (i = 0; i < list.length; i++) {
            list.options[i].text = ara[i].fName + " " + ara[i].lName;
            list.options[i].value = ara[i].value;
        }

    }//end sortList()


    //Name used for sorting in the listbox
    function Name(f, l, v) {
        this.fName = f;
        this.lName = l;
        this.value = v;
    }

    //this is the add user dialog with functionality
    $("#Add-User").dialog({
        autoOpen: false,
        height: 405,
        width: 350,
        modal: true,
        resizable: false,


        //create admin button on form
        buttons: {
            "Create an Admin": function (e) {
                //preventing the dialog from doing the default actions
                e.preventDefault();
                var bValid = true;
                var secValid = true;
                //removing the state error class from all inputs
                allFields.removeClass("ui-state-error");

                //checking to make sure the inputs are the right length
                bValid = bValid && checkLength(name, 0, "Name");
                bValid = bValid && checkLength(UserName, 0, "UserName");
                bValid = bValid && checkLength(Email, 0, "Email");

                //checking to make sure the inputs match the desired input
                bValid = bValid && checkRegexp(name, /^[a-z]*[" "][a-z]+$/i, "Name must be first and last seperated by a space, begin with a letter.");
                bValid = bValid && checkRegexp(UserName, /^[a-z]([0-9a-z_])+$/i, "This UserName is the same as your NET ID");
                bValid = bValid && checkRegexp(Email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com");
                if (bValid) {
                    //setting up the variables to be pasted into the addAdmin function in controller
                    var ara = {
                        fname: name.val(),
                        username: UserName.val(),
                        email: Email.val()
                    };

                    //ajax post back with url of controller and method
                    $.ajax({
                        url: 'admins/addAdmin',
                        data: ara,
                        type: 'POST',
                        dataType: 'JSON',
                        //on success the listbox is updated with the data from the method inside the controller
                        success: function (data) {
                            if (data == 0) {
                                alert("Multiple admins can't have same username or name.");
                            }
                            else {
                                //setting up the string for the value of the option in list box
                                var string = data.user + "|" + data.email;
                                //this selects the listbox element
                                var selField = document.getElementById("selectAdmin");
                                //this selects the options inside the listbox element
                                var oOption = document.createElement("OPTION");
                                //adding the option to the listbox
                                selField.options.add(oOption);
                                oOption.text = data.name;
                                oOption.value = string;
                                //sorting the list right after element is added
                                sortList();
                            }

                        },
                        //error checker
                        error: function (data, textStatus, errorThrown) {
                            alert("Text Status: " + textStatus + " Error: " + errorThrown);
                        }
                    });

                    $(this).dialog("close");

                }
            },
            //cancel button
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        close: function () {
            //removing the error class and setting all values in the dialog form to empty
            allFields.removeClass("ui-state-error");
            name.val('');
            UserName.val('');
            Email.val('');
        }
    });

    //this is the add user dialog with functionality
    $("#Modify-User").dialog({
        autoOpen: false,
        height: 405,
        width: 350,
        modal: true,
        resizable: false,

        //when the dialog is opened the list box option that was selected will be populated into the dialog form
        open: function () {

            var list = document.getElementById("selectAdmin");
            var str, array;
            for (var count = list.options.length - 1; count >= 0; count--) {
                //checking to see if the listbox option was selected
                if (list.options[count].selected == true) {
                    //get the different parts of the admin
                    str = list.options[count].text;
                    modName.val(str);
                    oldName = str;
                    str = list.options[count].value;
                    array = str.split("|");
                    oldUserName = array[0];
                    oldEmail = array[1];
                    modUserName.val(array[0]);
                    modEmail.val(array[1]);
                }//end if

            }
        },

        //create admin button on form
        buttons: {
            "Modify an Admin": function (e) {
                e.preventDefault();
                var bValid = true;
                //removing the state error class from all inputs
                allFields.removeClass("ui-state-error");

                //checking to make sure the inputs are the right length
                bValid = bValid && checkLength(modName, 0, "modName");
                bValid = bValid && checkLength(modUserName, 0, "modUserName");
                bValid = bValid && checkLength(modEmail, 0, "modEmail");

                //checking to make sure the inputs match the desired input
                bValid = bValid && checkRegexp(modName, /^[a-z]*[" "][a-z]+$/i, "Name must be first and last seperated by a space, begin with a letter.");
                bValid = bValid && checkRegexp(modUserName, /^[a-z]([0-9a-z_])+$/i, "This UserName is the same as your NET ID");
                bValid = bValid && checkRegexp(modEmail, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com");

                if (bValid) {
                    //setting up the variables to be pasted into the modifyAdmin function in controller
                    var ara = {
                        name: modName.val(),
                        username: modUserName.val(),
                        email: modEmail.val(),
                        oldName: oldName,
                        oldUserName: oldUserName,
                        oldEmail: oldEmail
                    };

                    //ajax post back with url of controller and method
                    $.ajax({
                        url: 'admins/modifyAdmin',
                        data: ara,
                        type: 'POST',
                        dataType: 'JSON',
                        //on success the listbox is updated with the data from the method inside the controller
                        success: function (data) {
                            if (data == 0) {
                                alert("Multiple admins can't have same username or name.");
                            }
                            else {
                                //setting up the value for the option in list box
                                var string = data.user + "|" + data.email;
                                //this selects the listbox element
                                var selField = document.getElementById("selectAdmin");
                                //this selects the options inside the listbox element
                                var oOption = document.createElement("OPTION");
                                //removing the old option from the listbox
                                for (var cnt = 0; cnt < selField.options.length; cnt++) {
                                    if (selField.options[cnt].text == oldName) {
                                        selField.remove(cnt, null);
                                    }
                                }
                                //adding the option to the listbox
                                selField.options.add(oOption);
                                oOption.text = data.name;
                                oOption.value = string;
                                sortList();
                            }
                        },
                        //error checker
                        error: function (data, textStatus, errorThrown) {
                            alert("Text Status: " + textStatus + " Error: " + errorThrown);
                        }
                    });
                    $(this).dialog("close");
                }

            },
            //cancel button
            Cancel: function () {
                $(this).dialog("close");
            },
        },
        close: function () {
            //removing the error class and setting the dialog inputs to empty
            modAllFields.removeClass("ui-state-error");
            modName.val('');
            modUserName.val('');
            modEmail.val('');
        }
    });

    //removing user dialog
    $("#Remove-User").dialog({
        autoOpen: false,
        height: 170,
        width: 400,
        modal: true,
        resizable: false,

        //the yes button in dialog form
        buttons: {
            "Yes": function () {

                //selecting the listbox element
                var list = document.getElementById("selectAdmin");
                //for loop runing through all of the options in the listbox
                for (var count = list.options.length - 1; count >= 0; count--) {
                    //if the options is selected remove from the listbox
                    if (list.options[count].selected == true) {

                        //getting the actuall name inside the listbox and posting it to the controller method removeAdmin
                        var del = "name=" + list.options[count].text;
                        $.ajax({
                            url: 'admins/removeAdmin',
                            data: del,
                            type: 'POST',
                            //on success
                            success: function (data) {
                                var list = document.getElementById("selectAdmin");
                                //looping through the list box
                                for (var cnt = list.options.length - 1; cnt >= 0; cnt--) {
                                    //checking to see if the value inside the list box matches the data sent back
                                    if (list.options[cnt].text == data) {
                                        list.remove(cnt, null);
                                    }
                                }
                            }
                        });
                    }
                }
                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        close: function () {
        }
    });

    //add user form pops up when you click the add button
    $("#ModifyButton").click(function () {
        //checking to see if an item is selected in listbox
        if (checkListBox()) {
            alert("You must select an admin to modify.")
        }
        else {
            //traversing through the listbox
            var list = document.getElementById("selectAdmin");
            for (var count = list.options.length - 1; count >= 0; count--) {
                //if the item is selected
                if (list.options[count].selected == true) {
                    //getting the option text
                    str = list.options[count].text;
                    //checking to see if the item selected was add and then telling the user they need to select a user
                    if (str == "add") {
                        alert("Please select a user");
                    }
                    else {
                        //checking to see if selected item is the user themself and telling them they can't modify themselves
                        if (list.options[count].text == $("#name").val()) {
                            alert("Can't modify yourself")
                        }
                        else {
                            //if everything checks out then open the modify dialog
                            $("#Modify-User").dialog("open");
                        }
                    }

                }//end if

            }
        }
    });
    // remove user form pops up when you click the remove button
    $("#RemoveButton").click(function () {
        //checking to see if listbox is empty or someone is selected
        if (checkListBox()) {
            alert("You must select an admin to remove.");
        }
        else {
            //traversing through the listbox
            var list = document.getElementById("selectAdmin");
            var str;
            for (var count = list.options.length - 1; count >= 0; count--) {
                //checking to see if option is selected
                if (list.options[count].selected == true) {
                    //getting the list option text
                    str = list.options[count].text;
                    //if the text is equal to add telling the user to select an admin
                    if (str == "add") {
                        alert("Please select a user");
                    }
                    else {
                        //checking to see if the name they selected was themselves and if so telling them they can't remove that
                        if (str == $("#name").val()) {
                            alert("Can't remove yourself");
                        }
                        else {
                            //if everything checks out open the remove user dialog
                            $("#Remove-User").dialog("open");
                        }
                    }

                }//end if

            }

        }
    });
    //checking to see if an option inside the listbox is double clicked then calling the modify user form
    $("#selectAdmin").dblclick(function () {
        //traversing through the list and checking to see if the option was selected
        var list = document.getElementById("selectAdmin");
        for (var cnt = 0; cnt < list.options.length; cnt++) {
            //checking to see if option was selected
            if (list.options[cnt].selected) {
                //checking to see if the add was double clicked and if so opening up the add user dialog form
                if (list.options[cnt].text == "add") {
                    //add user dialog
                    $("#Add-User").dialog("open");
                }
                else {
                    //if user double clicks their name they can't modify it
                    if (list.options[cnt].text == $("#name").val()) {
                        alert("Can't modify yourself");
                    }
                    else {
                        //opening up modify user
                        $("#Modify-User").dialog("open");
                    }

                }
            }
        }
    });

    //for the dialog input fields when the user is focused on them the text at the top changes to specified text
    $("#fName").focus(function () {
        updateTips("Enter the first and last name separated by a space");
    });
    //add user dialog
    $("#UserName").focus(function () {
        updateTips("Enter the NET ID of the user");
    });
    //add user dialog
    $("#Email").focus(function () {
        updateTips("Enter the email of the user");
    });
    //modify user dialog
    $("#modName").focus(function () {
        updateTips("Enter the first and last name separated by a space");
    });
    //modify user dialog
    $("#modUserName").focus(function () {
        updateTips("Enter the NET ID of the user");
    });
    //modify user dialog
    $("#modEmail").focus(function () {
        updateTips("Enter the email of the user");
    });

});//end script