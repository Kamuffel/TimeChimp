console.log('tracker')

$(function(){
	let ctx = document.getElementById("myChart").getContext('2d');

	let options = {
		  type: 'line',
		  data: {
		    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
		    datasets: [
					{
						label: 'hours per month',
						backgroundColor: '#007bff',
						borderColor: '#007bff',
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
});

$('.page-item').click(function() {
	console.log($(this)[0].className);

	let classnames = $(this)[0].className;
	let regex = /l_p([1-9]{1,3})/
	let match = regex.exec(classnames);
	
	let page_num = match[1];
	if (page_num.length < 0 && page_num.length > 4) return;
	
	let statisctics_data_info = {};
	statisctics_data_info['page_num'] = page_num;


	sendAJAX('./lib/middleware/handle_statistics.php', 'POST', {statistics_data : statisctics_data_info}, 'json')
	.done(function(message) {

		$.each(message, function(key, value) {
			console.log('Bericht');
			console.log(message);

			switch(value['type'])
			{
				case 'simple':
					$('.' + value['field']).text(value['text']);
				break;
				case 'complex' :
				break;
				default:
					break;
			}
		});

		// set default color and remove loader
		$(this).css('background-color', '#BD2130');

	}).fail(function(jqXHR, textStatus) {
		console.log(jqXHR);
		console.log(textStatus);
	});
});