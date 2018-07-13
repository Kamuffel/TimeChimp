console.log('Insert loaded');

let insert_hours = function() {
	console.log('Insert hours');
	let insert_value = {};
	
	insert_value['start_time'] = document.getElementById("start_time").value;
	insert_value['stop_time'] = document.getElementById("stop_time").value;
	insert_value['break_time'] = document.getElementById("break_time").value;
	insert_value['activity_description'] = document.getElementById("activity_description").value;

	console.log(insert_value);
}

$('.insert_btn').click(function() {
	insert_hours();
});