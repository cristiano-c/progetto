<%--
  Created by IntelliJ IDEA.
  User: kazuhira
  Date: 22/07/16
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html data-ng-app="iftttApp">
<head>
<title>IFTTT Polito</title>

<link rel="icon" href="./static/images/favicon.ico" />

<!-- JavaScript Libraries -->
<script src="./static/bower_components/jquery/dist/jquery.js"></script>
<script src="./static/bower_components/angular/angular.js"></script>
<script src="./static/bower_components/angular-route/angular-route.js"></script>
<script src="./static/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="./static/bower_components/notifyjs/dist/notify.js"></script>
<script src="./static/scripts/engine.js"></script>
<script src="./static/scripts/spin.js"></script>
 
<script src="./static/scripts/jqueryspin.js"></script>
 
<script src="./static/scripts/jstz.js"></script>
<script
	src="./static/bower_components/sweetalert/dist/sweetalert.min.js"></script>
<script src="./static/bower_components/moment/moment.js"></script>
<script
	src="./static/bower_components/angular-sweetalert/dist/ngSweetAlert.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>

<!-- Cascade Style Sheets -->
<link rel="stylesheet"
	href="./static/bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet"
	href="./static/bower_components/bootstrap/dist/css/bootstrap-theme.css">
<link rel="stylesheet" href="./static/stylesheets/2-col-portfolio.css">
<link rel="stylesheet" href="./static/stylesheets/index.css">
<link rel="stylesheet" href="./static/stylesheets/loginPage.css">
<link rel="stylesheet" type="text/css"
	href="./static/bower_components/sweetalert/dist/sweetalert.css">


