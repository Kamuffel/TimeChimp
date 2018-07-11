console.log('home loaded...')

let clearFields = function() {
	$('.lbl_login_username').text('');
	$('.lbl_login_password').text('');
	$('.generic_error').text('');
};

let login = function() {
	let user_login_info = {};

	// retieve form type
	user_login_info['form_type'] = 'student';

	// retrieve user credentials
	user_login_info['txt_login_username'] = $('.txt_login_username').val();
	user_login_info['txt_login_password'] = $('.txt_login_password').val();

	// fake loader
	$('.user_login_btn').css('background-color', 'gray');

	sendAJAX('./lib/middleware/handle_entry.php', 'POST', {user_login_data : user_login_info}, 'json')
	.done(function(message) {

		clearFields();

		$.each(message, function(key, value) {
			console.log(message);

			switch(value['type'])
			{
				case 'simple':
					$('.' + value['field']).text(value['text']);
				break;
				case 'complex' :
					if(typeof value['name'] !== "undefined") {
						if (value['name'] == 'user_redirect')
							window.location.replace(value['action']);
					}
				break;
				default:
					break;
			}
		});

		// set default color and remove loader
		$('.user_login_btn').css('background-color', '#28A745');

	}).fail(function(jqXHR, textStatus) {
		console.log(jqXHR);
		console.log(textStatus);
	});
};

$('.user_login_btn').click(function() {
	login();
});

$('.txt_login_username, .txt_login_password').keydown(function(e){
    if(e.keyCode == 13)
    	login();
});