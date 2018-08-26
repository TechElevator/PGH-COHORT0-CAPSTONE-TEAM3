<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    
    <style>
      
      #map {
        height: 400px;
        width: 400px;
      
      }

    </style>
  
  
  
  
  <div id="map"></div>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&callback=initMap">
</script>

<script type="text/javascript">


function initMap() {
      var center = {lat: 40.442169, lng: -79.994957};
      var locations =  [];
      
      //get the data from our dp
        $.ajax({
            url: 'API/placeList', 
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            success: function(result) {
                
                var j; 
                for(var j = 0; j < Object.keys(result).length; j++){
                //console.log(result[0]); 
                
                locations.push([result[j].name, result[j].google_id, result[j].type, result[j].lat, result[j].lng, result[j].description]);
                
                    createMarker(result[j]);
                        }
               
                    }                   
                })
                
                
                
                
                
        
    //this function creates the marker
    // we need to get this info from the datbase
     
        
        
      
      
function createMarker(place,icon){
    	var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 13,
    	    center: center
    	  });
      
      
    	var infowindow =  new google.maps.InfoWindow({});
    	var marker, count;
    	for (count = 0; count < locations.length; count++) {
    		
    		marker = new google.maps.Marker({
    	      position: new google.maps.LatLng(locations[count][3], locations[count][4]),
    	      map: map,
    	      title: locations[count][0],
    	      animation: google.maps.Animation.DROP
    	    });
    	google.maps.event.addListener(marker, 'click', (function (marker, count) {
    	      return function () {
    	        infowindow.setContent(locations[count][0] + '<br>' +locations[count][5]);
    	        infowindow.open(map, marker);
    	      }
    	    })(marker, count));
    	  }
      }
      
    }
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%-- AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY --%>
  
  
  
  
  
  
  
  
  
  
  <%-- 
  
    
 <div id="map"></div>
 
 <script type="text/javascript" src="scripts/index.js"></script>
 
 
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&callback=initMap">
</script>
    
    <script type="text/javascript">
    
    
    function initMap() {
    	  var center = {lat: 40.442169, lng: -79.994957};
    	  var locations =  [];
    	  
    	  //get the data from our db
		
    	  		$.ajax({
				url:	  'API/placeList', 
				type: 'GET',
				dataType: 'json',
				contentType: 'application/json',
				success: function(result) {
					//console.log(result[0].google_id);     					
					
					var j; 
					for(var j = 0; j < Object.keys(result).length; j++){
						
						//console.log(result[j]);     					

						createMarker(result[j].google_id, result[j].icon);
							}
					var i; 
					for(var i = 0; i < Object.keys(result).length; i++){
						locations.push(result[j]);
							}
					
					
						}          			
					})
			
		//this function creates the marker
		// we need to get this info from the datbase
			function createMarker(place, icon) {
		        var placeLoc = place.geometry.location;
		
		        var marker = new google.maps.Marker({
		            map: map,
		            position: place.geometry.location,
		            icon: {
		                url: icon,
		                scaledSize: new google.maps.Size(20, 20) // pixels
		            },
		            animation: google.maps.Animation.DROP
		        });
		        
		        google.maps.event.addListener(marker, 'click', function() {
		            infowindow.setContent(place.name+ '<br>' +place.opening_hours);
		            infowindow.open(map, this);
		        });
		    }
			
			
    	  
    	var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 13,
    	    center: center
    	  });
    	var infowindow =  new google.maps.InfoWindow({});
    	var marker, count;
    	for (count = 0; count < locations.length; count++) {
    	    marker = new google.maps.Marker({
    	      position: new google.maps.LatLng(locations[count][1], locations[count][2]),
    	      map: map,
    	      title: locations[count][0]
    	    });
    	google.maps.event.addListener(marker, 'click', (function (marker, count) {
    	      return function () {
    	        infowindow.setContent(locations[count][0] + '<br>' +locations[count][3]);
    	        infowindow.open(map, marker);
    	      }
    	    })(marker, count));
    	  }
    	}
    
</script>
   --%> 
    
    


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%-- AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY --%>



		
<c:import url="/WEB-INF/jsp/footer.jsp" />