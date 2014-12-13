    function initialize() {
      var myLatlng = new google.maps.LatLng(gon.latcoord, gon.lngcoord);
      var myOptions = {
        zoom: 15,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }
      var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
      var marker = new google.maps.Marker({
      position: myLatlng,
      map: map})
    }

    function loadScript() {
      var script = document.createElement("script");
      script.type = "text/javascript";
      script.src = "http://maps.google.com/maps/api/js?sensor=false&callback=initialize";
      document.body.appendChild(script);
    }

    window.onload = loadScript;


    