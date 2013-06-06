jQuery(function(){

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
});