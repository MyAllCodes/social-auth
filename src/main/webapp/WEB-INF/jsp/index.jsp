<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
<style>
#login {
	display: block;
}

#logout {
	display: none;
}
</style>
</head>
<body>
	<script>
		function statusChangeCallback(response) { // Called with the results from FB.getLoginStatus().
			if (response.status === 'connected') { // Logged into your webpage and Facebook.
				loginAPI();
			} else { // Not logged into your webpage or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this webpage.';
			}
		}

		function checkLoginState() { // Called when a person is finished with the Login Button.
			FB.getLoginStatus(function(response) { // See the onlogin handler
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '556667549722501',
				cookie : true, // Enable cookies to allow the server to access the session.
				xfbml : true, // Parse social plugins on this webpage.
				version : 'v16.0' // Use this Graph API version for this call.
			});

			FB.getLoginStatus(function(response) { // Called after the JS SDK has been initialized.
				statusChangeCallback(response); // Returns the login status.
			});
		};

		function loginAPI() { // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
			console.log('Welcome!  Fetching your information.... ');
			FB
					.api(
							'/me?fields=email,name,id,friends,birthday',
							function(response) {
								document.getElementById('status').innerHTML = 'Welcome , '
										+ response.name + '!';
								document.getElementById('logout').style.display="block";
								document.getElementById("login").style.display="none";
							});
		}
		function logoutAPI() { 
			console.log("logout api");
			FB.logout(function(response) {
				document.getElementById('status').innerHTML = 'Please Login to Continue !';
				document.getElementById('logout').style.display="none";
				document.getElementById("login").style.display="block";
				});
		}

		function commentAPI() { // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
			console.log('Welcome!  comment on post.... ');
			FB
					.api(
							'/me?fields=email,name,id,friends,birthday',
							function(response) {
								console.log("email:" + response.email)
								console.log("name:" + response.name)
								console.log("id:" + response.id)
								console.log("friends:" + response.friends)
								console.log("birthday:" + response.birthday)
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name + '!';
							});
		}
	</script>


	<!-- The JS SDK Login Button -->

	<nav class="navbar navbar-expand-lg bg-info">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<fb:login-button onlogin="checkLoginState()" id="login">
				</fb:login-button>
				<p id="info"></p>
				<button onclick="logoutAPI()" id="logout" class="h-2 w-2 fs-7 btn btn-primary">Logout</button>
			</div>
		</div>
	</nav>
	<div id="status"></div>

	<!-- Load the JS SDK asynchronously -->
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>