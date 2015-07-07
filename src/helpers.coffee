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
