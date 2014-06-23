      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(@stamp.adr_lat, @stamp.adr_lng),
          zoom: 8
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
      }
      google.maps.event.addDomListener(window, 'load', initialize);