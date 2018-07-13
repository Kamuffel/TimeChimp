console.log('settings...')


$('.txt_hourly_wage').keyup(function() {
	$('.update-settings').addClass('disabled');
	
	let regex = new RegExp('^[0-9]{1,3}(?:\.?[0-9]{2})?$');

	if (regex.test($(this).val())) {
		$('.err_hourly_wage').html('<h3><i class="text-success fas fa-check"></i></h3>');
		$('.update-settings').removeClass('disabled');
	}
	else {
		$('.err_hourly_wage').html('<h3><i class="text-danger fas fa-times"></i></h3>');
	}

	if ($(this).val().length < 1) {
		console.log('len low')
		$('.err_hourly_wage').html('');
	}
});

$('.update-settings').click(function() {
	
	let profile_data_info = {};

	// retrieve profile info
	profile_data_info['txt_hourly_wage'] = $('.txt_hourly_wage').val();

	// fake loader
	$(this).css('background-color', 'gray');

	sendAJAX('./lib/middleware/handle_settings.php', 'POST', {profile_data : profile_data_info}, 'json')
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
		$(this).css('background-color', '#28A745');

	}).fail(function(jqXHR, textStatus) {
		console.log(jqXHR);
		console.log(textStatus);
	});
});