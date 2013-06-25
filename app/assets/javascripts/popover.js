$(document).ready(function() {
	$('textarea').flexible();
  $('textarea').trigger('updateHeight');
  $('textarea').val('');
$(".fancybox").fancybox({
    helpers:  {
        title : {
            type : 'inside'
        },
        overlay : {
            css : {
                'background' : '#000'          
            }
        }
    }
});
	var tour = new Tour();
	tour.addStep({		
	    element: ".fileinput-button", // string (jQuery selector) - html element next to which the step popover should be shown
	       title : '<span class="text-info"><strong>Шаг 2</strong></span>'+
                    '<button type="button" id="close" class="close" onclick="$(&quot;.fileinput-button&quot;).popover(&quot;hide&quot;);">&times;</button>', // string - title of the popover
	    content: "Чтобы разместить фотографию, просто перетащите её сюда, удерживая кнопку мыши.", // string - content of the popover
	    placement: "right",
	    animation: true,
	    backdrop: false,
    	redirect: true,
    	reflex: false    	
	});
	tour.addStep({
	    element: ".button_start", // string (jQuery selector) - html element next to which the step popover should be shown
	       title : '<span class="text-info"><strong>Шаг 3</strong></span>'+
                    '<button type="button" id="close" class="close" onclick="$(&quot;.button_start&quot;).popover(&quot;hide&quot;);">&times;</button>', // string - title of the popover
	    content: "Войдите на свою страницу.", // string - content of the popover
	    placement: "right",
	    animation: true,
	    backdrop: false,
    	redirect: true,
    	reflex: false    	
	});
	
	tour.addStep({
	    element: "#name", // string (jQuery selector) - html element next to which the step popover should be shown
	       title : '<span class="text-info"><strong>Шаг 1</strong></span>'+
                    '<button type="button" id="close" class="close" onclick="$(&quot;#name&quot;).popover(&quot;hide&quot;);">&times;</button>', // string - title of the popover
	    content: "Проверьте ваше имя и фамилию.", // string - content of the popover
	    placement: "top",
	    animation: true,
	    backdrop: false,
    	redirect: true,
    	reflex: false    	
	});

	setTimeout(function() {
		tour.showStep(2);
	},1000);
	setTimeout(function() {
		tour.showStep(0);
	},3000);
	setTimeout(function() {
		tour.showStep(1);
	},5000);

	  function show_flash(type, msg){
        $(".flash_message").html("<div class=message_"+type+"><div class='alert_message'>"+msg+"</div></div>");
        showFlashMessages();       
    }

    $('#fileupload').fileupload({
      add: function (e,data){
        types = /(\.|\/)(gif|jpe?g|png)$/i
        file = data.files[0];
        if (!types.test(file.type) || !types.test(file.name))
          show_flash('notice', 'Ошибка! Допустимые форматы изображения: jpg, jpeg, png.');
        else{
          $('.progress').fadeIn(100);
          data.submit();
        }
      },
      progress: function (e, data) {
        $('.progress').fadeIn(100);
          var progress = parseInt(data.loaded / data.total * 100, 10);
          $('.progress .bar').css(
              'width',
              progress + '%'
          );
      },
      done: function(e, data) {
        $('.progress').fadeOut(100);
        show_flash('notice', 'Фотография успешно загружена.');
          }
  });

	showFlashMessages();
	$('.dropdown-toggle').dropdown();
	
	function showFlashMessages() {
		  $('.message_notice').animate({top: '40px'}, 500, function(){
		    setTimeout(function() {
		        $('.message_notice').animate({top: '-10px'}, 500);
		  }, 5000);
		});
	}
	

	$('#new_imagepost').fileupload({
	
      add: function (e,data){
        types = /(\.|\/)(gif|jpe?g|png)$/i
        file = data.files[0];
        if (!types.test(file.type) || !types.test(file.name))
          show_flash('notice', 'Ошибка! Допустимые форматы изображения: jpg, jpeg, png.');       
          data.submit();        
        },
      progress: function (e, data) {
        $('.progress').fadeIn(100);
          var progress = parseInt(data.loaded / data.total * 100, 10);
          $('.progress .bar').css(
              'width',
              progress + '%'
          );
      },
      done: function(e, data) {
        $('.progress').fadeOut(100);       
      }
  });
  $('#imagepost_image').attr('name','imagepost[image]');
	document.getElementById('imagepost_image').addEventListener('change', handleFileSelect, false);
});


