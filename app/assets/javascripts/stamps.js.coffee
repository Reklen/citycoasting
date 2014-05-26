$ ->
	$('#stamps').imagesLoaded ->
		$('#stamps').masonry
			itemSelector: '.box'
			isFitWidth: true