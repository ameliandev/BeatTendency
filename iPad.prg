//Autor: 		Adrian Melian (KeiDash)
//Date:  		10/12/2017
//Description: 	Include que almacena toda la configuración y procesos relacionados con los Pad's

#define K_White 59
#define K_A_OFF 53
#define K_A_ON 54
#define K_B_OFF 55
#define K_B_ON 56
#define K_SCRATCH_A 999
#define K_SCRATCH_B 999
#define K_WHITEPRESSED 58

Function iPAD_setPadConfig()
Begin

	gb_PadPort1 = 0;

	gamePad.PAD_UP 		= _UP;
	gamePad.PAD_DOWN 	= _DOWN;
	gamePad.PAD_LEFT 	= _LEFT;
	gamePad.PAD_RIGHT 	= _RIGHT;
	gamePad.PAD_A 		= _s;
	gamePad.PAD_B 		= _d;
	gamePad.PAD_X 		= _w;
	gamePad.PAD_Y 		= _a;
	gamePad.PAD_START 	= _ENTER;
	gamePad.PAD_L 		= _ESC;
	gamePad.PAD_R 		= _SPACE;
	
	gamePad.PAD_ANG_UP 		= -127;
	gamePad.PAD_ANG_DOWN 	= 127;
	gamePad.PAD_ANG_LEFT 	= -127;
	gamePad.PAD_ANG_RIGHT 	= 127;

End

/*
Process key_Evaluate(int currYPOS)
Private
	int i;
	int f;
	int gotchaLength = 0;
End
Begin
	//CASO _PERFECT(0), _GOOD(1), _POOR(2):
	gotchaLength = sizeof(gi_GotchaTypes)/sizeof(gi_GotchaTypes[0]) - 1;
	
	For(i=0;i < gotchaLength; i++)
		For(f=0; f < 6; f++)
			If(currYPOS == gi_GotchaTypes[i][f])
				//TODO
				//Points_Recalculate(f);
				break;
			End
		End
	End
End
*/

Process keyLEFT_AxisEvent()
Private
	byte keyDeny = false;
End
Begin
	FILE = gameFpg.Identifier;
	GRAPH = K_White;
	X = 90;
	Y = 400;
	Z = 95;
	
	Loop
	
		Switch(os_id)
			case 5:
				If(joy_gethat(gb_PadPort1, gamePad.PAD_LEFT) || key(gamePad.PAD_LEFT))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_LEFT = gamePad.PAD_LEFT;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_LEFT = -1;
					GRAPH = K_White;
				End
			end
			case 0:
				If(key(gamePad.PAD_LEFT))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_LEFT = gamePad.PAD_LEFT;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_LEFT = -1;
					GRAPH = K_White;
				End
			end
		End
		
		frame;
	End
End

Process keyDOWN_AxisEvent()
Private
	byte keyDeny = false;
End
Begin
	FILE = gameFpg.Identifier;
	GRAPH = K_White;
	X = 128;
	Y = 400;
	Z = 95;
	
	Loop
		
		Switch(os_id)
			case 5:
				If(joy_gethat(gb_PadPort1, gamePad.PAD_DOWN) || key(gamePad.PAD_DOWN))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_DOWN = gamePad.PAD_DOWN;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_DOWN = -1;
					GRAPH = K_White;
				End
			end
			case 0:
				If(key(gamePad.PAD_DOWN))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_DOWN = gamePad.PAD_DOWN;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_DOWN = -1;
					GRAPH = K_White;
				End
			end
		End
		
		frame;
	End
		
End

Process keyRIGHT_AxisEvent()
Private
	byte keyDeny = false;
End
Begin
	FILE = gameFpg.Identifier;
	GRAPH = K_White;
	X = 166;
	Y = 400;
	Z = 95;
	
	Loop
	
		Switch(os_id)
			case 5:
				If(joy_gethat(gb_PadPort1, gamePad.PAD_RIGHT) || key(gamePad.PAD_RIGHT))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_RIGHT = gamePad.PAD_RIGHT;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_RIGHT = -1;
					GRAPH = K_White;
				End
			end
			case 0:
				If(key(gamePad.PAD_RIGHT))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_RIGHT = gamePad.PAD_RIGHT;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_RIGHT = -1;
					GRAPH = K_White;
				End
			end
		End
	
		frame;
	End
	
