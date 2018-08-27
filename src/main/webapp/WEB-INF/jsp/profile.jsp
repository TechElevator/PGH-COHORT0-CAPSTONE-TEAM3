<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>






<h1 class="h1-center header-font-face">Welcome Back ${currentUser.userName}</h1>


<img src="img/avatar.png" id="avatar"/>


<div id="profile-sub-navbar">

	<div class="sub-navbar-button">
	<c:url var="dashboardHref" value="/users/${currentUser}" />
	<a href="${dashboardHref}">New Tour</a>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
	<a href="${newMessageHref}">Saved Tours</a>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
	<a href="${sentMessagesHref}">Suggestions</a>
	</div>
	
	<div class="sub-navbar-button">
	<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
	<a href="${changePasswordHref}">Change Password</a>
	</div>
		
</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />