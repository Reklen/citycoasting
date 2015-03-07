$(document.body).on

# $ ->
# 	$('#stamps').imagesLoaded ->
# 		$('#stamps').masonry
# 			itemSelector: '.box'
# 			isFitWidth: true

jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() >= ($(document).height() - $(window).height() - 900)
        $('.pagination').text("Fetching more stamps")
        $.getScript(url)
    $(window).scroll()