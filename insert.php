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
    <title>TimeChimp (insert)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/external/fontawesome.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="insert">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (insert)</h2>
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
					<span><a href="./tracker.php">tracker</a></span><br>
					<span><a class="text-info">insert <i class="fas fa-angle-left text-primary"></i></a></span><br>
					<span><a href="./statistics.php">statistics</a></span><br>
					<span><a href="./settings.php">settings</a></span>
				</div>
			</div>
		</div>
	</aside>
	<div class="container">
		<div class="row my-5">
			<div class="col col-2">
			</div>
			<div class="col col-8">
				<div class="card">
					<div class="card-header text-center bg-primary">
						<strong class="text-white">Insert worked hours</strong>
					</div>
					<div class="card-body">
							<div class="form-group">
								<label for="txt_start_time">Start time</label> <span class="text-danger lbl_time_start"></span>
								<input type="time" name="start_time"><br>
								<label for="txt_stop_time">Stop time</label> <span class="text-danger lbl_time_stop"></span>
								<input type="time" name="stop_time"><br>
								<label for="txt_break_time">Start time</label> <span class="text-danger lbl_time_break"></span>
								<input type="time" name="break_time"><br>								
							</div>
							<div class="form-group">
								<label for="txt_activity_description">Activity description</label>
								<textarea class="form-control" id="activity_description" rows="3"></textarea>
							</div>
							
							<a href="javascript:void(0);" class="btn btn-success w-100 insert_btn">insert</a>
					</div>
					<span class="text-danger text-center generic_error"></span>
				</div>
			</div>
			<div class="col col-2"></div>
		</div>
	</div>
    <script src="./js/external/jquery_slim.js"></script>
    <script src="./js/external/popper.js"></script>
    <script src="./js/external/bootstrap_min.js"></script>
    <script src="./js/external/chart.js"></script>

    <script src="./js/script.js"></script>
  </body>
</html>