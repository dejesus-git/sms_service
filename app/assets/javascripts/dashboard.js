// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// # logic for all views within the dashboard folder


/***************************************************
	Dashboard index view
****************************************************/ 

$(function() {
	$("#submitMessage").on("submit", function(event) {
		$.ajax({
		  url: "/send_message",
		  type: "POST",
		  contentType: "application/json",
		  dataType: "json",
		  success: function(result) {
		    console.log(result);
		  },
		  error: function (result) {
		  	console.log(result.responseText);
		  }
		});
		event.preventDefault();
	});
});


/***************************************************
	Dashboard account view
****************************************************/ 

$(function() {
	$("#api_form").on("submit", function(event) {
		var twilio_api = $("input[name='user[twilio_api]']");
		var twilio_secret = $("input[name='user[twilio_secret]']");
		$.ajax({
		  url: "/user/1",
		  type: "PATCH",
		  dataType: "json",
		  contentType: "application/json",
		  data: JSON.stringify({ user: {
		  		twilio_api: twilio_api.val(),
		  		twilio_secret: twilio_secret.val()
		  	}
			}),
		  success: function(result) {
		  	console.log(result);
		    twilio_api.val("");
		   	twilio_secret.val("");
		  },
		  error: function (result) {
		  	console.log("hello");
		  	console.log(result);
		  }
		});
		event.preventDefault();
	});
});

/***************************************************
	Balance Upload
****************************************************/ 
$(function() {
	$("#balance_form").on("submit", function(event) {
		var balance = $("input[name='user[balance]'");
		$.ajax({
		  url: "/user/1",
		  type: "PATCH",
		  contentType: "application/json",
		  dataType: "json",
		  data: JSON.stringify({ user: {
		  		balance: balance.val()
		  	}
			}),
		  success: function(result) {
		    console.log(result)
		    document.getElementById("balance").innerHTML = "balance: " + result.balance
		    $("input[name='user[balance]'").val("");
		  },
		  error: function (result) {
		  	console.log(result.responseText);
		  }
		});
		event.preventDefault();
	});
});

