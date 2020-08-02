//Autor: 		Adrian Melian (KeiDash)
//Date:  		21/12/2017
//Description: 	Include Options. Contiene todos los métodos de los elementos relacionados con la ventana de opciones del juego.

Process DisplayOptions()
Begin

	DisplayHeaderOptions();
	DisplayPadOptions();
	
	Loop
		frame;
	End
End

Process DisplayHeaderOptions()
Private
	int txtOptA = -1;
	int txtOptB = -1;
End
Begin
	txtOptA = write(0, 100, 50, ALIGN_CENTER, "GAMEPAD");
	txtOptA = write(0, 400, 50, ALIGN_CENTER, "VMU");
	
End

Process DisplayPadOptions()
Private
	string padOptions[4];
	int txtMode = -1;
	byte modeSelected = 0; //Default
	byte lenght = 0;
End
Begin
	preventKey = false;
	
	padOptions[0] = "MODE A";
	padOptions[1] = "MODE A 2";
	padOptions[2] = "MODE B";
	padOptions[3] = "MODE B 2";
	
	lenght = sizeof(padOptions[0]);
	
	txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[0]);
	
	Repeat
		If(key(PAD_RIGHT) || joy_getaxis(gb_PadPort1, -1) > 6)
			If(!preventKey)
				preventKey = true;
				If(!modeSelected < lenght)
					If((modeSelected + 1) != lenght) modeSelected++; End
					If(txtMode != 0) DELETE_TEXT(txtMode); End
					txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
				End
			End
		ElseIf(key(PAD_LEFT) || joy_getaxis(gb_PadPort1, -1) < -300)
			If(!preventKey)
				preventKey = true;
				If(!modeSelected <= 0) modeSelected--; End
				If(txtMode != 0) DELETE_TEXT(txtMode); End
				txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
			End
		Else
			preventKey = false;
		End
		
		/*If(PadExists())
			If(joy_getaxis(gb_PadPort1, -1) < -300)		//IZQUIERDA
				If(!preventKey)
					preventKey = true;
					If(!modeSelected <= 0)
						modeSelected--;
					End
					If(txtMode != 0) DELETE_TEXT(txtMode); End
					txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
				End
			ElseIf(joy_getaxis(gb_PadPort1, -1) > 6)	//DERECHA
				If(!preventKey)
					preventKey = true;
					If(!modeSelected < lenght)
						If((modeSelected + 1) != lenght) modeSelected++; End
						If(txtMode != 0) DELETE_TEXT(txtMode); End
						txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
					End
				End
			Else
				preventKey = false;
			End
		Else
			If(key(PAD_LEFT)) 									//IZQUIERDA
				If(!preventKey)
					preventKey = true;
					If(!modeSelected <= 0) modeSelected--; End
					If(txtMode != 0) DELETE_TEXT(txtMode); End
					txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
				End
			ElseIf(key(PAD_RIGHT)) 								//DERECHA
				If(!preventKey)
					preventKey = true;
					If(!modeSelected < lenght)
						If((modeSelected + 1) != lenght) modeSelected++; End
						If(txtMode != 0) DELETE_TEXT(txtMode); End
						txtMode = write(0, 640/2 - 40, 100, ALIGN_CENTER_LEFT, padOptions[modeSelected]);
					End
				End
			Else
				preventKey = false;
			End
		End*/
		
		frame;
		
	Until(key(_ENTER) || joy_getbutton(gb_PadPort1, PAD_START))
	
	WaitingUntil(TimeToMiliseconds("1.000"));
	
	Gamepad_ChangeConfig(modeSelected);
	
OnExit
	If(txtMode != 0) DELETE_TEXT(txtMode); End
End