End

Process keyUP_AxisEvent()
Private
	byte keyDeny = false;
End
Begin
	
	Loop
	
		Switch(os_id)
			case 5:
				If(joy_gethat(gb_PadPort1, gamePad.PAD_UP) || key(gamePad.PAD_UP))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_UP = gamePad.PAD_UP;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_UP = -1;
					GRAPH = K_White;
				End
			end
			case 0:
				If(key(gamePad.PAD_UP))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_UP = gamePad.PAD_UP;
						GRAPH = K_WHITEPRESSED;
					End
				Else
					keyDeny = false;
					NotificationKey_UP = -1;
					GRAPH = K_White;
				End
			end
		End
	
		frame;
	End
	
End

Process keyA_ButtonEvent()
Private
	byte keyDeny = false;
End
Begin
	FILE = gameFpg.Identifier;
	GRAPH = K_A_OFF;
	X = 109;
	Y = 390;
	Z = 95;
				
	Loop
		If(joy_getbutton(gb_PadPort1, gamePad.PAD_A) || key(gamePad.PAD_A))
			If(!keyDeny)
				keyDeny = true;
				NotificationKey_A = gamePad.PAD_A;
				GRAPH = K_A_OFF;
				PlayTrack(gi_MusicTRK03, false);
			End
		Else
			keyDeny = false;
			NotificationKey_A = -1;
			GRAPH = K_A_ON;			
		End
		
		frame;
	End

End

Process keyB_ButtonEvent()
Private
	byte keyDeny = false;
End
Begin
	FILE = gameFpg.Identifier;
	GRAPH = K_B_OFF;
	X = 147;
	Y = 390;
	Z = 95;
	
	Loop
	
		Switch(os_id)
			case 5:
				If(joy_getbutton(gb_PadPort1, gamePad.PAD_B) || key(gamePad.PAD_B))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_B = gamePad.PAD_B;
						GRAPH = K_B_ON;
					End
				Else
					keyDeny = false;
					NotificationKey_B = -1;
					GRAPH = K_B_OFF;
				End
			end
			case 0:
				If(key(gamePad.PAD_B))
					If(!keyDeny)
						keyDeny = true;
						NotificationKey_B = gamePad.PAD_B;
						GRAPH = K_B_ON;
					End
				Else
					keyDeny = false;
					NotificationKey_B = -1;
					GRAPH = K_B_OFF;
				End
			end
		End
	
		frame;
	End
End

Process keySCRATCH_ButtonEvent()
Private
	byte keyDeny = false;
End
Begin

	FILE = gameFpg.Identifier;
	GRAPH = K_SCRATCH_A;
	X = 195;
	Y = 396;
	Z = 98;
	
	Loop
	
		If(key(gamePad.PAD_R) || key(gamePad.PAD_R))
			If(!keyDeny)
				keyDeny = true;
				NotificationKey_R = gamePad.PAD_R;
				GRAPH = K_SCRATCH_A;
			End
		Else
			keyDeny = false;
			NotificationKey_R = -1;
			GRAPH = K_SCRATCH_B;
		End
	
		frame;
	End

End

Process Gamepad_ChangeConfig(byte tipo)
Private
End
Begin
	/*Switch(tipo)
		case 0: //A TYPE
			PAD_MODE_A = true;
			PAD_MODE_A_inv = false;
			PAD_MODE_B = false;
			PAD_MODE_B_inv = false;
		end
		case 1: //B TYPE
			PAD_MODE_A = false;
			PAD_MODE_A_inv = true;
			PAD_MODE_B = false;
			PAD_MODE_B_inv = false;
		end
		case 2: //C TYPE
			PAD_MODE_A = false;
			PAD_MODE_A_inv = false;
			PAD_MODE_B = true;
			PAD_MODE_B_inv = false;
		end
		case 3: //D TYPE
			PAD_MODE_A = false;
			PAD_MODE_A_inv = false;
			PAD_MODE_B = false;
			PAD_MODE_B_inv = true;
		end
		default:
			PAD_MODE_A = true;
			PAD_MODE_A_inv = false;
			PAD_MODE_B = false;
			PAD_MODE_B_inv = false;
		end
	End	*/			
End
