moveHandler = (index,sWidth,sHeight) ->
    $filter = $('.background-filter')

    if index == 2
      $words = $('#no-press h1 span').css "color", "white"

      $("#no-press h1").css(
        "border-bottom": "4px solid #F7C6BD",
        "border-left": "4px solid #F7C6BD",
        "border-top": "4px solid #F7C6BD",
        "border-right": "4px solid #F7C6BD",
        "background-color": "rgba(0,0,0,0.8)")
        .unbind 'click'
        .click -> setupPart2(sWidth, sHeight)
        .delay(1500).queue(-> $(this).addClass("highligth").dequeue() )

      $filter.addClass('dark').removeClass('light')
      if isNight
        $filter.addClass 'night'
      else
        $filter.addClass 'dark'

    else if index == 1
      $filter.removeClass 'dark'
        .addClass 'light'
        .removeClass 'night'

    else if index == 3
      $filter.addClass('light').removeClass 'dark'

      $('.depth').addClass 'roll-down'
      $('.thumb-up').addClass 'thumb-down'