</head>
<body data-ng-controller="indexController">

	<!-- TOP NAVBAR BEGIN -->
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#home"><span
					class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a type="submit" href="" data-ng-if="!iftttLogged"
						data-toggle="modal" data-target="#loginIFTTTModal"
						data-ng-click="routeListener('createRecipe')">Create a recipe
							<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
					</a></li>

					<li><a type="submit" href="#createRecipe"
						data-ng-if="iftttLogged" data-target="#loginIFTTTModal"> <span
							aria-hidden="true">Create a recipe</span>
					</a></li>

					<li><a type="submit" href="#index/myRecipes"
						data-ng-if="iftttLogged" data-target="#loginIFTTTModal"> <span
							aria-hidden="true">My recipes</span>
					</a></li>

					<li><a href="#passwordChange" data-ng-if="iftttLogged"> <span
							aria-hidden="true">Profile&Setup</span>
					</a></li>

					<li><a data-ng-if="!iftttLogged" href="#publicRecipes">
							Public recipes <span class="glyphicon glyphicon-share"
							aria-hidden="true"></span>
					</a> <a data-ng-if="iftttLogged" href="#publicRecipes"> Public
							recipes </a></li>

				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">

						<a href="" data-ng-click="logoutIFTTT()"> <img
							id="IFTTTLogoON" data-ng-if="iftttLogged" data-toggle="popover" data-placement="bottom"
							data-trigger="hover" data-content="Click to logout from IFTTT Polito"
							src="./static/images/logos/polito-logged-in.png" height="30"
							width="30" />
						</a> <img id="iftttLogoOFF" data-ng-if="!iftttLogged"
							data-toggle="popover" data-placement="bottom"
							data-trigger="hover" data-content="Not logged in IFTTT Polito"
							src="./static/images/logos/polito-logged-out.png" height="30"
							width="30" /> <a href="" data-ng-click="logoutTwitter()"> <img
							id="twitterLogoON" data-ng-if="twitterLogged" data-toggle="popover" data-placement="bottom"
							data-trigger="hover" data-content="Click to logout from Twitter"
							src="./static/images/logos/twitter-logged-in.png" height="34"
							width="34" />
						</a> <span data-toggle="modal" data-ng-show="!twitterLogged"
							data-target="#loginTwitterModal"
							data-ng-click="routeListener('currentUrl')"> <img
							id="twitterLogoOFF" data-toggle="popover" data-placement="bottom"
							data-trigger="hover"
							data-content="Not logged in Twitter - Click to connect"
							src="./static/images/logos/twitter-logged-out.png" height="34"
							width="34" />
						</span> <a data-ng-click="logoutGoogle()"> <img id="googleLogoON"
							data-ng-if="googleLogged" data-toggle="popover" data-placement="bottom"
							data-trigger="hover" data-content="Click to logout from Google"
							src="./static/images/logos/google-logged-in.png" height="30"
							width="30" />
						</a> <span data-toggle="modal" data-ng-show="!googleLogged"
							data-target="#loginGoogleModal"
							data-ng-click="routeListener('currentUrl')"> <img
							id="googleLogoOFF" style="margin-left: 3px" data-toggle="popover"
							data-placement="bottom" data-trigger="hover"
							data-content="Not logged in Google - Click to connect"
							src="./static/images/logos/google-logged-out.png" height="30"
							width="30" />
						</span>

					</div>

					<button type="submit" class="btn btn-default"
						data-ng-show="!iftttLogged" style="margin-left: 6px"
						data-toggle="modal" data-target="#loginIFTTTModal"
						data-ng-click="routeListener('index/myRecipes')">
						<span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
						Login
					</button>

					<a href="#index/createAccount" class="btn btn-default"
						style="margin-left: 6px" data-ng-show="!iftttLogged"> <span
						class="glyphicon glyphicon-user" aria-hidden="true"></span> Create
						account
					</a> <a  class="btn btn-default"
						style="margin-left: 6px" data-ng-show="iftttLogged"
						data-ng-click="deleteAccount()"> <span style="color: #761c19"
						class="glyphicon glyphicon-trash" aria-hidden="true"></span>
						Delete account
					</a>

					<button type="submit" class="btn btn-default"
						data-ng-if="iftttLogged" data-ng-click="logoutIFTTT()">
						Logout <span class="glyphicon glyphicon-log-out"
							aria-hidden="true"></span>
					</button>

				</form>

			</div>
			<!-- /.navbar-collapse -->

			<!-- NOTIFICATIONS WRAPPER BEGIN -->
			<div id="notificationsWrapper" style="margin: auto; padding-top: 5px"></div>
			<!-- NOTIFICATIONS WRAPPER END -->


		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- TOP NAVBAR END -->

	<span hidden data-ng-bind="$location.path()"></span>


	<!-- INNER PAGES BEGIN -->
	<ng-view></ng-view>
	<!-- INNER PAGES END -->


	<!-- MODAL FORM IFTTT -- BEGIN -->
	<div class="modal fade" id="loginIFTTTModal" tabindex="-1"
		role="dialog" aria-labelledby="Login" aria-hidden="true"
		style="padding-top: 10%">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h2 class="modal-title">
						<img src="./static/images/logos/polito-logged-in.png" height="30"
							width="30" /> Login with IFTTT Polito
					</h2>
				</div>

				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form class="form-horizontal" method="post"
						action="/progetto/login">
						<div class="form-group">
							<label for="inputUsernameIFTTT" class="col-sm-3 control-label">IFTTT
								Polito Username <span class="glyphicon glyphicon-user"
								aria-hidden="true"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="inputUsernameIFTTT"
									placeholder="Username" name="username">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordIFTTT" class="col-sm-3 control-label">Password
								<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
							</label>
							<div class="col-sm-9">
								<input type="password" class="form-control"
									id="inputPasswordIFTTT" placeholder="Password" name="password">
							</div>
						</div>
						<div class="form-group">

							<div class="col-sm-offset-3 col-sm-9">

								<!-- Login button -->
								<div class="col-md-5 col-md-offset-4">
									<button id="ifttt-auth-btn" type="submit"
										class="btn btn-default">Sign in</button>
								</div>
							</div>

							<div class="col-sm-offset-3 col-sm-9">
								<hr>
								<!-- Forgot password? -->
								<div class="col-md-5">
									<a href="#index/forgotPassword" data-ng-click="closeModal()">Forgot
										password?</a>
								</div>

								<!-- Create new account link -->
								<div class="col-md-5 col-md-offset-2">
									<a href="#index/createAccount" data-ng-click="closeModal()">Create an account</a>
								</div>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL FORM IFTTT -- END -->

	<!-- MODAL FORM GOOGLE -- BEGIN -->
	<div class="modal fade" id="loginGoogleModal" tabindex="-1"
		role="dialog" aria-labelledby="Login" aria-hidden="true"
		style="padding-top: 10%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- <button id="google-auth-btn" type="submit" class="btn btn-default" ng-click="requestGoogleAuth()">Sign in</button> -->
					<div style="text-align: center">
						<h3 class="modal-title">
							<img src="./static/images/logos/google-logged-in.png" height="25"
								width="25" /> Login with Google
						</h3>
					</div>
				</div>
				<div class="modal-body text-center">
					<a id="google-auth-btn" type="submit" class="btn btn-default"
						data-ng-click="requestGoogleAuth()"> Connect </a>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL FORM GOOGLE -- END -->


	<!-- Updated Twitter login modal BEGIN -->
	<div class="modal fade" id="loginTwitterModal" tabindex="-1"
		role="dialog" aria-labelledby="Login" aria-hidden="true"
		style="padding-top: 10%">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- <button id="google-auth-btn" type="submit" class="btn btn-default" ng-click="requestGoogleAuth()">Sign in</button> -->
					<div style="text-align: center">
						<h3 class="modal-title">
							<img src="./static/images/logos/twitter-logged-in.png"
								height="45" width="45" /> Login with Twitter
						</h3>
					</div>
				</div>
				<div class="modal-body text-center">
					<a id="twitter-auth-btn" type="submit" class="btn btn-default"
						data-ng-click="requestTwitterAuth()"> Connect </a>
				</div>
			</div>
		</div>
	</div>
	<!-- Updated Twitter login modal END -->


	<!-- MODAL FORM RECIPE DESCRIPTION -- BEGIN -- DA RISTRUTTURARE -->
	<div class="modal fade" id="recipedDescriptionModal" tabindex="-1"
		role="dialog" aria-labelledby="Login" aria-hidden="true"
		style="padding-top: 10%">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="row text-center">
						<h2 class="modal-title">
							<img src="./static/images/insert-description.png" height="30"
								width="30" /> Recipe description
						</h2>
					</div>
				</div>

				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<div class="form-group">
						<label for="recipedDescriptionInput">Please give a
							description for this recipe:</label>
						<textarea class="form-control" rows="5"
							id="recipedDescriptionInput"
							data-ng-model="recipedDescriptionInput" maxlength="255"></textarea>
							<span>{{255 - recipedDescriptionInput.length}} left </span>
						<div class="row text-center" style="padding-top: 25px;">
							<button type="submit" class="btn btn-primary"
								data-ng-click="saveRecipeDescription()">Submit</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL FORM RECIPE DESCRIPTION -- END -->

	<div class="modal fade" id="spinnerModal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true" style="padding-top: 10%">

		<div class="modal-body">

			<div id="serverSpinner"></div>

		</div>

	</div>


	<!-- extra space bottom page -->
	<div style="padding-bottom: 6%">
		<br>
	</div>

	<!-- BOTTOM NAVBAR BEGIN -->
	<nav
		class="navbar navbar-inverse navbar-fixed-bottom navbar-default center">
		<div class="container">

			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-navbar-collapse-2"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-inner"
				id="bs-navbar-collapse-2">
				<ul class="nav navbar-nav">
					<li><a href="#aboutSite"><span
							class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
							About the site</a></li>
					<li><a href="#ourTeam"><span
							class="glyphicon glyphicon-cog" aria-hidden="true"></span> The
							developers</a></li>
					<li><a href="http://www.polito.it" target="_blank"><span
							class="glyphicon glyphicon-education" aria-hidden="true"></span>
							PoliTo</a></li>
					<li><a href="https://creativecommons.org" target="_blank">Copyright
							<span class="glyphicon glyphicon-copyright-mark"
							aria-hidden="true"></span> IFTTT by PoliTo 2016
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-->
	</nav>
	<!-- BOTTOM NAVBAR END -->

