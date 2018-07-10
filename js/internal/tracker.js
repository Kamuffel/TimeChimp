console.log('tracker');

let timerArray = [];

function startTimeTracker(clocktype) {
	if (typeof clocktype === 'undefined') return;

	let worktime = $('.' + clocktype).text().split(':');

	let seconds = Number(worktime[2]);
	let minutes = Number(worktime[1]);
	let hours   = Number(worktime[0]);

	if (seconds >= 0 && seconds < 59) {
		seconds += 1;
	}
	else {
		seconds = '00';
		if (minutes >= 0 && minutes < 59) {
			minutes += 1;
		}
		else {
			minutes = '00';
			if (hours >= 0 && hours < 23) {
				hours += 1;
			}
			else {
				hours = '00';
			}
		}
	}

	seconds = ((seconds.toString().length == 1) ? '0' + seconds : seconds);
	minutes = ((minutes.toString().length == 1) ? '0' + minutes : minutes);
	hours   = ((hours.toString().length == 1) ? '0' + hours : hours);

	$('.' + clocktype).text(hours + ':' + minutes + ':' + seconds);


	timerArray[clocktype] = setTimeout(function() {
							    startTimeTracker(clocktype);
						    }, 1000); 
}

$('.start-timer').click(function() {
	clearTimeout(timerArray['clock-break']);
	startTimeTracker('clock');

	$(this).addClass('disabled');
	$('.start-break-timer').removeClass('disabled');
});

$('.start-break-timer').click(function() {
	clearTimeout(timerArray['clock']);
	startTimeTracker('clock-break');

	$(this).addClass('disabled');
	$('.start-timer').removeClass('disabled');
});

$('.stop-timer').click(function() {
	clearTimeout(timerArray['clock']);
	clearTimeout(timerArray['clock-break']);

	$('.start-timer').removeClass('disabled');
	$('.start-break-timer').removeClass('disabled');

	$('.clock').text('00:00:00');
	$('.clock-break').text('00:00:00');
});