jQuery(function(){$("#fileupload").fileupload({progress:function(e,t){$(".progress").fadeIn(100);var i=parseInt(100*(t.loaded/t.total),10);$(".progress .bar").css("width",i+"%")},done:function(){$(".progress").fadeOut(100)},add:function(e,t){types=/(\.|\/)(gif|jpe?g|png)$/i,file=t.files[0],types.test(file.type)&&types.test(file.name)||alert("#{file.name} is not a gif, jpeg, or png image file")}})});