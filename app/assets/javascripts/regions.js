// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


      //////// GOOGLE MAPS

      function googleMap(elementId, zoom = 6){

          var centre = {
              4: {lat: 48.710275, lng: 5.165206},
              5: {lat: 54.4808, lng: -2.2426},
              6: {lat: 53.536806, lng: -2.941057}
          }
          if (typeof centre[zoom] !== 'undefined') {
              var coords = centre[zoom];
          }else{
              var coords = centre['6'];
          }


          if (typeof google === 'object' && typeof google.maps === 'object') {

              var map = new google.maps.Map($('#'+elementId)[0], { 
                  mapTypeId: google.maps.MapTypeId.ROADMAP,
                  zoom: zoom,
                  center: coords,
                  zoomControl: true,
                  mapTypeControl: false,
                  scaleControl: false,
                  streetViewControl: false,
                  rotateControl: false,
                  fullscreenControl: true
              });
              map.markers = [];
                
                
              map.data.setStyle(function(feature) {
                var objectid = feature.getProperty('objectid');
                
                return {
                  fillColor: rainbow(12, objectid),
                  fillOpacity: 0.2,
                  strokeWeight: 2
                }
              });
            
              return map;
          }
      }

      function rainbow(numOfSteps, step) {
          // This function generates vibrant, "evenly spaced" colours (i.e. no clustering). This is ideal for creating easily distinguishable vibrant markers in Google Maps and other apps.
          // Adam Cole, 2011-Sept-14
          // HSV to RBG adapted from: http://mjijackson.com/2008/02/rgb-to-hsl-and-rgb-to-hsv-color-model-conversion-algorithms-in-javascript
          var r, g, b;
          var h = step / numOfSteps;
          var i = ~~(h * 6);
          var f = h * 6 - i;
          var q = 1 - f;
          switch(i % 6){
              case 0: r = 1; g = f; b = 0; break;
              case 1: r = q; g = 1; b = 0; break;
              case 2: r = 0; g = 1; b = f; break;
              case 3: r = 0; g = q; b = 1; break;
              case 4: r = f; g = 0; b = 1; break;
              case 5: r = 1; g = 0; b = q; break;
          }
          var c = "#" + ("00" + (~ ~(r * 255)).toString(16)).slice(-2) + ("00" + (~ ~(g * 255)).toString(16)).slice(-2) + ("00" + (~ ~(b * 255)).toString(16)).slice(-2);
          return (c);
      }

      function addMapMarker(props, map, color){

          if(props.latitude && props.longitude && typeof google === 'object' && typeof google.maps === 'object'){

              var LatLng = new google.maps.LatLng(props.latitude, props.longitude);
              //Add marker to map
            
              let markerProps = {...{
                  map: map,
                  position: LatLng,
                  icon: {
                      url: "https://raw.githubusercontent.com/Concept211/Google-Maps-Markers/master/images/marker_"+color+".png"
                      //size: new google.maps.Size(20,34),
                      //origin: new google.maps.Point(0, 0),
                      //anchor: new google.maps.Point(10,34)
                  },
                  infowindow: new google.maps.InfoWindow({
                      content: '<div class="infowindow">'+props.infoContent+'</div>'
                  })
              }, ...props}
            
              var marker = new google.maps.Marker(markerProps);

              map.markers.push(marker);

              //Add listener to detect clicks that will open the info window
              google.maps.event.addListener(marker, 'click', (function(marker){
                  return function() {
                      hideAllInfoWindows(map);
                      marker.infowindow.open(map, marker);
                  };
              })(marker, marker.infowindow));

              return marker;            
          }else{
              return false;
          }
      }
      function hideAllInfoWindows(map) {
          map.markers.forEach(function(marker) {
              marker.infowindow.close(map, marker);
          }); 
      }