<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<style>
#map {
	height: 400px;
	width: 400px;
}
</style>




<div id="map"></div>
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
								+ locations[count][5]);
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

				google.maps.event.addListener(marker, 'click', (function(
						marker, count) {
					return function() {
						infowindow.setContent(locations[count][0] + '<br>'
								+ locations[count][5]);
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
					onclick="renderMapByType();"> <input type="reset" value="Reset">
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