<?php
session_start();
if (isset($_SESSION['allowed']))
{
	if ($_SESSION['allowed'])
		header('location: ./tracker.php');
}
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TimeChimp</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="home">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp</h2>
		</a>
	</nav>
	<div class="container">
		<div class="row my-5">
			<div class="col col-2">
			</div>
			<div class="col col-8">
				<div class="view-login">
					<div class="card">
						<div class="card-header text-center bg-primary">
							<strong class="text-white">TimeChimp login</strong>
						</div>
						<div class="card-body">
								<div class="form-group">
									<label for="txt_username">Username</label> <span class="text-danger lbl_login_username"></span>
									<input type="text" class="form-control txt_login_username" id="txt_username" placeholder="Enter your username...">
								</div>
								<div class="form-group">
									<label for="txt_password">Password</label> <span class="text-danger lbl_login_password"></span>
									<input type="password" class="form-control txt_login_password" id="txt_password" placeholder="Enter your password...">
								</div>
								<a href="javascript:void(0);" class="btn btn-success w-100 user_login_btn">login</a>
						</div>
						<span class="text-danger text-center generic_error"></span>
						<hr>
						<span class="text-center">
							<small><a href="javascript:void(0);" class="change_form">register</a></small> <strong>/</strong> <small><a href="javascript:void(0);">recover your password</a></small>
						</span>
					</div>
				</div>
				<div class="view-register d-none">
					<div class="card">
						<div class="card-header text-center bg-primary">
							<strong class="text-white">TimeChimp register</strong>
						</div>
						<div class="card-body">
							<div class="form-group">
									<label for="txt_register_email">E-mail</label> <span class="text-danger lbl_register_email"></span>
									<input type="text" class="form-control txt_register_email" id="txt_register_email" placeholder="Enter your e-mail...">
								</div>
								<div class="form-group">
									<label for="txt_register_username">Username</label> <span class="text-danger lbl_register_username"></span>
									<input type="text" class="form-control txt_register_username" id="txt_register_username" placeholder="Enter your username...">
								</div>
								<div class="form-group">
									<label for="txt_register_password">Password</label> <span class="text-danger lbl_register_password"></span>
									<input type="password" class="form-control txt_register_password" id="txt_register_password" placeholder="Enter your password...">
								</div>
								<a href="javascript:void(0);" class="btn btn-success w-100 user_register_btn">register</a>
						</div>
						<span class="text-danger text-center generic_error"></span>
						<hr>
						<span class="text-center">
							<small><a href="javascript:void(0);" class="change_form">login</a></small> <strong>/</strong> <small><a href="javascript:void(0);">recover your password</a></small>
						</span>
					</div>
				</div>
			</div>
			<div class="col col-2"></div>
		</div>
	</div>
    <script src="./js/external/jquery_slim.js"></script>
    <script src="./js/external/popper.js"></script>
    <script src="./js/external/bootstrap_min.js"></script>

    <script src="./js/script.js"></script>
  </body>
</html>