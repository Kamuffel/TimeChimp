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
    <title>TimeChimp (tracker)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/external/fontawesome.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="tracker">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (tracker)</h2>
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
					<strong><?php echo $_SESSION['username']; ?></strong>
				</div>
			</div>
			<hr>
			<div class="row my-2">
				<div class="col col-12 text-left">
					<span><a class="text-info"><i class="fas fa-tachometer-alt"></i> tracker <i class="fas fa-angle-left text-primary"></i></a></span><br>
					<span><a href="./insert.php"><i class="fas fa-pencil-alt"></i> insert</a></span><br>
					<span><a href="./statistics.php"><i class="fas fa-chart-bar"></i> statistics</a></span><br>
					<span><a href="./settings.php"><i class="fas fa-cog"></i> settings</a></span>
				</div>
			</div>
		</div>
	</aside>
	<div class="container">
		<div class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Notice</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>An activity description is required.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">OK!</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row my-5">
			<div class="col col-12"></div>
		</div>
		<div class="row my-2">
			<div class="col col-12"><h1 class="text-center" style="color: #7E85E6;">Tracker</h1></div>
		</div>
		<hr>
		<div class="row my-1">
			<div class="col col-12">
				<div class="row my-1">
			<div class="col col-12">
				<h3 class="text-center text-secondary"><i class="fas fa-pencil-alt"></i> Describe your task</h3>
				<input type="text" class="form-control activity-description" placeholder="Describe your task..." />
			</div>
		</div>
			</div>
		</div>
		<div class="row my-5">
			<div class="col col-12 text-center">
				<h1 class="text-success"><i class="fas fa-briefcase"></i> <span class="clock">00:00:00</span></h1>
				<h3 class="text-info"><i class="fas fa-coffee"></i> <span class="clock-break">00:00:00</span></h3>
			</div>
		</div>
		<div class="row my-5">
			<div class="col col-sm-12 col-md-4 mb-2">
				<a href="javascript:void(0);" class="btn btn-success w-100 start-timer"><i class="fas fa-briefcase"></i></a>
			</div>
			<div class="col col-sm-12 col-md-4 mb-2">
				<a href="javascript:void(0);" class="btn btn-info w-100 start-break-timer"><i class="fas fa-coffee"></i></a>
			</div>
			<div class="col col-sm-12 col-md-4 mb-2">
				<a href="javascript:void(0);" class="btn btn-danger w-100 stop-timer"><i class="fas fa-stop"></i></a>
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