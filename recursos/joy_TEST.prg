Loop		
		txt1 = joy_gethat(0,0);
		txt2 = joy_getaxis(0,0);
		txt3 = joy_getaxis(0,1);
		btn0 = joy_getbutton(0,1);
		btn1 = joy_getbutton(0,2);
		btn2 = joy_getbutton(0,3);
		btn3 = joy_getbutton(0,4);
		btn4 = joy_getbutton(0,5);
		btn5 = joy_getbutton(0,6);
		btn6 = joy_getbutton(0,7);
		btn7 = joy_getbutton(0,8);
		btn8 = joy_getbutton(0,8);
		btn9 = joy_getbutton(0,8);
		btn10 = joy_getbutton(0,8);
		btn11 = joy_getbutton(0,8);
		btn12 = joy_getbutton(0,8);
		btn13 = joy_getbutton(0,8);
		
		
		write_var(0, 640/2, 480/2, 0, txt1);
		write(0, 640/2 + 10, 480/2 + 20, 0, "H");
		write_var(0, 640/2 + 20, 480/2 + 20, 0, txt2);
		write(0, 640/2 + 10, 480/2 + 40, 0, "V");
		write_var(0, 640/2 + 20, 480/2 + 40, 0, txt3);
		
		//write(0, 640/2 + 10, 480/2 + 50, 0, "BTN");
		//write_var(0, 640/2 + 30, 480/2 + 60, 0, btn0); //B
		//write_var(0, 640/2 + 30, 480/2 + 70, 0, btn1); //A
		//write_var(0, 640/2 + 30, 480/2 + 80, 0, btn2); //START
		//write_var(0, 640/2 + 30, 480/2 + 110, 0, btn5); //Y
		//write_var(0, 640/2 + 30, 480/2 + 120, 0, btn6); //X
		
		If(key(_SPACE))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				say("entra");
				txt = write(0, 10, 10, 0, "L");
			End
		ElseIf(key(_ESC))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				say("entra");
				txt = write(0, 10, 10, 0, "R");
			End
		Else
			preventKey = false;
		End
		
		frame;
	End
	
	Loop
		If(joy_gethat(0, 0) == JOY_HAT_CENTERED)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "CENTER");
		Elseif(joy_gethat(0, 0) == JOY_HAT_UP)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "UP");
		Elseif(joy_gethat(0, 0) == JOY_HAT_DOWN)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "DOWN");
		Elseif(joy_gethat(0, 0) == JOY_HAT_LEFT)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "LEFT");
		Elseif(joy_gethat(0, 0) == JOY_HAT_RIGHT)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "RIGHT");
		Elseif(joy_gethat(0, 0) == JOY_HAT_LEFTUP)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "UP-LEFT");
		Elseif(joy_gethat(0, 0) == JOY_HAT_LEFTDOWN)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "DOWN-LEFT");
		Elseif(joy_gethat(0, 0) == JOY_HAT_RIGHTUP)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "UP-RIGHT");
		Elseif(joy_gethat(0, 0) == JOY_HAT_RIGHTDOWN)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "DOWN-RIGHT");
		Else
			If(txt != 0) DELETE_TEXT(txt); End
			val = joy_gethat(0, 0);
			txt = write(0, 640/2, 480/2 + 20, 0, itoa(val));
		End
		
		If(joy_getaxis(0,0) < -320)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "ANAG. IZQUIERDA");
		Elseif(joy_getaxis(0,0) > 10000)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "ANAG. DERECHA");
		Elseif(joy_getaxis(0,1) > 10000)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "ANAG. ABAJO");
		Elseif(joy_getaxis(0,1) < -320)
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "ANAG. ARRIBA");
		Else
		End
		
		If(joy_getbutton(0,0))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 0");
		ElseIf(joy_getbutton(0,1))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 1");
		ElseIf(joy_getbutton(0,2))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 2");
		ElseIf(joy_getbutton(0,3))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 3");
		ElseIf(joy_getbutton(0,4))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 4");
		ElseIf(joy_getbutton(0,5))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 5");
		ElseIf(joy_getbutton(0,6))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 6");
		ElseIf(joy_getbutton(0,7))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 7");
		ElseIf(joy_getbutton(0,8))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 8");
		ElseIf(joy_getbutton(0,9))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 9");
		ElseIf(joy_getbutton(0,10))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 10");
		ElseIf(joy_getbutton(0,11))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 11");
		ElseIf(joy_getbutton(0,12))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 12");
		ElseIf(joy_getbutton(0,13))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 13");
		ElseIf(joy_getbutton(0,14))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 14");
		ElseIf(joy_getbutton(0,15))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 15");
		ElseIf(joy_getbutton(0,16))
			If(txt != 0) DELETE_TEXT(txt); End
			txt = write(0, 640/2, 480/2, 0, "BTN 16");
		End
		
		/*If(key(_left))
			say(".....");
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "IZQUIERDA");
			End
		ElseIf(key(_right))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "DERECHA");
			End
		ElseIf(key(_up))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "ARRIBA");
			End
		ElseIf(key(_down))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "ABAJO");
			End
		ElseIf(key(_s))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "A");
			End
		ElseIf(key(_d))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "B");
			End
		ElseIf(key(_a))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "X");
			End
		ElseIf(key(_w))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "Z");
			End
		ElseIf(key(_SPACE))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "L");
			End
		ElseIf(key(_ESC))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "R");
			End
		ElseIf(key(_ENTER))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "START");
			End
		Else
			preventKey = false;
		End*/
		
		
		frame;
	End
	
	/*
	Loop
		If(key(_left))
			say(".....");
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "IZQUIERDA");
			End
		ElseIf(key(_right))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "DERECHA");
			End
		ElseIf(key(_up))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "ARRIBA");
			End
		ElseIf(key(_down))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "ABAJO");
			End
		ElseIf(key(_s))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "A");
			End
		ElseIf(key(_d))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "B");
			End
		ElseIf(key(_a))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "X");
			End
		ElseIf(key(_w))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "Z");
			End
		ElseIf(key(_SPACE))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "L");
			End
		ElseIf(key(_ESC))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "R");
			End
		ElseIf(key(_ENTER))
			If(!preventKey)
				preventKey = true;
				If(txt != 0) DELETE_TEXT(txt); End
				txt = write(0, 640/2, 480/2, 0, "START");
			End
		Else
			preventKey = false;
		End
		
		frame;
	End*/