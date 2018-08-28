<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<h1 class="h1-center header-font-face">Our Mission</h1>

<div>

	<div class="small-box">
		<p class="paragraph-font-face">Tours 'N At was founded in Pittsburgh, Pennsylvania in 2018. We aim 
		to promote local places in the Pittsburgh area that want to participate in our city 
		tours. We allow the customer to select five of their favorite places that we have
		partnered with to build their own customer tour. They can save their tours, and view
		them in the future. We have partnered with a variety of fun and exciting places to visit, such as 
		local bars, delicious resturaunts, relaxing parks, exciting sporting events, and for the 
		night owls favorite clubs. Take a look at all our partnered locations and sign up for your
		own custom Tour 'N At.
		</p>
	</div>

</div>

<br>
<br>


<h1 class="h1-center header-font-face">Meet The Team</h1>
<div class="box-container">

<div class="small-box">
	<c:url var="andrew" value="img/andrew.jpg"/>
	<img src="${andrew}" class="img-circle"/>
<h3 class="header-font-face">Andrew</h3>

</div>

<div class="small-box">
<c:url var="matt" value="img/matt.jpg"/>
<img src="${matt}" class="img-circle"/>
<h3 class="header-font-face">Matt</h3>
</div>

<div class="small-box">
<c:url var="ryan" value="img/ryan.jpg"/>
<img src="${ryan}" class="img-circle"/>
<h3 class="header-font-face">Ryan</h3>
</div>

</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />