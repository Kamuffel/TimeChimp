console.log('home loaded...')

let clearFields = function() {
	$('.lbl_login_username').text('');
	$('.lbl_login_password').text('');
	$('.lbl_register_username').text('');
	$('.lbl_register_password').text('');
	$('.lbl_register_email').text('');
	$('.generic_error').text('');
};

let login = function() {
	let user_login_info = {};

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

let register = function() {

	let user_register_info = {};

	// retrieve user credentials
	user_register_info['txt_register_email'] = $('.txt_register_email').val();
	user_register_info['txt_register_username'] = $('.txt_register_username').val();
	user_register_info['txt_register_password'] = $('.txt_register_password').val();

	// fake loader
	$('.user_register_btn').css('background-color', 'gray');

	sendAJAX('./lib/middleware/handle_entry.php', 'POST', {user_register_data : user_register_info}, 'json')
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
		$('.user_register_btn').css('background-color', '#28A745');

	}).fail(function(jqXHR, textStatus) {
		console.log(jqXHR);
		console.log(textStatus);
	});
};

let toggleWatcher = 0;

$('.change_form').click(function(){ 
	if (!toggleWatcher)
	{
		$('.view-login').addClass('d-none');
		$('.view-register').removeClass('d-none');
	}
	else {
		$('.view-register').addClass('d-none');
		$('.view-login').removeClass('d-none');
	}
	toggleWatcher = !toggleWatcher;
});

$('.user_register_btn').click(function() {
	register();
});

$('.txt_register_username, .txt_register_password, .txt_register_email').keydown(function(e){
    if(e.keyCode == 13)
    	register();
});

$('.user_login_btn').click(function() {
	login();
});

$('.txt_login_username, .txt_login_password').keydown(function(e){
    if(e.keyCode == 13)
    	login();
});