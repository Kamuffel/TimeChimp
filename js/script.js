$(document).ready(function() {
	console.log('loaded...');
	let importJS = function(js_files) {
		if (js_files.length < 1);

		const root_js_folder = './js/';
		
		$.each(js_files, function() {
			let script = document.createElement("script");

			script.type = "text/javascript";
			script.src = root_js_folder + this + '.js';

			document.body.appendChild(script);
		});
	};

	switch($('body').attr('id'))
	{
		case 'home':
			importJS(['internal/ajax', 'internal/home']);
		break;
		case 'tool':
			importJS(['internal/ajax', 'internal/tool']);
		break;
	}
});