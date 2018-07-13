console.log('Insert loaded');

let insert_hours = function() {
	console.log('Insert hours');
	let insert_value = {};
	
	insert_value['start_time'] = $('.start_time').val();
	insert_value['stop_time'] = $('.stop_time').val();
	insert_value['break_time'] = $('.break_time').val();
	insert_value['activity_description'] = $('#activity_description').val();

	console.log(insert_value['activity_description']);
}

$('.insert_btn').click(function() {
	insert_hours();
});