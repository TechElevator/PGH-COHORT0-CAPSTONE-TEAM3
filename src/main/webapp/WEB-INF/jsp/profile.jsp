<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<h1 class="h1-center header-font-face">Welcome Back ${currentUser.userName}</h1>


	<c:url var="dashboardHref" value="/users/${currentUser}" />
	<a href="${dashboardHref}">New Tour</a>
	
	<c:url var="newMessageHref" value="/users/${currentUser}/messages/new" />
	<a href="${newMessageHref}">Saved Tours</a>
	
	<c:url var="sentMessagesHref" value="/users/${currentUser}/messages" />
	<a href="${sentMessagesHref}">Suggestions</a>
	
	<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" />
	<a href="${changePasswordHref}">Change Password</a>




<c:import url="/WEB-INF/jsp/footer.jsp" />