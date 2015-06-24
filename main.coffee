text1 = "Vill man synas på nätet idag räcker det# inte bara med en hemsida.##Vi tror att det måste finnas en tanke| bakom den."
text2 = "Därför skapar vi hemsidor genom att#först lära känna er och era kunder.##Sedan designar vi hemsidan| så att vi kan#framföra ert budskap på ett smart och innovativt sätt."
text3 = "För vi nöjer oss inte med att endast göra en snygg sida.#Vi vill snickra ihop någonting unikt som man minns.##Vi vill helt enkelt skapa *| sida."

isNight = false

glow = ($model, $target) ->
  offset = $target.offset()
  $model.addClass 'glow'
    .css
      top: offset.top
      left: "calc(#{offset.left}px - 20vh)"


write = ($obj, text, glowFn, done) ->
  if text.length > 0

    t = switch text[0]
      when "#"
        "<br/>"
      when "*"
        t = "<strong>ER</Strong>"
      when '|'
        glowFn()
        t = ''
      else
        text[0]

    $obj.append t
    setTimeout (-> write $obj, text[1..], glowFn, done), ((Math.random() + 2) * 28)
  else
    $obj.addClass "writer-done"
    setTimeout done, 2000
    


makeStatic = ($obj) ->
  $obj.height($obj.height())
    .width($obj.width())

setupPart2 = (sWidth, sHeight) ->

  glowFn1 = -> glow $('#lightbulb'), $('#writer-1')
  glowFn2 = -> glow $('#screen'), $('#writer-2')
  glowFn3 = -> glow $('#smiley'), $('#writer-3')

  $('.background-filter').addClass 'night'
  isNight = true

  $("#no-press h1 span").css "color", "transparent"
  $("#no-press h1").delay(600).queue(-> makeStatic($(this)).html("").dequeue()).animate { padding: 0, width: 0 }, 600
    .queue(-> $(this).remove())
  $(".text").css "height", sHeight * .6

  done2 = -> 
    write $("#writer-3"), text3, glowFn3, -> $(".writer").css "color", "#94FFFC"


  done1 = ->
    write $("#writer-2"), text2, glowFn2, done2

  setTimeout (->write($("#writer-1"), text1, glowFn1, done1)), 3000


$(document).ready ->
  $.support.cors = true
  sWidth = $(window).width()
  sHeight = $(window).height()
    

  fn = (index) ->
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

  $('.main').onepage_scroll
    loop: false
    beforeMove: fn

  $('#test').click ->
    load = mail: $('#email').val()
    $.post 'https://script.google.com/macros/s/AKfycbyfLP2w5mGZNLkymUoWrhh_0tXG-7arDfW7RFZSPiMZjxtw8nXj/exec', load
    return
  return