</body>

<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();

		var opts = {
			lines : 15 // The number of lines to draw
			,
			length : 28 // The length of each line
			,
			width : 14 // The line thickness
			,
			radius : 0 // The radius of the inner circle
			,
			scale : 3 // Scales overall size of the spinner
			,
			corners : 1 // Corner roundness (0..1)
			,
			color : '#000' // #rgb or #rrggbb or array of colors
			,
			opacity : 0.25 // Opacity of the lines
			,
			rotate : 0 // The rotation offset
			,
			direction : 1 // 1: clockwise, -1: counterclockwise
			,
			speed : 8 // Rounds per second
			,
			trail : 86 // Afterglow percentage
			,
			fps : 20 // Frames per second when using setTimeout() as a fallback for CSS
			,
			zIndex : 2e9 // The z-index (defaults to 2000000000)
			,
			className : 'spinner' // The CSS class to assign to the spinner
			,
			top : '90%' // Top position relative to parent
			,
			left : '90%' // Left position relative to parent
			,
			shadow : false // Whether to render a shadow
			,
			hwaccel : false // Whether to use hardware acceleration
			,
			position : 'absolute' // Element positioning
		};

		var target = document.getElementById('serverSpinner');
		var spinner = new Spinner(opts).spin(target);

		spinner.stop();

		$('#qwe1').click(function() {
			setSpinner(true);
		});

		$('#qwe2').click(function() {
			setSpinner(false);
		});

	});
</script>

</html>
