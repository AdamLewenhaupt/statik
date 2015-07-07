$ ->
	paper = Snap '#screen-paper'
	group = paper.group()

	Snap.load 'imgs/hammer.svg', (f) ->
		hammer = f.select("path")
		group.append hammer

		bbox = hammer.getBBox()

		smash = ->
			hammer.animate
				transform: "rotate(90, #{bbox.cx}, #{bbox.y2})",
				250, -> hammer.animate 
					transform: "rotate(0, #{bbox.cx}, #{bbox.y2})",
						1000, smash

		smash()


	Snap.load 'imgs/screen.svg', (f) ->
		screen = f.select('g')
		group.append screen

		m = screen.transform().localMatrix
		m.translate 40, 105

		screen.transform m

