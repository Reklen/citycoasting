if (navigator.geolocation) {
         navigator.geolocation.getCurrentPosition(addressToCode);
}

addressToCode = function (position,callback) {

        var service = new google.maps.places.PlacesService(document.getElementById('google'));
        var request = { query: new google.maps.LatLng(position.coords.latitude,position.coords.longitude) }
        service.textSearch(request, function (json, status) {
            if (status == google.maps.places.PlacesServiceStatus.OK) {
              //RESULTS -- DO SOMETHING HERE 
              json[0].name;
            } else {
                //alert("Geocode was not successful for the following reason: " + json.status);
            }
        });
};