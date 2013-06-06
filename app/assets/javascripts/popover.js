$(document).ready(function() {
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
	
});


