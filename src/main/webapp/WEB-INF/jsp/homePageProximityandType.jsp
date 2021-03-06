<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

 
    
    
    <style>
      
      #map {
        height: 300px;
        width: 300px;
      
      }

    </style>

 
    <div id="map"></div>
   
   	
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
    
   //load page, select type, populate map with markers 
    //create markers based on type
    //click marker
    //the infowindow populates with name, brief description, type and a details link
    //
    
    //create 
    // once the marker is clicked
    // get the data from the local data base, put into a js array
    // from that arry we will populate the infowindow
    // get long and lat
    $ = jQuery;
    $(document).ready(function(){
        // type_holder
        // <div><label><input type="checkbox" class="types" value="mosque" />Mosque</label></div>

        var types = ['bar','cafe','cemetery','church','library','lodging','museum','night_club','park','parking','restaurant','spa','stadium','zoo'];
        var html = '';

        $.each(types, function( index, value ) {
            var name = value.replace(/_/g, " ");
            html += '<div><label><input type="checkbox" class="types" value="'+ value +'" />'+ capitalizeFirstLetter(name) +'</label></div>';
        });

        $('#type_holder').html(html);
    });

    function capitalizeFirstLetter(string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
    }

    var map;
    var infowindow;
    var autocomplete;
    var countryRestrict = {'country': 'in'};
    var selectedTypes = [];

    function initialize()
    {
        autocomplete = new google.maps.places.Autocomplete((document.getElementById('address')), {
            types: ['(regions)'],
           // componentRestrictions: countryRestrict
        });

        var pyrmont = new google.maps.LatLng(40.4406, -79.9959);

        map = new google.maps.Map(document.getElementById('map'), {
            center: pyrmont,
            zoom: 13
        });
    }

    function renderMap()
    {
        // Get the user defined values
        var address = document.getElementById('address').value;
        var radius  = parseInt(document.getElementById('radius').value) * 1000;
        
        // get the selected type
        selectedTypes = [];
        $('.types').each(function(){
            if($(this).is(':checked'))
            {
                selectedTypes.push($(this).val());
            }
        });

        var geocoder    = new google.maps.Geocoder();
        var selLocLat   = 0;
        var selLocLng   = 0;

        geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK')
            {
                //console.log(results[0].geometry.location.lat() + ' - ' + results[0].geometry.location.lng());

                selLocLat   = results[0].geometry.location.lat();
                selLocLng   = results[0].geometry.location.lng();

                //var pyrmont = new google.maps.LatLng(52.5666644, 4.7333304);

                var pyrmont = new google.maps.LatLng(selLocLat, selLocLng);

                map = new google.maps.Map(document.getElementById('map'), {
                    center: pyrmont,
                    zoom: 13
                });

                //console.log(selectedTypes);

                var request = {
                    location: pyrmont,
                    //radius: 5000,
                    //types: ["atm"]
                    radius: radius,
                    types: selectedTypes,
                
                };

                infowindow = new google.maps.InfoWindow();

                var service = new google.maps.places.PlacesService(map);
                service.nearbySearch(request, callback);
            }
            else
            {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
		//we need to search based off our data base
		// then only display based on users proximity
		//or get all of the place ids in the users proximity
		
    function callback(results, status)
    {
        if (status == google.maps.places.PlacesServiceStatus.OK)
        {
            for (var i = 0; i < results.length; i++)
            {
            	var	googleSet = new Set;
            		googleSet.add(results[i].place_id);
            		console.log(results);
		              createMarker(results[i], results[i].icon);

            	}
            			$.ajax({
            				url:	  'API/placeList', 
            				type: 'GET',
            				dataType: 'json',
            				contentType: 'application/json',
            				success: function(result) {
            					//console.log(result[0].google_id);     					
            					var j; 
            					for(var j = 0; j < Object.keys(result).length; j++){
            						if(googleSet.has(result[j].google_id)){
            							console.log(result[j].google_id);
		              // 	createMarker(result[j].google_id, result[j].icon);
            						}
            					}	
            				}          			
  					})
            	
        	}
   	}

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
    </script>


<div style="float: right;">
    <div id="map" style="width:900px; height:600px;"></div>
</div>

<div style="float: left; width: 400;">
    <form name="frm_map" id="frm_map">
        <table>
            <tr>
                <th>Address</th>
                <td>
                    <input type="text" name="address" id="address" value="Pittsburgh, Pennsylvania">
                </td>
            </tr>
            <tr>
                <th>Radius</th>
                <td>
                    <input type="text" name="radius" id="radius" value="5" placeholder="In KM">
                </td>
            </tr>
            <tr>
                <th>Types</th>
                <td>
                    <div id="type_holder" style="height: 200px; overflow-y: scroll;">
                        <!-- Dynamic Content -->    
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="Show" id="submit" onclick="renderMap();">
                    <input type="reset" value="Reset">
                </td>
            </tr>
        </table>
    </form>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb78dI6bMnP859k201BGwYlbxS-9iuUDY&libraries=places&callback=initialize" async defer></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>





		
<c:import url="/WEB-INF/jsp/footer.jsp" />