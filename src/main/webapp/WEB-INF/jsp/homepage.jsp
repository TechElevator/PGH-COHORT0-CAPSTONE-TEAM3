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
<script type="text/javascript" src="scripts/index.js"></script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&callback=initMap">
</script>
    
    <script type="text/javascript">
    function initMap() {
    	  var center = {lat: 40.442169, lng: -79.994957};
    	  var locations = [
    	    ['Pirmanti Bros', 40.4508999, -79.985501, 'Coleslaw lovers only'],
    	    ['Gauchos', 40.449032, -79.987431,'Meat'],
    	    ['Nickys thai', 40.452149, -80.016219, 'Spice lovers only'],
    	    ['Giorginos', 40.452080, -80.017048, 'Pizza'],
    	    
    	  ];
    	var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 12,
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
    
    
    


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%-- AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY --%>



		
<c:import url="/WEB-INF/jsp/footer.jsp" />