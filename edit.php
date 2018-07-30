<?php
session_start();
if (isset($_SESSION['allowed']))
{	
	if (!$_SESSION['allowed'])
		header('location: ./');
	if (!$_SESSION['editrecord'] && $_SESSION['editrecord'] <=0)
		header('location: ./');
}else{
	header('location: ./');
}

require_once('./lib/classes/class.statistics.php');
$statObj= new Statistics();
$recordData = $statObj->getRecord($_SESSION['editrecord']);
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TimeChimp (edit)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/external/fontawesome.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="edit">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (edit)</h2>
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
					<strong><?php echo $_SESSION['username']; ?>
				</div>
			</div>
			<hr>
			<div class="row my-2">
				<div class="col col-12 text-left">
					<span><a href="./tracker.php"><i class="fas fa-tachometer-alt"></i> tracker</a></span><br>
					<span><a class="text-info"><i class="fas fa-pencil-alt"></i> insert  <i class="fas fa-angle-left text-primary"></i></a></span><br>
					<span><a href="./statistics.php"><i class="fas fa-chart-bar"></i> statistics</a></span><br>
					<span><a href="./settings.php"><i class="fas fa-cog"></i> settings</a></span>
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
						<strong class="text-white">Edit record</strong>
					</div>
					<div class="card-body">
							<div class="form-group">
								<?php
									if (count($recordData) > 0) {
										foreach ($recordData as $key => $tracker_info) {
										echo'
											<label for="txt_start_time">Record ID</label> <span class="text-danger lbl_Record_ID"></span>
											<input type="text" size="8" value='.$tracker_info['T_ID'].' id="Record_ID" disabled ><br>
											<label for="txt_start_time">Start time</label> <span class="text-danger lbl_time_start"></span>
											<input type="time" value='.$tracker_info['Start_Time'].' id="start_time"><br>
											<label for="txt_stop_time">Stop time</label> <span class="text-danger lbl_time_stop"></span>
											<input type="time" value='.$tracker_info['Stop_Time'].' id="stop_time"><br>
											<label for="txt_break_time">Break time</label> <span class="text-danger lbl_time_break"></span>
											<input type="time" value='.$tracker_info['Break'].'  id="break_time"><br>
																	
											</div>
											<div class="form-group">
												<label for="txt_activity_description">Activity description</label>
												<textarea class="form-control" id="activity_description" rows="3">'.$tracker_info['Activity'].'</textarea>
											</div>
											';
										}
									}
								?>
							<a href="javascript:void(0);" class="btn btn-success w-100 update_btn">Update</a>
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