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

Process jTest2()
Private
	int txt = 0;
End
Begin

	
		
		write_int(0,100,100,0,&scan_code);
Loop

		//txt = write(0,100,300,0, "ESPERANDO...");
		
		/*If(joy_getbutton(0, _BACKSPACE))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _BACKSPACE");
		End
		If(joy_getbutton(0,_S))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _S");
		End
		If(joy_getbutton(0,_D))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _D");
		End
		If(joy_getbutton(0,_A))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _A");
		End
		If(joy_getbutton(0,_W))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _W");
		End
		If(joy_getbutton(0,_LEFT))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _LEFT");
		End
		If(joy_getbutton(0,_RIGHT))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _RIGHT");
		End
		If(joy_getbutton(0,_UP))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _UP");
		End
		If(joy_getbutton(0,_DOWN))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _DOWN");
		End
		If(joy_getbutton(0,_ESC))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _ESC");
		End
		If(joy_getbutton(0,_SPACE))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Tecla _SPACE");
		End*/
		
		frame;
	
	End
	
End

Process JoyTest()
Private
	int joyID, joiSL, joyBtns, joyGB;
	string thevar;
	int arraysize, txt1, txt2;
End
Begin
	
	txt1 = write(0,640/2,480/2,1, "Dreamcast Controller Test by KeiDash");
	
	frame;
	
	FROM i=1 TO 3 STEP 1;
	
		if(txt2 != 0) delete_text(txt2); End
		
		for(x=0;x<20;x++)
			frame;
		end
		
		txt2 = write(0,640/2,480/2 + 20,1, "Please wait...");
		
		for(x=0;x<20;x++)
			frame;
		end
		
		frame;
	END
	
	if(txt1 != 0) delete_text(txt1); End
	if(txt2 != 0) delete_text(txt2); End
	
	write(0,5,5,0, "DREAMCAST JoyTest:");
	write(0,5,10,0, "---------------------------------------");
	
	//Obtenemos el número de Pads conectados
	joy_num = joy_numjoysticks();
	
	//Si no se encuentra ningún joy conectado, salimos.
	If(joy_num <= 0) write(0, 640/2, 480/2, 4, "Este sistema no dispone de joys conectados"); return; End
	
	write(0, 55, 30, 2, "N. Pads:"); 
	write_var(0, 65, 30, 0, joy_num);
	
	For(i=0; i<joy_num; i++)
		
		name[i]       = joy_name(i);
		numaxes[i]    = joy_numaxes(i);
		numballs[i]   = joy_numballs(i);
		numbuttons[i] = joy_numbuttons(i);
		numhats[i]    = joy_numhats(i);
		
		//name[i]       = "Dreamcast Joy " + (i+1); //joy_name(i);
		//numaxes[i]    = 4; //joy_numaxes(i);
		//numballs[i]   = 0; //joy_numballs(i);
		//numbuttons[i] = 7; //joy_numbuttons(i);
		//numhats[i]    = 0; //joy_numhats(i);
		
		//say("Procesando Joy " + i);
		
		if(i==0)
			write(0, 100, 60, 2, "Name:");
			write_var(0, 52, 60, 0, name[i]);
			write(0, 50, 70, 0, "------------------------");
			write(0, 100, 80, 2, "Axis:");
			write_var(0, 105, 80, 0, numaxes[i]);
			//
			write(0, 100, 90, 2, "Balls:");
			write_var(0, 105, 90, 0, numballs[i]);
			//
			write(0, 100, 100, 2, "Buttons:");
			write_var(0, 105, 100, 0, numbuttons[i]);
			//
			write(0, 100, 110, 2, "Hats:");
			write_var(0, 105, 110, 0, numhats[i]);
			
		end
		if(i==1)
			write(0, 400, 60, 2, "Name:");
			write_var(0, 352, 60, 0, name[i]);
			write(0, 350, 70, 0, "------------------------");
			write(0, 400, 80, 2, "Axis:");
			write_var(0, 405, 80, 0, numaxes[i]);
			//
			write(0, 400, 90, 2, "Balls:");
			write_var(0, 405, 90, 0, numballs[i]);
			//
			write(0, 400, 100, 2, "Buttons:");
			write_var(0, 405, 100, 0, numbuttons[i]);
			//
			write(0, 400, 110, 2, "Hats:");
			write_var(0, 405, 110, 0, numhats[i]);

		end
		if(i==2)
			write(0, 100, 250, 2, "Name:");
			write_var(0, 105, 250, 0, name[i]);
			write(0, 52, 260, 0, "------------------------");
			write(0, 100, 270, 2, "Axis:");
			write_var(0, 105, 270, 0, numaxes[i]);
			//
			write(0, 100, 280, 2, "Balls:");
			write_var(0, 105, 280, 0, numballs[i]);
			//
			write(0, 100, 290, 2, "Buttons:");
			write_var(0, 105, 290, 0, numbuttons[i]);
			//
			write(0, 100, 300, 2, "Hats:");
			write_var(0, 105, 300, 0, numhats[i]);
		end
		if(i==3)
			write(0, 400, 250, 2, "Name:");
			write_var(0, 352, 250, 0, name[i]);
			write(0, 350, 260, 0, "------------------------");
			write(0, 400, 270, 2, "Axis:");
			write_var(0, 405, 270, 0, numaxes[i]);
			//
			write(0, 400, 280, 2, "Balls:");
			write_var(0, 405, 280, 0, numballs[i]);
			//
			write(0, 400, 290, 2, "Buttons:");
			write_var(0, 405, 290, 0, numbuttons[i]);
			//
			write(0, 400, 300, 2, "Hats:");
			write_var(0, 405, 300, 0, numhats[i]);
		end
		
		If(i == 0)
			write(0, 90, 125, 0, "Joy " + itoa(i + 1) + " a la escucha");
		End
		If(i == 1)
			write(0, 390, 125, 0, "Joy " + itoa(i + 1) + " a la escucha");
		End
		If(i == 2)
			write(0, 90, 325, 0, "Joy " + itoa(i + 1) + " a la escucha");
		End
		If(i == 3)
			write(0, 390, 325, 0, "Joy " + itoa(i + 1) + " a la escucha");
		End
		
		frame;
		
	End
	
	For(i=0;i<joy_num;i++)
		ButtonClick(i);
		frame;
	End
	
	Loop
		frame;
	End

