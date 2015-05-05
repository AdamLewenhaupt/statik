$(document).ready(function () {

	fn = function (index) {

		$filter = $(".background-filter");

		if(index == 2) {
			$filter.addClass("dark").removeClass("light");
		} else if (index == 1) {
			$filter.removeClass('dark');
		} else if (index == 3) {
			$filter.addClass('light').removeClass('dark');
		} else if (index == 4) {
			$filter.addClass('dark').removeClass('light');
		}
	}

	$(".main").onepage_scroll({
		loop: false,
		beforeMove: fn
	});

});