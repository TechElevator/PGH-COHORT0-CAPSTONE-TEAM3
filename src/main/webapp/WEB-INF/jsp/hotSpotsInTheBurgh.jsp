<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>









	<div class="small-box">
		<h1 class="h1-center header-font-face">Hotspots In The Burgh</h1>
		
	</div>
	
	<div id="how-it-works-container">
		
		<div class="p-center">
		<h3 class="header-font-face">How It Works</h3>
		</div>
		
		<div class="how-it-works">
		<p class="paragraph-font-face p-center">We have an amazing list of partnered comapnies that we have marked on the map for you to choose from. If you would like to filter what type
		of spot you are looking for, use the buttons below the map and it will reload the map with the spots that you have selected. To view more 
		information about a specific spot click on the marker and then click "Get Details". When you are sure you would like to visit that spot, click
		the "Add Spot" and you will then see your itinerary, above the map, get one slot filled with your selected spot. Have fun creating your personalized
		custom city tour.</p>
		</div>
	</div>


<div id="itin-container">

<div id="location1"></div>
<div id="location2"></div>
<div id="location3"></div>
<div id="location4"></div>
<div id="location5"></div>

</div>

<div id="map-container">

<div id="map" ></div>

</div>




<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&callback=initMap">
	
</script>

<script type="text/javascript">
	
	$ = jQuery;
	$(document)
			.ready(
					function() {
						// type_holder
						// <div><label><input type="checkbox" class="types" value="mosque" />Mosque</label></div>

						var types = [ 'bar', 'museum', 'night_club', 'park',
								'restaurant', 'stadium' ];
						var html = '';

						$.each(types,function(index, value) {
											var name = value.replace(/_/g, " ");
											html += '<div><label><input type="radio" name ="type" class="types" value="'+ value +'" />'
													+ capitalizeFirstLetter(name)
													+ '</label></div>';
						});

						$('#type_holder').html(html);
					});

	// Helper method to capitalize first letter of input
	function capitalizeFirstLetter(string) {
		return string.charAt(0).toUpperCase() + string.slice(1);
	}

	var type = [];

	
	
	// Map will reload places based on what 'type' is selected
	function renderMapByType() {
		var center = {
				lat : 40.442169,
				lng : -79.994957
			};
		
		var locations = [];
		//var type = $(".types").val();
		//console.log(type);
			
		type = [];
		
		$('.types').each(function() {
			if ($(this).is(':checked')) {
				type.push($(this).val());
				console.log(type);
			}
		});
		
		
		$.ajax({
			url : 'API/typePlaceList/' + type,
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {
				
				console.log(type);
				//console.log(result);

				
				var j;
				for (var j = 0; j < Object.keys(result).length; j++) {
					//console.log(result[0]); 

					locations.push([ result[j].name, result[j].google_id,
							result[j].type, result[j].lat, result[j].lng,
							result[j].description ]);
					
					console.log(locations);

					createMarker(result[j]);
				}

			}
		})

		//this function creates the marker
		// we need to get this info from the datbase

		function createMarker(place, icon) {

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 13,
				center : center
			});

			var infowindow = new google.maps.InfoWindow({});
			var marker, count;
			for (count = 0; count < locations.length; count++) {

				marker = new google.maps.Marker({
					position : new google.maps.LatLng(locations[count][3],
							locations[count][4]),
					map : map,
					title : locations[count][0],
					animation : google.maps.Animation.DROP
				});

				google.maps.event.addListener(marker, 'click', (function(
						marker, count) {
					return function() {
						infowindow.setContent(locations[count][0] + '<br>'
								+ locations[count][5] + '<br>' + 
								'<a href="https://maps.googleapis.com/maps/api/place/details/json?placeid='
										+locations[count][1]+
										'&fields=name,opening_hours/weekday_text,formatted_address,formatted_phone_number,website&key=AIzaSyCzN_hQI7PADDHGD89Md1kj6DSFFORJmzY"> Get Details  </a>');
						infowindow.open(map, marker);
					}
				})(marker, count));
			}
		}
	}
	

	function initMap() {
		var center = {
			lat : 40.442169,
			lng : -79.994957
		};
		var locations = [];

		//get the data from our dp
		$.ajax({
			url : 'API/placeList',
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {

				var j;
				for (var j = 0; j < Object.keys(result).length; j++) {
					//console.log(result[0]); 

					locations.push([ result[j].name, result[j].google_id,
							result[j].type, result[j].lat, result[j].lng,
							result[j].description ]);

					createMarker(result[j]);
				}

			}
		})

		//this function creates the marker
		// we need to get this info from the datbase

		function createMarker(place, icon) {

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 13,
				center : center
			});

			var infowindow = new google.maps.InfoWindow({});
			var marker, count;
			
			for (count = 0; count < locations.length; count++) {

				marker = new google.maps.Marker({
					position : new google.maps.LatLng(locations[count][3],
							locations[count][4]),
					map : map,
					title : locations[count][0],
					animation : google.maps.Animation.DROP
				});
				
<<<<<<< HEAD
				google.maps.event.addListener(marker, 'click', (function(
						marker, count) {
					return function() {
				var placeDetails = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + locations[count][1]+'&fields=name,opening_hours/weekday_text,formatted_address,formatted_phone_number,website&key=AIzaSyCzN_hQI7PADDHGD89Md1kj6DSFFORJmzY';
=======
				//console.log(placeDetails);
				google.maps.event.addListener(marker, 'click', (function(
						marker, count) {
					return function() {
						var placeDetails = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + locations[count][1]+'&fields=name,opening_hours/weekday_text,formatted_address,formatted_phone_number,website&key=AIzaSyCzN_hQI7PADDHGD89Md1kj6DSFFORJmzY';
>>>>>>> 52f15af667b5fadec40ca946fed8d956122e520a
						infowindow.setContent(locations[count][0] + '<br>'
								+ locations[count][5] + '<br>' + 
								'<a href=" ' + placeDetails + '"> Get Details  </a>');
						infowindow.open(map, marker);
					}
				})(marker, count));
			}
		}

	}
</script>



<div style="float: left; width: 400;">
	<form name="frm_map" id="frm_map">
		<table>
			<tr>
				<td></td>
				<td><input type="button" value="Show" id="submit"
					onclick="renderMapByType();"> 
					<input type="button" value="Show All" id ="submit"
					onclick="initMap();" >
				</td>
			</tr>
			<tr>
				<th>Types</th>
				<td>
					<div id="type_holder" style="height: auto;">
						<!-- Dynamic Content -->
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>






<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%-- AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY --%>




<c:import url="/WEB-INF/jsp/footer.jsp" />