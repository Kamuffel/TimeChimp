console.log('AJAX script loaded...');

var sendAJAX = function(location, method, sendData, dataType) {
	return $.ajax({
		url:  location,
		type: method,
		data: sendData,
		dataType: dataType
	});
};