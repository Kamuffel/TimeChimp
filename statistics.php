<?php
session_start();
if (isset($_SESSION['allowed']))
{
	if (!$_SESSION['allowed'])
		header('location: ./');
}

require_once('./lib/classes/class.user.php');

$userObj = new User();
$allTrackerInfo = $userObj->getAllTrackerInfo();
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TimeChimp (tool)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/external/fontawesome.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="statistics">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (statistics)</h2>
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
					<span><a class="text-info"><i class="fas fa-chart-bar"></i> statistics <i class="fas fa-angle-left text-primary"></i></a></span><br>
					<span><a href="./settings.php"><i class="fas fa-cog"></i> settings</a></span>
				</div>
			</div>
		</div>
	</aside>
	<div class="container">
		<div class="row my-2">
			<div class="col col-12">
				<h1>Statistics</h1>
			</div>
		</div>
		<div class="row my-1">
			<div class="col col-12">
				<canvas id="myChart" width="400" height="100"></canvas>
			</div>
			
		</div>
		<div class="row my-5">
			<div class="col col-12">
				<h1>History</h1>
				<div class="table-responsive">
					<table class="table text-center">
						<thead class="bg-primary text-white">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Start time</th>
								<th scope="col">End time</th>
								<th scope="col">Work time</th>
								<th scope="col">Break time</th>
								<th scope="col">Activity</th>
								<th scope="col">Date</th>
							</tr>
						</thead>
						<tbody>
							<?php
								if (count($allTrackerInfo) > 0) {
									foreach ($allTrackerInfo as $key => $tracker_info) {
										echo '<tr>
												<th scope="row">'. $tracker_info['T_ID'] .'</th>
												<td>'. $tracker_info['Start_Time'] .'</td>
												<td>'. $tracker_info['Stop_Time'] .'</td>
												<td>'. $tracker_info['Work'] .'</td>
												<td>'. $tracker_info['Break'] .'</td>
												<td>'. $tracker_info['Activity'] .'</td>
												<td>'. $tracker_info['Date'] .'</td>
											  </tr>';
									}
								}
							?>
						</tbody>
					</table>
				</div>
				<nav aria-label="Page navigation example text-center">
				  <ul class="pagination">
				    <li class="page-item l_prev">
				      <a class="page-link" href="javascript:void(0);" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <li class="page-item l_p1"><a class="page-link" href="javascript:void(0);">1</a></li>
				    <li class="page-item l_p2"><a class="page-link" href="javascript:void(0);">2</a></li>
				    <li class="page-item l_p3"><a class="page-link" href="javascript:void(0);">3</a></li>
				    <li class="page-item l_p4"><a class="page-link" href="javascript:void(0);">4</a></li>
				    <li class="page-item l_p5"><a class="page-link" href="javascript:void(0);">5</a></li>
				    <li class="page-item l_next">
				      <a class="page-link" href="javascript:void(0);" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</nav>
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