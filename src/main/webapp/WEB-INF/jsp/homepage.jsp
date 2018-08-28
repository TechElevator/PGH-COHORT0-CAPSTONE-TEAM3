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
<div id="itin-container">

<div id="location1"></div>
<div id="location2"></div>
<div id="location3"></div>
<div id="location4"></div>
<div id="location5"></div>

</div>
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
<br />
<br />
<div>
<form>
  <div class="form-group">
    <label for="exampleFormControlInput1">Name:</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlInput1">Email address:</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">If you have any suggestions or comments, please let us know:</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
     <br />
     <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
</div>



<c:import url="/WEB-INF/jsp/footer.jsp" />