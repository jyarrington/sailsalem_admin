// .js library for publicregister.php

	document.domain = 'admin.sailsalem.local';
	    	
	function jumpScroll() {
    	window.scroll(0,0); // horizontal and vertical scroll increments
	}
	
    $(document).ready(function(){
    
    	document.domain = 'admin.sailsalem.local';
	
    	// Your code here
    	jQuery.validator.addMethod("phoneUS", function(phone_number, element) {
    	    phone_number = phone_number.replace(/\s+/g, ""); 
    		return this.optional(element) || phone_number.length > 9 &&
    			phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
    	}, "Please specify a valid phone number");

    	
    	$("#youth_register").validate({
    			rules : {
    				first_name : {required: true, minlength: 2},
    				last_name : {required: true, minlength: 2},
    				birth_date : {required: true, date: true},
    				address: {required: true},
    				zip : {required: true, digits: true, minlength: 5},
    				grade : {required: true, digits: true},
    				guardian_one_first_name : {required: true, minlength: 2},
    				quardian_one_last_name : {required: true, minlength: 2 },
    				phone1 : {required: true, phoneUS: true},
    				phone2 : {phoneUS: true},
    				email1 : {email: true},
    				email2 : {email: true},
    				emergency_number : {required: true, phoneUS: true}
    			}
    	});
 
    	$('#clear_session').click(function() {
	    	  alert('Remember to click save to save changes.');
	    	  $("#youth_register input:radio").attr("checked", false); 
	    	});

       $("input:checkbox").click(function() {

          var bol = $("input:checkbox:checked").length >= 2;
          $("input:checkbox").not(":checked").attr("disabled",bol);

        });
    });
    
