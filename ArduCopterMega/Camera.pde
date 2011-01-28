void init_camera()
{
	rc_camera_pitch.set_angle(4500);
	rc_camera_pitch.radio_min 	= rc_6.radio_min;
	rc_camera_pitch.radio_trim 	= rc_6.radio_trim;
	rc_camera_pitch.radio_max 	= rc_6.radio_max;
	
	rc_camera_roll.set_angle(4500);
	rc_camera_roll.radio_min 	= 1000;
	rc_camera_roll.radio_trim 	= 1500;
	rc_camera_roll.radio_max 	= 2000;
}

void
camera_stabilization()
{
	rc_camera_pitch.set_pwm(APM_RC.InputCh(CH_6)); // I'm using CH 6 input here.

	// allow control mixing
	rc_camera_pitch.servo_out = rc_camera_pitch.control_mix(dcm.pitch_sensor / 2);

	// dont allow control mixing
	//rc_camera_pitch.servo_out = dcm.pitch_sensor / 2;

	rc_camera_pitch.calc_pwm();
	APM_RC.OutputCh(CH_5, rc_camera_pitch.radio_out);


	rc_camera_roll.servo_out = dcm.roll_sensor * 1;
	rc_camera_roll.calc_pwm();
	APM_RC.OutputCh(CH_6, rc_camera_roll.radio_out);


	//If you want to do control mixing use this function.
	// set servo_out to the control input from radio
	//rc_camera_roll 	= rc_2.control_mix(dcm.pitch_sensor);
	//rc_camera_roll.calc_pwm();		
}

