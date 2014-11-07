# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document.body).on

$ ->
	$('#stamps').imagesLoaded ->
		$('#stamps').masonry
			itemSelector: '.box'
			isFitWidth: true

jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() >= ($(document).height() - $(window).height() - 900)
        $('.pagination').text("Fetching more stamps")
        $.getScript(url)
    $(window).scroll()