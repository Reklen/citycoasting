$(document.body).on

$ ->
	$('#profile_stamps').imagesLoaded ->
		$('#profile_stamps').masonry
			itemSelector: '.box'
			isFitWidth: true
