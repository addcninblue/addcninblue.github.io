$ ->
	$("#border-bottom").animate
		width: "80vw",
		1000
	$("#border-right").delay(1000).animate
		height: "80vh",
		1000
	$("#border-left").delay(1000).animate
		height: "80vh",
		1000
	$("#border-top-white").delay(2000).animate
		width: "0vw",
		1000
	$("#title-words").delay(3000).fadeIn(500)
	$("#picture").delay(3000).fadeIn(500)

	$("#skills").delay(3000).fadeIn(500)
