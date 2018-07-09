<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TimeChimp (tool)</title>
	
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower|Raleway" rel="stylesheet">

    <link rel="stylesheet" href="./css/external/btstrp.css">
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body id="tool">
    <nav class="navbar navbar-light border border-bottom-5">
		<a class="navbar-brand" href="javascript:void(0)">
			<img src="./css/images/gorilla.svg" width="64" class="d-inline-block align-top float-left" alt="logo">
			<h2 class="float-left mt-3 ml-2 text-primary stroke-style">TimeChimp (tool)</h2>
		</a>
	</nav>
	<div class="container">
		<div class="row my-2">
			<h1>Statistics</h1>
		</div>
		<div class="row my-1">
			<div class="col col-12">
				<canvas id="myChart" width="400" height="100"></canvas>
			</div>
			
		</div>
		<div class="row my-5">
			<div class="col col-12">
				<h1>History</h1>
				<table class="table text-center">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Start time</th>
							<th scope="col">End time</th>
							<th scope="col">Total</th>
							<th scope="col">Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">3</th>
							<td>12:00</td>
							<td>12:30</td>
							<td>00:30</td>
							<td>08-07-2018</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>13:00</td>
							<td>13:30</td>
							<td>00:30</td>
							<td>07-07-2018</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>14:00</td>
							<td>17:30</td>
							<td>03:30</td>
							<td>06-07-2018</td>
						</tr>
					</tbody>
				</table>
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