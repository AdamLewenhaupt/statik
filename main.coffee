text1 = "Vill man synas på nätet idag#räcker det inte bara med en hemsida.##Det måste finnas en tanke bakom den."
text2 = "Därför lär vi känna er och era kunder.##Först därefter börjar vi fundera#på hur er sida kan se ut."
text3 = "För vi är inte nöjda med att göra en snygg sida.##Vi vill skapa * sida."

writeAnimation = ($obj, textIndex, done) ->
  done()

write = ($obj, text, textIndex, done) ->
  if text.length > 0

    t = switch text[0]
      when "#"
        "<br/>"
      when "*"
        t = "<strong>ER</Strong>"
      else
        text[0]

    $obj.append t
    setTimeout (-> write $obj, text[1..], textIndex, done), ((Math.random() + 2) * 25)
  else
    writeAnimation $obj, textIndex, -> 
      $obj.addClass "writer-done"
      setTimeout done, 2000
    


makeStatic = ($obj) ->
  $obj.height($obj.height())
    .width($obj.width())

setupPart2 = (sWidth, sHeight) ->
  $("#no-press h1").addClass "no-press-done"
  $("#no-press h1 span").css "color", "transparent"
  $("#no-press h1").delay(600).queue(-> makeStatic($(this)).html("").dequeue()).animate { width: 0 }, 600
    .queue(-> $(this).remove())
  $(".text").css "height", sHeight * .6

  done2 = -> write $("#writer-3"), text3, 3, -> $(".writer").css "color", "#94FFFC"
  done1 = -> write $("#writer-2"), text2, 2, done2

  setTimeout (->write($("#writer-1"), text1, 1, done1)), 3000


$(document).ready ->
  $.support.cors = true
  sWidth = $(window).width()
  sHeight = $(window).height()
  $('.kram').height sHeight - 400
    

  fn = (index) ->
    $filter = $('.background-filter')

    if index == 2
      $words = $('#no-press h1 span').css "color", "white"

      $("#no-press").css "top", ""

      $("#no-press h1").css(
        "border-bottom": "4px solid #F7C6BD",
        "border-left": "4px solid #F7C6BD",
        "border-top": "4px solid #F7C6BD",
        "border-right": "4px solid #F7C6BD",
        "background-color": "rgba(0,0,0,0.6)")
        .unbind 'click'
        .click -> setupPart2(sWidth, sHeight)
        .delay(1500).queue(-> $(this).addClass("highligth").dequeue() )

      $filter.addClass('dark').removeClass 'light'

    else if index == 1
      $filter.removeClass 'dark'

    else if index == 3
      $filter.addClass('light').removeClass 'dark'
      height = sHeight - (256 + 180)
      $('.depth').height(height).css('color', 'white')
      $('.kram').height(height)

    else if index == 4
      $(".background").css "background-image", "url(imgs/hello.png)"
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