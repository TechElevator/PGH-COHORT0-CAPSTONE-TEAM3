<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<div class="small-box">
	<c:url var="avatar" value="/img/avatar.png"/>
	<img src="${avatar}" class="img-circle"/>
</div>

<h1 class="h1-center header-font-face">Welcome Back ${currentUser.userName}</h1>


<div id="profile-sub-navbar">

	<div class="sub-navbar-button">
	<c:url var="dashboardHref" value="/users/${currentUser}" />
	<p class="paragraph-font-face"><a href="${dashboardHref}">New Tour</a></p>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
	<p class="paragraph-font-face"><a href="${newMessageHref}">Saved Tours</a></p>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
	<p class="paragraph-font-face"><a href="${sentMessagesHref}">Suggestions</a></p>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
	<p class="paragraph-font-face"><a href="${changePasswordHref}">Change Password</a></p>
	</div>
		
</div>

<div id="itinerary-container">
<c:url var="formAction" value="/homepage" />
<c:forEach items="${userItin}" var="itineraryByUser">
<div id="itin-container">
    
    <form method="GET" action="profile">
    
    <div id="location1" style="background: url(../../img/400x200/${itineraryByUser.google_id_one}.jpg); width:400px; height:200">${itineraryByUser.name_one}</div>
     
    <div id="location2" style="background: url(../../img/400x200/${itineraryByUser.google_id_two}.jpg); width:400px; height:200">${itineraryByUser.name_two}</div>
    
    <div id="location3" style="background: url(../../img/400x200/${itineraryByUser.google_id_three}.jpg); width:400px; height:200">${itineraryByUser.name_three}</div>
     
    <div id="location4" style="background: url(../../img/400x200/${itineraryByUser.google_id_four}.jpg); width:400px; height:200">${itineraryByUser.name_four}</div>
     
    <div id="location5" style="background: url(../../img/400x200/${itineraryByUser.google_id_five}.jpg); width:400px; height:200">${itineraryByUser.name_five}</div>
   
    
   
    
   
   
    
    
    </form>

</div>

</c:forEach>
</div>


<div id="itinerary-container">

	<c:forEach items="${itinerary}" var="itinerary">
	<div id="itin-container">
		
		<form method="GET" action="profile">
			
		<div id="location1">${itinerary.place_Name}</div>
		<div id="location2"></div>
		<div id="location3"></div>
		<div id="location4"></div>
		<div id="location5"></div>
		
		</form>
	
	</div>
	
	</c:forEach>

</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />