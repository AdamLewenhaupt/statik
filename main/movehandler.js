// Generated by CoffeeScript 1.9.3
var moveHandler;

moveHandler = function(index) {
  var $filter, $words;
  $filter = $('.background-filter');
  if (index === 2) {
    $words = $('#no-press h1 span').css("color", "white");
    $("#no-press h1").css({
      "border-bottom": "4px solid #F7C6BD",
      "border-left": "4px solid #F7C6BD",
      "border-top": "4px solid #F7C6BD",
      "border-right": "4px solid #F7C6BD",
      "background-color": "rgba(0,0,0,0.8)"
    }).unbind('click').click(function() {
      return setupPart2(sWidth, sHeight);
    }).delay(1500).queue(function() {
      return $(this).addClass("highligth").dequeue();
    });
    $filter.addClass('dark').removeClass('light');
    if (isNight) {
      return $filter.addClass('night');
    } else {
      return $filter.addClass('dark');
    }
  } else if (index === 1) {
    return $filter.removeClass('dark').addClass('light').removeClass('night');
  } else if (index === 3) {
    $filter.addClass('light').removeClass('dark');
    $('.depth').addClass('roll-down');
    return $('.thumb-up').addClass('thumb-down');
  }
};