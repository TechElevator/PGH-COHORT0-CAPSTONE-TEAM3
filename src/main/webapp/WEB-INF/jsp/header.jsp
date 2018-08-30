<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Tours N'At</title>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    


	    <c:url var="cssHref" value="/css/site.css" />

		<link rel="stylesheet" type="text/css" href="${cssHref}">
		
		<script type="text/javascript">
			$(document).ready(function() {
				<%--$("time.timeago").timeago(); --%>
				
				$("#logoutLink").click(function(event){
					$("#logoutForm").submit();
				});
				
				var pathname = window.location.pathname;
				$("nav a[href='"+pathname+"']").parent().addClass("active");
				
			});
			
			
		</script>
		
	</head>
	<body>
		<header>
				
			<div class="jumbotron">
			
			<div id="logo-container">
			<c:url var="imgSrc" value="/img/Tours'nAt.png"/>
			<a href="${homePageHref}"><img src="${imgSrc}" id="logo" /></a>
			</div>
			</div>
		</header>
			
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<c:url var="homePageHref" value="/" />
					<li class="navbar-font-face"><a href="${homePageHref}">Home</a></li>
					<c:url var="hotspotsBurgh" value="/hotspotsBurgh" />
					<li class="navbar-font-face"><a href="${hotspotsBurgh}">Hotspots In The Burgh </a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							<li class="navbar-font-face"><a href="${newUserHref}">Sign Up</a></li>
							<c:url var="loginHref" value="/login" />
							<li class="navbar-font-face"><a href="${loginHref}">Log In</a></li>
						</c:when>
						<c:otherwise>
						
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
							</form>
							<c:if test="${not empty currentUser}">
							<c:url var="profileHref" value="/users/${currentUser.userName}/profile"/>
						<li class="navbar-font-face"><a href="${profileHref }" id="currentUser">${currentUser.userName}</a></li>
						</c:if>	
							<li class="navbar-font-face"><a id="logoutLink" href="#">Log Out</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
			
		<div class="container">