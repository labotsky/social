$(document).ready(function() {
  showFlashMessages();
  $('.dropdown-toggle').dropdown();

  $("a.fancybox").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 600, 
    'speedOut'    : 200, 
    'overlayShow' : false
  });  
});


function showFlashMessages() {
  $('.message_notice').animate({top: '40px'}, 500, function(){
    setTimeout(function() {
        $('.message_notice').animate({top: '-10px'}, 500);
  }, 5000);
});

$('#status_message_fake_text').focus(function(){
   $(this).attr('rows', '4');
   $('.btnarea').show();
   $('.close_window').show();
 
});

$('.close_window').click(function(){
   $('#status_message_fake_text').attr('rows', '2');
   $('.btnarea').hide();
   $('.close_window').hide();
  
});

}

