$(document).ready(function() {

	$('.feature').hover(function(){
		var element = "#" + $(this).attr('id') + "-text";

		$('.feature-text').hide();
		$('.feature-text').removeClass("selected");

		$(element).addClass("selected"); 
		$(element).show(); 
	});

});
