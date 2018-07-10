console.log('tracker')

var ctx = document.getElementById("myChart").getContext('2d');

var options = {
	  type: 'line',
	  data: {
	    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	    datasets: [
				{
					label: 'hours per month',
					backgroundColor: 'rgb(255, 99, 132)',
					borderColor: 'rgb(255, 99, 132)',
					data: [7, 11, 5, 8, 3, 7, 7, 11, 5, 8, 3, 7],
					borderWidth: 2,
					fill: false
				}
			]
	  },
	  options: {
	  	scales: {
	    	yAxes: [{
	        ticks: {
				reverse: false
	        }
	      }]
	    }
	  }
	};
	
new Chart(ctx, options);