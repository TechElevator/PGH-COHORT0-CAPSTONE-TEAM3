<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





<header id="myCarousel" class="carousel slide">

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('img/category-img/stadium.jpg');"></div>
                <div class="carousel-caption">
                    <h2 class="h1-center header-font-face">Sporting Events</h2>
                    <p class="navbar-font-face">Join the masses with the fans of the best sport teams across the country.</p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/category-img/park.jpg');"></div>
                <div class="carousel-caption">
                    <h2 class="h1-center header-font-face">Parks</h2>
                    <p class="navbar-font-face">Take a siesta or have a picnic in some of the most beautiful parks around the Pittsburgh area.</p>
                
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/category-img/museum.jpg');"></div>
                <div class="carousel-caption">
                    <h2 class="h1-center header-font-face">Museums</h2>
                    <p class="navbar-font-face">Like art? Like history? Like birds? Like science? Don't worry we got you covered!<br>
                    We're bringing you everything about history and the world through our local museums	.</p>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/category-img/bar.jpg');"></div>
                <div class="carousel-caption">
                    <h2 class="h1-center header-font-face">Bars</h2>
                    <p class="navbar-font-face">Time to unwind, hangout with some friends and play a little pool or maybe darts. Check out some of the local bars that Pittsburgh has to offer. </p>
                
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('img/category-img/nightlife.jpg');"></div>
                <div class="carousel-caption">
                    <h2 class="h1-center header-font-face">Night Clubs</h2>
                    <p class="navbar-font-face">Local bars not wild enough for you? Are you tired of long walks in the park? Sick of babysitting all day? Need some time to yourself or for you significant other?
                    well make sure you schedule a stop at one of the best night clubs in Pittsburgh. From erotic clubs to dance clubs we can supply your needs.</p>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

</header>





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
	<img src="${andrew}" class="img-circle img-responsive"/>
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

<script>
$('.carousel').carousel({
	interval: 4000 //changes the speed
	})
</script>

<c:import url="/WEB-INF/jsp/footer.jsp" />