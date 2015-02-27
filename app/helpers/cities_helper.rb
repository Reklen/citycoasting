module CitiesHelper
	def hacksurfer_community_link text= nil html_options={}
		link_to((text || 'hacksurfer'), 'www.google.com', html_options)
	end
end
