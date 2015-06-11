createAnimation = (sWidth, sHeight) ->
  setInterval (->
    size = 320
    nx = Math.ceil sWidth / size
    ny = Math.ceil sHeight / size
    x = Math.floor(Math.random() * nx) * size
    y = Math.floor(Math.random() * ny) * size

    $effect = $('<div class=\'effect\' />').offset(
      top: y
      left: x).width(size).height(size).appendTo($('.background-filter'))

    $effect.delay(1500).queue((next) ->
      $(this).addClass 'visible'
      next()
      return

    ).delay((Math.random() + 1) * 1000).queue((next) ->
      $(this).removeClass 'visible'
      next()
      return

    ).delay(1500).queue (next) ->
      $(this).remove()
      next()
      return

    return

  ), Math.random() * 100

$(document).ready ->
  $.support.cors = true
  sWidth = $(window).width()
  sHeight = $(window).height()
  # intervalID = createAnimation(sWidth, sHeight)
  $('.kram').height sHeight - 400

  fn = (index) ->
    $filter = $('.background-filter')

    if index == 2
      #clearInterval intervalID
      $('.effect').removeClass('visible').delay(700).queue (next) ->
        $(this).remove()
        next()
        return
      $filter.addClass('dark').removeClass 'light'

    else if index == 1
      #clearInterval intervalID
      $filter.removeClass 'dark'
      # intervalID = createAnimation(sWidth, sHeight)

    else if index == 3
      $filter.addClass('light').removeClass 'dark'
      $('.depth').height(sHeight - 600).css('color', 'white')

    else if index == 4
      $filter.addClass('dark').removeClass 'light'
    return

  $('.main').onepage_scroll
    loop: false
    beforeMove: fn
    responsiveFallback: 1200

  $('#test').click ->
    load = mail: $('#email').val()
    $.post 'https://script.google.com/macros/s/AKfycbyfLP2w5mGZNLkymUoWrhh_0tXG-7arDfW7RFZSPiMZjxtw8nXj/exec', load
    return
  return