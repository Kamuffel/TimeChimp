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

function removeRecord($id){
	console.log('removebtn:' + $id);
};
function editRecord($id){
	console.log('editbtn:' + $id);
};

$(document).on('click', '.page-item', function() {
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
					if(typeof value['name'] !== 'undefined')
					{
						let dataRows = '';
						$('.view-data-tracker').empty();
						$('.pagination').html(dataRows);
						for (let i = 0; i < value['data']['page_data'].length; i++) {
							dataRows += '<tr>'+
												'<th scope="row">'+ value['data']['page_data'][i]['T_ID'] +'</th>' +
												'<td>'+ value['data']['page_data'][i]['Start_Time'] +'</td>' +
												'<td>'+ value['data']['page_data'][i]['Stop_Time'] +'</td>' +
												'<td>'+ value['data']['page_data'][i]['Work'] +'</td>' +
												'<td>'+ value['data']['page_data'][i]['Break'] +'</td>' +
												'<td>'+ value['data']['page_data'][i]['Activity'] +'</td>' +
												'<td>'+ value['data']['page_data'][i]['Date'] +'</td>' +

												'<td>'+ "<a href='javascript:removeRecord("+ value['data']['page_data'][i]['T_ID'] +")' class='btn fas fa-times remove_btn' style='color:red'></a>" +'</td>' +
											  '</tr>';
						}

						$('.view-data-tracker').html(dataRows);

						let pagination = '<li class="page-item l_p' + ((value['data']['current_page'] == 0) ? value['data']['current_page'] + ' disabled' : (value['data']['current_page'] - 1)) +'">' +
									      '<a class="page-link" href="javascript:void(0);" aria-label="Previous">' +
									        '<span aria-hidden="true">«</span>' +
									        '<span class="sr-only">Previous</span>' +
									      '</a>' +
									    '</li>';

						for (let i = 1; i <= value['data']['total_pages']; i++) {
							let active = ((value['data']['current_page'] == i) ? 'active' : '');
							pagination += '<li class="page-item l_p'+i+' '+ active +'"><a class="page-link" href="javascript:void(0);">'+i+'</a></li>';
						}

					    pagination += '<li class="page-item l_p'+ ((value['data']['current_page'] == value['data']['total_pages']) ? value['data']['current_page'] + ' disabled' : (+value['data']['current_page'] + +1)) +'">' +
									      '<a class="page-link" href="javascript:void(0);" aria-label="Next">'+
									        '<span aria-hidden="true">»</span>'+
									        '<span class="sr-only">Next</span>'+
									      '</a>'+
									    '</li>';

						$('.pagination').html(pagination);
					}
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