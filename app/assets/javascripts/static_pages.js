$(document).ready(function() {
  showFlashMessages();
  $('.dropdown-toggle').dropdown();
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
});

$('#status_message_fake_text').focusout(function(){
   $(this).attr('rows', '2');
   $('.btnarea').hide();
});


$('.post li').hover(
  function () {
    $(this).find('.close').fadeIn(100);
  },
  function () {
    $(this).find('.close').fadeOut(100);
});

$("a.fancybox").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false
});

}

