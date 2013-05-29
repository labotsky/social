$(document).ready(function() {
	showFlashMessages()	  
	hideFlashMessages();
});


function showFlashMessages() {
  $('.message_error, .message_success').delay(500).animate({"opacity": "1"}, 200);
}

function hideFlashMessages() {
  $('.message_error, .message_success').delay(5000)
  $('.message_error, .message_success').fadeOut("slow");
}