End

Process ButtonClick(int joyID)
Private
	int strJoy1 = 0;
	int strJoy2 = 0;
	int strJoy3 = 0;
	int strJoy4 = 0;
	int txt;
	int axis = 0;
	int axisV = 0;
End
Begin
	loop
		if(joy_getbutton(joyID, 0))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 0");
			say("This button is assigned to button 0");
		end
		if(joy_getbutton(joyID, 1))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 1");
			say("This button is assigned to button 1");
		end
		if(joy_getbutton(joyID, 2))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 2");
			say("This button is assigned to button 2");
		end
		if(joy_getbutton(joyID, 3))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 3");
			say("This button is assigned to button 3");
		end
		if(joy_getbutton(joyID, 4))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 4");
			say("This button is assigned to button 4");
		end
		if(joy_getbutton(joyID, 5))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 5");
			say("This button is assigned to button 5");
		end
		if(joy_getbutton(joyID,6))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 6");
			say("This button is assigned to button 6");
		end
		if(joy_getbutton(joyID,7))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 7");
			say("This button is assigned to button 7");
		end
		if(joy_getbutton(joyID, 8))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 8");
			say("This button is assigned to button 8");
		end
		if(joy_getbutton(joyID, 9))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 9");
			say("This button is assigned to button 9");
		end
		if(joy_getbutton(joyID,10))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 10");
			say("This button is assigned to button 10");
		end
		if(joy_getbutton(joyID,11))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 11");
			say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,12))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 12");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,13))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 13");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,14))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 14");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,15))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 15");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,16))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 16");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,17))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 17");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,18))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 18");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,19))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 19");
			//say("This button is assigned to button 11");
		end
		if(joy_getbutton(joyID,20))
			if(txt != 0) delete_text(txt); End
			txt = write(0,100,300,0, "Boto asociado a 20");
			//say("This button is assigned to button 11");
		end
		
		//EJES:
		
		/*DIRECCIONES*/
		if(joy_getaxis(joyID,0) < -300);
			if(axis != 0) delete_text(axis); End
			axis = write(0,100,220,0, "Eje Horizontal a la IZQ:" + itoa(joy_getaxis(joyID,0)));
			say("axis is going izquierda");
		elseif(joy_getaxis(joyID,0) > 6);
			if(axis != 0) delete_text(axis); End
			axis = write(0,100,220,0, "Eje Horizontal a la DER:" + itoa(joy_getaxis(joyID,0)));
			say("axis is going derecha");
		elseif(joy_getaxis(joyID,1) > 6);
			if(axisV != 0) delete_text(axisV); End
			axisV = write(0,100,220,0, "Eje Vertical ABAJO:" + itoa(joy_getaxis(joyID,1)));
		elseif(joy_getaxis(joyID,1) < -300);
			if(axisV != 0) delete_text(axisV); End
			axisV = write(0,100,220,0, "Eje Vertical ARRIBA:" + itoa(joy_getaxis(joyID,1)));
		else
			if(axis != 0) delete_text(axis); End
			if(axisV != 0) delete_text(axisV); End
			axis = write(0,100,260,0, "EJE HORIZONTAL: " + itoa(joy_getaxis(joyID,0))); //Axis Arriba
			axisV = write(0,100,280,0, "EJE VERTICAL: " + itoa(joy_getaxis(joyID,1))); //Axis Arriba
		end
		/*FIN DIRECCIONES*/
		
		//ANALÓGICOS
		if(joy_getaxis(joyID,2)<-300);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje arriba B");
			say("Pad:" + joyID + ",Analg Id:2, <");
		end
		if(joy_getaxis(joyID,2)>6);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje abajo B");
			say("Pad:" + joyID + ",Analg Id:2, >");
		end
		if(joy_getaxis(joyID,3)>6);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje abajo C");
			say("Pad:" + joyID + ",Analg Id:3, >");
		end
		if(joy_getaxis(joyID,3)<-300);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje arriba C");
			say("Pad:" + joyID + ",Analg Id:3, <");
		end
		if(joy_getaxis(joyID,4)<-300);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje a la izquierda B");
			say("Pad:" + joyID + ",Analg Id:4, <");
		end
		if(joy_getaxis(joyID,4)>6);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje a la derecha B");
			say("Pad:" + joyID + ",Analg Id:4, >");
		end
		
		if(joy_getaxis(joyID,5)<-300);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje a la izquierda B");
			say("Pad:" + joyID + ",Analg Id:5, <");
		end
		if(joy_getaxis(joyID,5)>6);
			if(axis != 0) delete_text(axis); End
			//axis = write(0,100,200,0, "Eje a la derecha B");
			say("Pad:" + joyID + ",Analg Id:5, >");
		end
		//FIN ANALÓGICOS
		frame;
	End
End