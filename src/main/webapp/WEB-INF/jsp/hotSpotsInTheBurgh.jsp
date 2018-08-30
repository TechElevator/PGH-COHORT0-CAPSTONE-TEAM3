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
		<p class="paragraph-font-face p-center">We have an amazing list of
			partnered comapnies that we have marked on the map for you to choose
			from. If you would like to filter what type of spot you are looking
			for, use the buttons below the map and it will reload the map with
			the spots that you have selected. To view more information about a
			specific spot click on the marker and then click "Get Details". When
			you are sure you would like to visit that spot, click the "Add Spot"
			and you will then see your itinerary, above the map, get one slot
			filled with your selected spot. Have fun creating your personalized
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

	<div id="map"></div>

</div>





<div id="types-filter-container">
	<form name="frm_map" id="frm_map">
		
		<div id="type_holder" >
			<p>Types</p>
		</div>
		
		<div id="submit-buttons-container">
		<div class="submit-button">
		<input type="button" value="Search All Spots" id="submit" onclick="initMap();">
		</div>
		<div class="submit-button" id="getRoute">
		
		</div>		
		</div>
		
		
	</form>
</div>

<br>
<div id="location-deets-container">

	<div id="deets-img-container"></div>
	<div id="deets-info-container">

		<div id="deets-title"></div>
		<div id="deets-address"></div>
		<div id="deets-website"></div>
		<div id="deets-hoursOrPhone"></div>

		<div id="add-button"></div>
		<div id="delete-button"></div>


	</div>

</div>

<div id="panel-container">

	<div id="panel"></div>

</div>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2EShyhB3vFvhOeMjexOBUgtF0-iZtvWo&callback=initMap">
	
</script>


