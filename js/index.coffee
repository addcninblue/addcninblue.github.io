debugMode = false

skills = ["web", "languages", "math", "other"]
skillIndex = 0
isPaused = false
isTimeout = false

$ ->
	$("#border-bottom").animate
		width: "80vw",
		1000
	$("#border-right, #border-left").delay(1000).animate
		height: "80vh",
		1000
	$("#border-top-white").delay(2000).animate
		width: "0vw",
		1000
	$("#title-words").delay(3000).fadeIn(500)
	$("#picture").delay(3000).fadeIn(500).animate
		right: "40vw",
		1000
	$("#introduction, #portfolio, #skills, #email, footer").delay(4500).fadeIn(500)

	setInterval () ->
		cursorAnimation()
		1000
	
	skill() # initial

	for i in [2..4]
		$("#block-" + i).fadeOut ->

	$("#circle-1, #circle-2, #circle-3, #circle-4").click ->
		if(not isPaused)
			console.log('click')
			isPaused = true
			isTimeout = true
			setTimeout () ->
				isPaused = false
			,	1000
			setTimeout () ->
				isTimeout = false
			,	5000
			clickSlide("#" + this.id)

	setInterval () ->
		if(not (isPaused or isTimeout or debugMode))
			console.log('setInterval')
			isPaused = true
			setTimeout () ->
				isPaused = false
			,	1000
			nextSlide()
	,	5000


cursorAnimation = () ->
	$("#cursor").animate
		opacity: 0
		'10'
		'swing'
	.animate
		opacity: 1
		'10'
		'swing'

skill = () ->
	speed = 100

	currentTitle = $("#skill").text()
	for i in [0..currentTitle.length]
		do (i) ->
			setTimeout (-> $("#skill").text(currentTitle.substr(0, currentTitle.length - i))), speed*i

	setTimeout (->
		for i in [0..skills[skillIndex].length]
			do (i) ->
				setTimeout (-> $("#skill").append(skills[skillIndex][i])), speed*i
	), speed * (currentTitle.length)

clickSlide = (newBlockCircle) ->
	currentBlock = "#" + $("#skills-showcase").find(".active-block")[0].id
	currentBlockCircle = "#circle-" + currentBlock.slice(-1)
	newBlock = "#block-" + newBlockCircle.slice(-1)
	skillIndex = newBlockCircle.slice(-1) - 1
	skill()
	# newBlockCircle is a parameter
	if newBlock != currentBlock
		$(currentBlock).fadeOut ->
			$(newBlock).fadeIn ->
		$(currentBlock).removeClass("active-block")
		$(newBlock).addClass("active-block")
		$(currentBlockCircle).removeClass("fa-circle")
		$(currentBlockCircle).addClass("fa-circle-o")
		$(newBlockCircle).addClass("fa-circle")
		$(newBlockCircle).removeClass("fa-circle-o")
	# console.log(currentBlock)
	# console.log(currentBlockCircle)
	# console.log(newBlock)
	# console.log(newBlockCircle)

nextSlide = () ->
	currentBlock = "#" + $("#skills-showcase").find(".active-block")[0].id
	nextNumber = (parseInt(currentBlock.slice(-1))) % 4 + 1
	newBlockCircle = "#circle-" + nextNumber
	clickSlide(newBlockCircle)
