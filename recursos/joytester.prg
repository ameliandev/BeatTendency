/**
 * Joystick test code. Displays the state of every joystick connected.
 */

Global
	int i,j;		// counters
	
	int joy_num;	// total number of joysticks present
	
	string name[9];	// names of the joysticks
	int numaxes[9];	// number of axes    on each joystick
	int numballs[9];	// number of balls   on each joystick
	int numbuttons[9];	// number of buttons on each joystick
	int numhats[9];	// number of hats    on each joystick
	
	int a[9][9];	// axis-values:   [joysticknr][axisnr]
	int t[9][9][1];	// ball-values:   [joysticknr][ballnr][0/1]	(0: X-value  1: Y-value)
	int b[9][29];	// button-values: [joysticknr][buttonnr]
	int h[9][9];	// hat-values:    [joysticknr][hatnr]

	int joy_yoffset[9]; // y-offset of each joystick relative to the top
End

Process Joytester()
Begin

	// Get number of joysticks
	joy_num = joy_numjoysticks();

	// Iterate over all joysticks
	for(i=0; i<joy_num; i++)

		// Get name and numbers
		name[i]       = joy_name(i);
		numaxes[i]    = joy_numaxes(i);
		numballs[i]   = joy_numballs(i);
		numbuttons[i] = joy_numbuttons(i);
		numhats[i]    = joy_numhats(i);
		say("Hat: " + itoa(numhats[i]));
		// Calculate the yoffset for displaying
		if(numbuttons[i]>10)
			joy_yoffset[i+1] = 70+(numbuttons[i]-9)/2*10;
		else
			joy_yoffset[i+1] = 70;
		end
		joy_yoffset[i+1] += joy_yoffset[i];

		// Build display
		//write( 0 , 20 , joy_yoffset[i]   , 0 , "Joystick"      );

		write( 0 , 20  , joy_yoffset[i]+40 , 0 , "Number:"     );
		write( 0 , 80 , joy_yoffset[i]+40 , 0 , i             );
	
		write( 0 , 20  , joy_yoffset[i]+50 , 0 , "Axes:"       );
		write( 0 , 80 , joy_yoffset[i]+50 , 0 , numaxes[i]    );
	
		write( 0 , 20  , joy_yoffset[i]+60 , 0 , "Buttons:"    );
		write( 0 , 80 , joy_yoffset[i]+60 , 0 , numbuttons[i] );
	
		write( 0 , 20  , joy_yoffset[i]+70 , 0 , "Hats:"       );
		write( 0 , 80 , joy_yoffset[i]+70 , 0 , numhats[i]    );
	
		write( 0 , 140 , joy_yoffset[i]+20 , 0 , "Axes"    );
		write( 0 , 240 , joy_yoffset[i]+20 , 0 , "Buttons" );
		write( 0 , 290 , joy_yoffset[i]+20 , 0 , "Hats"    );

		for( j=0 ; j<numaxes[i] ; j++ )
			write_int( 0 , 140 , 30+j*10+joy_yoffset[i] , 0 , &a[i][j] );
		end
		for( j=0 ; j<numbuttons[i] ; j++)
			write_int( 0 , 240+(j%2)*20 , 30+(j/2)*10+joy_yoffset[i] , 0 , &b[i][j] );
		end
		for( j=0 ; j<numhats[i] ; j++)
			say("Hats: " + itoa(numhats[i]));
			write_int( 0 , 290 , 30+j*10+joy_yoffset[i] , 0 , &h[i][j] );
		end

		// Found joystick
		say("FOUND JOYSTICK: " + name[i]);

	end
	
	// Update joystick state every frame until ESC or the X button is pressed
	Repeat

		for(i=0; i<joy_num; i++)
			for(j=0; j<numaxes[i]; j++)
				a[i][j] = joy_getaxis(i,j);
			end
			/*for(j=0; j<numballs[i]; j++)
				t[i][j] = joy_getball(i,j,&t[i][j][0],&t[i][j][1]);
			end*/
			for(j=0; j<numbuttons[i]; j++)
				b[i][j] = joy_getbutton(i,j);
			end
			for(j=0; j<numhats[i]; j++)
				h[i][j] = joy_gethat(i,j);
			end
		end

		frame;
	Until(key(_ESC)||exit_status)

End