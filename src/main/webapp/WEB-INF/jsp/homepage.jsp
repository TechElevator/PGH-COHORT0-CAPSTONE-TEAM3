<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

 
 
 
 <div class="box-container">
 
 	<c:url var="nightlife" value="/img/category-img/nightlife.png"/>
	<img src="${nightlife}" class="category-img"/>
	
 </div>
 
 <div class="box-container">
 
 </div>
 
  <div class="box-container">
 
 	<div class="small-box">
 	<c:url var="andrew" value="/img/andrew.jpg"/>
	<img src="${andrew}" class="img-circle" />
	<h3>Andrew</h3>
	</div>
	
 	<div class="small-box">	
	<c:url var="matt" value="/img/matt.jpg"/>
	<img src="${matt}" class="img-circle" />
	<h3>Matt</h3>
	</div>
	
	<div class="small-box">
	<c:url var="ryan" value="/img/ryan.jpg"/>
	<img src="${ryan}" class="img-circle" /> 
	<br>
	<h3>Ryan</h3>
 	</div>
 	
 </div>
 
 
 
    
    
    <style>
      
      #map {
        height: 300px;
        width: 300px;
      
      }

    </style>

 
    <div id="map"></div>
    <script>
 
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
        infoWindow = new google.maps.InfoWindow;

       
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&callback=initMap">
    </script>



		
<c:import url="/WEB-INF/jsp/footer.jsp" />