<script type="text/javascript">
	//get the type marker info
	//of the markers dont have info create function for this
	

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
											html += '<div class="radio-button-container"><input type="radio"  name="type" class="types" value="'+ value +'"/>'
													+ '<p class="p-radio-button-text">'  + capitalizeFirstLetter(name) + '</p>'
													+ '</div>';
						});
						
						var container = $('#type_holder');
						
						container.html(html);
						
						container.find('input').on('change', renderMapByType);
						
					});
	//*****************************************************************
	
	
	
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
		var type = [];
		
		$('.types').each(function() {
			if ($(this).is(':checked')) {
				type.push($(this).val());
				//console.log(type);
			}
		});
		
		
		$.ajax({
			url : 'API/typePlaceList/' + type,
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(result) {
				
				//console.log(type);
				//console.log(result);
				
				var j;
				for (var j = 0; j < Object.keys(result).length; j++) {
					//console.log(result[0]); 
					locations.push([ result[j].name, result[j].google_id,
							result[j].type, result[j].lat, result[j].lng,
							result[j].description ]);
					
					//console.log(locations[j]);
					createMarker(result[j]);
				}
			}
		})
	
		
		
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
								infowindow.setContent(locations[count][0] + '<br>'+ locations[count][5] + '<br>' + '<input type="button" id= "details" value="Get Details" >');
							
			infowindow.open(map, marker);
			
			
			$("#deets-img-container").empty();
			$("#deets-title").empty();
			$("#deets-address").empty();
			$("#deets-website").empty();
			$("#deets-hoursOrPhone").empty();
			$("#add-button").empty();
			
			//get the details when clicked
			$("#details").one('click', function(){
				$.ajax({
					url:	 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + locations[count][1]+'&fields=name,opening_hours/weekday_text,formatted_address,formatted_phone_number,website&key=AIzaSyB2EShyhB3vFvhOeMjexOBUgtF0-iZtvWo', 
					type: 'GET',
					dataType: 'json',
					contentType: 'application/json',
					success: function(result) {
						//console.log(result);
						
						$("#deets-img-container").empty();
	        				$("#deets-title").empty();
	        				$("#deets-address").empty();
	        				$("#deets-website").empty();
	        				$("#deets-hoursOrPhone").empty();
	        				$("#add-button").empty();
	        			
	        				
	        				$("#deets-img-container").append('<img src="img/400x200/' + locations[count][1] + '.jpg"' + ' alt="no alt for img">');
	        				$("#deets-title").append(result.result.name);
	        				$("#deets-address").append(result.result.formatted_address);
	        				$("#deets-website").append('<a href="' + result.result.website +'">Check out their site to learn more</a>');
	        				$("#deets-hoursOrPhone").append(result.result.hasOwnProperty("opening_hours") ? result.result.opening_hours.weekday_text : result.result.formatted_phone_number  +"<br>"+' hours not available');
	        				
	        				
	        				
	        				$("#add-button").append('<input type="image" src="img/add-button.png" name="add-button">');
	        				
	        				
	        				
	        				$("#add-button input").one('click', function(){
	        					
	        					//add place id's to an array max 5 length
		        				if(arrayOfPlaceIdForRoute.length < 5 && !arrayOfPlaceIdForRoute.includes(locations[count][1])){
		        				arrayOfPlaceIdForRoute.push(locations[count][1]); 
		        				console.log(arrayOfPlaceIdForRoute);
		        				

	        					if ( $('#location1').is(':empty')) {
	        						$("#location1").html('<img src="img/400x200/' + locations[count][1] + 
	        								'.jpg"' + 'alt="no alt for img" height="100px" width="200px">');
	        					}
	        
	        					else if ( $('#location2').is(':empty')) {
	        						$('#location2').html('<img src="img/400x200/' + locations[count][1] + 
	        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
	        					}
	        					
	        					else if ( $('#location3').is(':empty')) {
	        						$('#location3').html('<img src="img/400x200/' + locations[count][1] + 
	        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
	        					}
	        					
	        					else if ( $('#location4').is(':empty')) {
	        						$('#location4').html('<img src="img/400x200/' + locations[count][1] + 
	        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
	        					}
	        					
	        					else if ( $('#location5').is(':empty')) {
	        						$('#location5').html('<img src="img/400x200/' + locations[count][1] + 
	        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
	        						
	        						$("#getRoute").html('<input type="button" value="Get Route" id="submit" onclick="routeMap();">');
	        					}
	        					
		        				}
	        					
	        				});
	        				
	        				
	        				
									}          			
							})
						});
			
							}
						})(marker, count));
					}
				}
	}
	
	
	var currentDetail = null;
		var arrayOfPlaceIdForRoute = [];
