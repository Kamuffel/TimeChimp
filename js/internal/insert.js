console.log('Insert loaded');

$('.insert_btn').click(function() {

	let insert_data_info= {};
  
	insert_data_info['start_time']			 = $('#start_time').val() + ':00';
	insert_data_info['stop_time'] 			 = $('#stop_time').val() + ':00';
	insert_data_info['break_time']           = $('#break_time').val() + ':00';
	insert_data_info['activity_description'] = $('#activity_description').val();

	console.log(insert_data_info);
	
	// fake loader
	$(this).css('background-color', 'gray');

	sendAJAX('./lib/middleware/handle_tracker.php', 'POST', {insert_data : insert_data_info}, 'json')
	.done(function(message) {

		$.each(message, function(key, value) {
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