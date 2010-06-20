// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function setWorkoutLength(operation){
	var step = 15;
	var max = 4*8*step;
	var length = $('#workout_workout_length');
	var currentVal = parseInt(length.val());
	var newVal = operation == '-' ? 
		currentVal > step ? currentVal - step : currentVal
	: currentVal < max ? currentVal + step : currentVal;
	length.val(newVal);
	
	$('#cw-length-label > span').text(newVal);
	var msg = '';
	if (newVal >= 120) {
			msg = 'Really!?';
	} else if (newVal >= 90){
			msg = 'Wow!';
	} else if (newVal >= 60){
			msg = 'Nice!';
	}
	$('#cw-length-msg').text(msg);
}