//***********************************************************************	
	function initMap() {
		
		
		var center = {
			lat : 40.442169,
			lng : -79.994957
		};
		var locations = [];
		//get the data from our db
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
                                '<input type="button" value="Get Details" id="details"/>');	
                                infowindow.open(map, marker);
                                //click button to get details
						
						
					    	$("#details").one('click', function(){
						    //alert("The paragraph was clicked.");
      
                                
                                        $.ajax({
                                            url:	 'https://maps.googleapis.com/maps/api/place/details/json?placeid=' + locations[count][1]+'&fields=name,opening_hours/weekday_text,formatted_address,formatted_phone_number,website&key=AIzaSyB2EShyhB3vFvhOeMjexOBUgtF0-iZtvWo' , 
                                            type: 'GET',
                                            dataType: 'json',
                                            contentType: 'application/json',
                                            success: function(result) {
                                            console.log(result);
                                                
                                            var webLink = result.result.website;
                                            $("#deets-img-container").empty();
                                            $("#deets-title").empty();
                                            $("#deets-address").empty();
                                            $("#deets-website").empty();
                                            $("#deets-hoursOrPhone").empty();
                                            $("#add-button").empty();		        				
                                            
                                            $("#deets-img-container").html('<img src="img/400x200/' + locations[count][1] + '.jpg"' + ' alt="no alt for img">');
                                            $("#deets-title").html(result.result.name);
                                            $("#deets-address").html(result.result.formatted_address);
                                            $("#deets-website").html('<a href="' + result.result.website +'">Check out their site to learn more</a>');
                                            
                                            $("#deets-hoursOrPhone").html(result.result.hasOwnProperty("opening_hours") ? result.result.opening_hours.weekday_text : result.result.formatted_phone_number  +"<br>"+' hours not available');
                                            
                                            $("#add-button").html('<input type="image" src="img/add-button.png" name="add-button">');
                                            
                                            
		        				
					        				$("#add-button input").one('click', function(){
					        					
					        					//add place id's to an array max 5 length
						        				if(arrayOfPlaceIdForRoute.length < 5 && !arrayOfPlaceIdForRoute.includes(locations[count][1])){
						        				arrayOfPlaceIdForRoute.push(locations[count][1]); 
						        				//console.log(arrayOfPlaceIdForRoute);
						        				
			
					        					if ( $('#location1').is(':empty')) {
					        						$("#location1").html('<img src="img/400x200/' + locations[count][1] + 
					        								'.jpg"' + 'alt="no alt for img" height="100px" width="200px">');
					        					}
					        
					        					else if ( $('#location2').is(':empty')) {
					        						$('#location2').html('<img src="img/400x200/' + locations[count][1] + 
					        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
					        					}
					        					
					        					else if ( $('#location3').is(':empty')) {
					        						$('#location3').html('<img src="img/400x200/' + locations[count][1] + 
					        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
					        					}
					        					
					        					else if ( $('#location4').is(':empty')) {
					        						$('#location4').html('<img src="img/400x200/' + locations[count][1] + 
					        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
					        					}
					        					
					        					else if ( $('#location5').is(':empty')) {
					        						$('#location5').html('<img src="img/400x200/' + locations[count][1] + 
					        								'.jpg"' + ' alt="no alt for img" height="100px" width="200px">');
					        						
					        						$("#getRoute").html('<input type="button" value="Get Route" id="submit" onclick="routeMap();">');
					        					}
						        				}
                                            });
                                   
                                    }
					        			
					        					
					        				});
		        				}
											})
					}
					
				})(marker, count)); // add event listener
			} // for loop for markers
		} // create marker
	} // init map
	
	//function to create a route************************************************************
	function routeMap() {
		var center = {
			lat : 40.442169,
			lng : -79.994957
		};
		var waypoints = [];
		var startPoint;
		var endPoint;
		
		for(var i = 1; i <= arrayOfPlaceIdForRoute.length-1; i++) {
			
			if (i > 0 && i < arrayOfPlaceIdForRoute.length-1) {
				
				waypoints.push(String(arrayOfPlaceIdForRoute[i]));
				//console.log(waypoints);
			}
			else {		
				endPoint = (arrayOfPlaceIdForRoute[arrayOfPlaceIdForRoute.length-1]).toString();
					console.log(endPoint);
					startPoint = arrayOfPlaceIdForRoute[0].toString();
					console.log(startPoint);

			}
			
		}
		
		

		var directionsService = new google.maps.DirectionsService();
		var directionsDisplay = new google.maps.DirectionsRenderer();

		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 16,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		directionsDisplay.setMap(map);
		directionsDisplay.setPanel(document.getElementById('panel'));

		var request = {
			
			origin : {
			placeId : startPoint
			},
			
			destination : {
			placeId : endPoint
			},
			
			waypoints : [ {
				stopover : true,
				location : {
				placeId : waypoints[0]
				}
			}, {
				stopover : true,
				location : {
				placeId : waypoints[1]
				}
			}, {
				stopover : true,
				location : {
				placeId : waypoints[2]
				}
			}],

			travelMode : google.maps.DirectionsTravelMode.DRIVING

		};

		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
			}
		});

	}
</script>



<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%-- AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY --%>




<c:import url="/WEB-INF/jsp/footer.jsp" />