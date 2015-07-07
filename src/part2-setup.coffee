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