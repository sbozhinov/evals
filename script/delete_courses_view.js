$(document).ready(function(){
	sortLabel();
	var instructor = $("#instructor"),
	courseNumber = $("#courseNumber"),
    subject = $("#subject");

    function sortLabel()
	{
		var list = document.getElementById("instructor");
		var ara = new Array();
		var array;
		var str;
		
		for(var i = 0; i < list.options.length; i++)
		{
			if(list.options[i].text != "*")
			{
				array = list.options[i].text.split(" ");
				str = array[1];
				ara[i] = new Instructor(list.options[i].text, list.options[i].value, str);
			}
			else
			{
				ara[i] = new Instructor("*", "*", "A");
			}
		}
			
		
		ara.sort(customSortByLastName);
		
		for(var i=0; i < list.length; i++) 
		{
			list.options[i].text = ara[i].text;
			list.options[i].value = ara[i].value;
		}

	}
    	
   	//compareTo for questions for sorting by number
    function customSortByLastName(a, b)
	{	
		if (a.lastName > b.lastName)
		{
		    return 1;
		}
		  
		else if (a.lastName < b.lastName)
		{
		    return -1;
		}
		
		return 0;
	}

	//Question used for sorting in the listbox
    function Instructor(t, v, ln)
	{
		this.text = t;
		this.value = v;
		this.lastName = ln;
	}
   
    //removing all extra data in select boxes
    function removeExtras(){
    	var found = [];
		$("select option").each(function() {
			if($.inArray(this.value, found) != -1) $(this).remove();
			found.push(this.value);
		});
    }
    
    //deleting function that takes all of the course IDs
    function deleteCourse()
    {
    	var list = document.getElementById("mainSelect");
    	
    	for(var cnt = 0; cnt < list.options.length; cnt++)
    	{
    		if(list.options[cnt].selected)
    		{
    			var cid = 'cid=' + list.options[cnt].value;
    			
    			$.ajax({
	  				url: 'delete_course/cleanUp',
	  				data: cid,
	  				type: 'POST',
	  				success: function(){
						var list = document.getElementById("mainSelect");
						for(var cnt = 0; cnt < list.options.length; cnt++)
						{
							if(list.options[cnt].selected)
							{
								list.remove(cnt, null);
							}
						}
		  			}
  				});
    			
    		}
    	}
    }
	
	//when the delete button is clicked
	$("#DuplicateButton").click(function(){
			alert("Hello");
			
	});
	
		$("#Modify-Instructor").dialog({
			// is this css and should it be moved? (elise)
			autoOpen: false,
			height: 200,
			width: 400,
			modal: true,
			resizable:false,
			
			open: function(){
							
			var list = document.getElementById("mainSelect");
			var str, array;
			for(var count = list.options.length - 1; count >= 0; count--)
			{
				//checking to see if the listbox option was selected
				if(list.options[count].selected == true)
				{
					//get the different parts of the admin
					str = list.options[count].text;
					array = str.split("_");
				}//end if
				
			}
		},

			//the yes button that does the function
			buttons: {
				"Yes": function(){
				
				deleteCourse();
				$(this).dialog("close");		
			},
			Cancel: function(){
				$(this).dialog("close");
			}
		}
	});//end remove-Question dialog
    
    //populating the list box with all available courses
    function populateCourses(data)
    {
    	//empty out all of the select boxes and list box
		$("#mainSelect").empty();
		
		var list = document.getElementById("mainSelect");
		
		for(var cnt = 0; cnt < data.count; cnt++)
		{
			var listOption = document.createElement("OPTION");
			var temp = 'course' + cnt;
			var term;
			
			if(data.courses[temp].term == '10')
			{
				term = 'Winter';
			}
			else if(data.courses[temp].term == '20')
			{
				term = 'Spring';
			}
			else if(data.courses[temp].term == '30')
			{
				term = 'Summer';
			}
			else {
				term = 'Fall';
			}

			// TODO: change this to pull years properly
			var year = '2015';

			list.options.add(listOption);
			listOption.value = data.courses[temp].section_id;
			listOption.text = year + " " + term + " " + data.courses[temp].course_subject
			+ " " + data.courses[temp].course_num + "-" + data.courses[temp].course_section
			+ " " + data.courses[temp].title + " " + data.courses[temp].first_name + " " + data.courses[temp].last_name;
		}
		
		//removeExtras();
		
    }
    
    //getting all of the courses with ajax post back
    //this is called when * is selected
    function getCourse(){
    	$.ajax({
  				url: 'delete_course/allCourses',
  				type: 'POST',
  				dataType: 'JSON',
  				success: function(data){
  					populateCourses(data);
  					
	  			}
  			});
    }
    
    //when the instructor list box is changed to a different instructor the list box is cleared and repopulated
    $('#instructor').change(function(){
    	//instructor select box value
    	var data = instructor.val();
    	//checking to see if * is selected if so grabbing all aviable courses
    	if(data == "*")
  		{
  			getCourse();
  		}
  		else
  		{
  			//ajax call to get all instructors by specific instructor selected
  			data = 'instructor=' + instructor.val();
  			$.ajax({
	    		url: 'delete_course/queryInstructor',
	    		data: data,
	    		type: 'POST',
	    		dataType:'JSON',
	    		success: function(data){
	    			
	    			populateCourses(data);
	    			$("#courseNumber").val('*');
	    			$("#subject").val('*');
	    			$("#year").val('*');
	    			$("#quarter").val('*');
	    			
	       		},
	    		error: function(){
	    			alert("Error 509(connection with server). Please check your connection.");
	    		}
	    	});
  		}
    });
        		
    //populating the list box with specific course number selected    		
    $('#courseNumber').change(function(){
    	var data = courseNumber.val();
    	
    	if(data == "*")
  		{
  			getCourse();
  		}
  		else
  		{
	    	//getting the selected data from course number and instructor select boxes
	    	var data = {courseNum : courseNumber.val(),
	    				instructor : "*"};
  			//ajax call to the controller
	    	$.ajax({
	    		url: 'delete_course/queryCourseNumber',
	    		data: data,
	    		type: 'POST',
	    		dataType:'JSON',
	    		success: function(data){
	    			
	    			populateCourses(data);
	    			$("#instructor").val('*');
	    			$("#subject").val('*');
	    			$("#year").val('*');
	    			$("#quarter").val('*');
	    			
	       		},
	    		error: function(){
	    			alert("Error 509(connection with server). Please check your connection.");
	    		}
	    	});
		}				
	});
	
	//populating the list box with courses specfic to the section number selected
	$("#subject").change(function(){
		
		var data = subject.val();
		
		if(data == "*")
  		{
  			getCourse();
  		}
		else
		{
			//section number and instructor data from selection boxes
			var data = {subject: subject.val(), 
						instructor : "*"};
			//ajax call to the controller
	    	$.ajax({
	    		url: 'delete_course/querySubject',
	    		data: data,
	    		type: 'POST',
	    		dataType:'JSON',
	    		success: function(data){
	    			
	    			populateCourses(data);
	    			$("#instructor").val('*');
	    			$("#courseNumber").val('*');
	    			$("#year").val('*');
	    			$("#quarter").val('*');
	       		},
	    		error: function(){
	    			alert("Error 509(connection with server). Please check your connection.");
	    		}
	    	});
    	}

	});
	
	//populating the list box with course specfic to the year selected
	$("#year").change(function(){
		
		var data = year.val();
		
		if(data == "*")
  		{
  			getCourse();
  		}
  		else
  		{
			//year and instructor data from select boxes
			var data = {year : year.val(), 
						instructor : "*"};
			//ajax call to the controller
	    	$.ajax({
	    		url: 'delete_course/queryYear',
	    		data: data,
	    		type: 'POST',
	    		dataType:'JSON',
	    		success: function(data){
	    			
	    			populateCourses(data);
	    			$("#instructor").val('*');
		    		$("#courseNumber").val('*');
		    		$("#subject").val('*');
		    		$("#quarter").val('*');
	       		},
	    		error: function(){
	    			alert("Error 509(connection with server). Please check your connection.");
	    		}
	    	});
	    }
	});
	
	//populating the list box with course specfic to the quarter selected
	$("#quarter").change(function(){
		
		var data = quarter.val();
		
		if(data == "*")
  		{
  			getCourse();
  		}
		else
		{
			//quarter and instructor data from the select boxes
			var data = {quarter : quarter.val(), 
						instructor : "*"};
			//ajax call to the controller
	    	$.ajax({
	    		url: 'delete_course/queryQuarter',
	    		data: data,
	    		type: 'POST',
	    		dataType:'JSON',
	    		success: function(data){
	    			
	    			populateCourses(data);
	    			$("#instructor").val('*');
		    		$("#courseNumber").val('*');
		    		$("#subject").val('*');
		    		$("#year").val('*');
	       		},
	    		error: function(){
	    			alert("Error 509(connection with server). Please check your connection.");
	    		}
	    	});
	    }
	});
	

});