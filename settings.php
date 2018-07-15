<?php
session_start();
if (isset($_SESSION['allowed']))
{
	if (!$_SESSION['allowed'])
		header('location: ./');
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TimeChimp (settings)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/external/fontawesome.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="settings">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (settings)</h2>
			<a href="./logout.php" class="btn btn-danger float-right"><i class="fas fa-sign-out-alt"></i> logout</a>
		</a>
	</nav>
	<aside>
		<div class="container">
			<div class="row my-2">
				<div class="col col-12">
					<h2>Menu</h2>
				</div>
			</div>
			<div class="row my-2">
				<div class="col col-12">
					<i class="fas fa-user"></i> <strong><?php echo $_SESSION['username']; ?></strong>
				</div>
			</div>
			<hr>
			<div class="row my-2">
				<div class="col col-12 text-left">
					<span><a href="./tracker.php"><i class="fas fa-tachometer-alt"></i> tracker</a></span><br>
					<span><a href="./insert.php"><i class="fas fa-pencil-alt"></i> insert</a></span><br>
					<span><a href="./statistics.php"><i class="fas fa-chart-bar"></i> statistics</a></span><br>
					<span><a class="text-info"><i class="fas fa-cog"></i> settings <i class="fas fa-angle-left text-primary"></i></a></span>
				</div>
			</div>
		</div>
	</aside>
	<div class="container">
		<div class="row my-5">
			<div class="col col-12"></div>
		</div>
		<div class="row my-2">
			<div class="col col-12"><h1 class="text-center" style="color: #7E85E6;">Settings</h1></div>
		</div>
		<hr>
		<div class="row my-1">
			<div class="col col-12"></div>
		</div>
		<div class="row my-5 text-center">
			<div class="col col-3 text-right">
				<span><h4><i class="fas fa-dollar-sign"></i> Hourly wage</h4></span>
			</div>
			<div class="col col-8">
				<input type="text" class="form-control w-100 txt_hourly_wage" placeholder="Enter your hourly wage...">
			</div>
			<div class="col col-1">
				<span class="err_hourly_wage"></span>
			</div>
		</div>
		<div class="row my-5">
			<div class="col col-sm-12 col-md-12">
				<a href="javascript:void(0);" class="btn btn-success w-100 update-settings disabled">update <i class="fas fa-edit"></i></a>
			</div>
		</div>
	</div>
    <script src="./js/external/jquery_slim.js"></script>
    <script src="./js/external/popper.js"></script>
    <script src="./js/external/bootstrap_min.js"></script>
    <script src="./js/external/chart.js"></script>

    <script src="./js/script.js"></script>
  </body>
</html>