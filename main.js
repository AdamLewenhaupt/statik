function createAnimation() {
	return setInterval(function(){
		n = 8;
		width = sWidth / n;
		height = sHeight / n;

		x = Math.floor(Math.random() * n) * width;
		y = Math.floor(Math.random() * n) * height;

		$effect = $("<div class='effect' />")
			.offset({ top: y, left: x })
			.width(width).height(height)
			.appendTo($(".background-filter"));

		$effect.delay(700).queue(function(next){ $(this).addClass('visible'); next(); })
			.delay((Math.random() + 1) * 1000).queue(function(next){ $(this).removeClass('visible'); next(); })
			.delay(700).queue(function(next){ $(this).remove(); next(); }); 

	}, Math.random() * 100);
}


$(document).ready(function () {

	sWidth = $(window).width();
	sHeight = $(window).height();

	intervalID = createAnimation();


	fn = function (index) {

		$filter = $(".background-filter");

		if(index == 2) {
			clearInterval(intervalID);
			$(".effect").removeClass('visible').delay(700).queue(function(next) { $(this).remove(); next(); });

			$filter.addClass("dark").removeClass("light");
		} else if (index == 1) {
			clearInterval(intervalID);
			$filter.removeClass('dark');
			intervalID = createAnimation();
		} else if (index == 3) {
			$filter.addClass('light').removeClass('dark');
		} else if (index == 4) {
			$filter.addClass('dark').removeClass('light');
		}
	}

	$(".main").onepage_scroll({
		loop: false,
		beforeMove: fn,
		responsiveFallback: 1200
	});

	$(".main").moveTo(4);

});