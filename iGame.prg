//Autor: 		Adrian Melian (KeiDash)
//Date:  		29/10/2017
//Description: 	Include Game. El juego en si.

Process RunGame(byte trackId)
Private
	int prc_GuitarBg 	= 0;
	int prc_GuitarSc 	= 0;
	int prc_Tunnel		= 0;		
	int prc_TunnelRf	= 0;		
	int prc_Level		= 0;	
	int prc_KeyDL 		= 0;
	int prc_KeyDC 		= 0;
	int prc_KeyDR 		= 0;
	int prc_KeyUL 		= 0;
	int prc_KeyUR 		= 0;
	int prc_KeySC 		= 0;
End
Begin
	
	gi_Wait = 0;
	gi_SongFinish = 0;
	trackWasPlayed = 0;
	demoIsrunning = false;
	put_screen(gameFpg.Identifier, 40);
	
	set_text_color(rgb(255,255,255));
	
	if(!demoIsrunning)
		gi_PROC_Points = Points_Initialice();
		//gi_PROC_Points = Points_Initialice(trackId);
	end
	
	prc_GuitarBg 	= SetGuitarBG();
	prc_GuitarSc 	= SetGuitarScroll();
	prc_Tunnel		= SetTunnel(gameFpg.Identifier, 42, 144, 20, 5);
	//prc_TunnelRf	= SetReflect(gameFpg.Identifier, 43, 144, 33, 5);
	//prc_Level		= DisplayLevel(getLevel(BTTrackCollection[trackId]._Level), 640/2 - 63, 57, 5);
	prc_Level		= DisplayLevel(getLevel(tLevel), 640/2 - 63, 57, 5);
	
	
	//say("GAME 1: " + ID.SON);
	//say("GAME 2: " + prc_GuitarBg);
	//say("GAME 3: " + prc_GuitarBg.SMALLBRO);
	//say("GAME 4: " + prc_GuitarBg.SMALLBRO.SMALLBRO);
	//say("GAME 5: " + prc_GuitarBg.SMALLBRO.SMALLBRO.SMALLBRO);
	
	frame;
	
	if(EXISTS(prc_GuitarBg.SMALLBRO.SMALLBRO.SMALLBRO)) 
		SIGNAL(prc_GuitarBg.SMALLBRO.SMALLBRO.SMALLBRO, S_FREEZE); 
	end
	//if(EXISTS(prc_Level)) SIGNAL(prc_Level, S_FREEZE); end
	
	if(!demoIsrunning)
		prc_KeyDL = keyLEFT_AxisEvent();
		//prc_KeyDC = keyDOWN_AxisEvent();
		//prc_KeyDR = keyRIGHT_AxisEvent();
		//prc_KeyUL = keyA_ButtonEvent();
		//prc_KeyUR = keyB_ButtonEvent();
		//prc_KeySC = keySCRATCH_ButtonEvent();
		keyDOWN_AxisEvent();
		keyRIGHT_AxisEvent();
		keyA_ButtonEvent();
		keyB_ButtonEvent();
		keySCRATCH_ButtonEvent();
		
		//say("GAME 6: " + prc_KeyDL);
		//say("GAME 8: " + prc_KeyDL.SMALLBRO);
		//say("GAME 9: " + prc_KeyDL.SMALLBRO.SMALLBRO);
		//say("GAME 10: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO);
		//say("GAME 11: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO);
		//say("GAME 12: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO);
	
		set_fps(60,2);
		
		//PulsShow();
		
		WaitingUntil(TimeToMiliseconds("2.000"));
		
		//PlaySong(trackId);
		PlaySong();
		
		write(0, 640/2, 480/2, 1, "TERMINO - Presiona START");
		//say("-----------------------------------------------------------");
		//say("GAME 6: " + prc_KeyDL);
		//say("GAME 8: " + prc_KeyDL.SMALLBRO);
		//say("GAME 9: " + prc_KeyDL.SMALLBRO.SMALLBRO);
		//say("GAME 10: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO);
		//say("GAME 11: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO);
		//say("GAME 12: " + prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO);
		
		SIGNAL(prc_GuitarBg, S_FREEZE);
		SIGNAL(prc_GuitarBg.SMALLBRO, S_FREEZE);
		SIGNAL(prc_GuitarBg.SMALLBRO.SMALLBRO, S_FREEZE);
		SIGNAL(prc_KeyDL, S_FREEZE);
		SIGNAL(prc_KeyDL.SMALLBRO, S_FREEZE);
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO, S_FREEZE);
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO, S_FREEZE);
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO, S_FREEZE);
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO, S_FREEZE);
		//SIGNAL(prc_KeySC, S_FREEZE);
		SIGNAL(gi_PROC_Points, S_FREEZE);
		
		/*
		SIGNAL(prc_GuitarBg, S_FREEZE);
		SIGNAL(prc_GuitarSc, S_FREEZE);
		SIGNAL(prc_Tunnel, S_FREEZE);
		SIGNAL(prc_KeyDL, S_FREEZE);
		SIGNAL(prc_KeyDC, S_FREEZE);
		SIGNAL(prc_KeyDR, S_FREEZE);
		SIGNAL(prc_KeyUL, S_FREEZE);
		SIGNAL(prc_KeyUR, S_FREEZE);
		SIGNAL(prc_KeySC, S_FREEZE);
		SIGNAL(gi_PROC_Points, S_FREEZE);
		*/
		Repeat
			frame;
		Until(key(gamePad.PAD_START))
		
		trackWasPlayed = true;
		
		ScreenChange();
		Delete_Text(ALL_TEXT);
		
		StopTrack(false);
	else
		WaitingUntil(TimeToMiliseconds("2.000"));
		//PlaySong(trackId);
		PlaySong();
	end
	
	If(EXISTS(prc_GuitarBg.SMALLBRO.SMALLBRO)) SIGNAL(prc_GuitarBg.SMALLBRO.SMALLBRO, S_KILL); End
	If(EXISTS(prc_GuitarBg.SMALLBRO)) SIGNAL(prc_GuitarBg.SMALLBRO, S_KILL); End
	If(EXISTS(prc_GuitarBg)) SIGNAL(prc_GuitarBg, S_KILL); End
	
	If(EXISTS(prc_Level)) SIGNAL(prc_Level, S_KILL_TREE); End
		
	If(EXISTS(prc_KeyDL)) 
		SIGNAL(prc_KeyDL, S_KILL_TREE); 
	End
	If(EXISTS(prc_KeyDL.SMALLBRO)) 
		SIGNAL(prc_KeyDL.SMALLBRO, S_KILL_TREE); 
	End
	If(EXISTS(prc_KeyDL.SMALLBRO.SMALLBRO)) 
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO, S_KILL_TREE); 
	End
	If(EXISTS(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO)) 
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO, S_KILL_TREE); 
	End
	If(EXISTS(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO)) 
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO, S_KILL_TREE); 
	End
	If(EXISTS(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO)) 
		SIGNAL(prc_KeyDL.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO.SMALLBRO, S_KILL_TREE); 
	End
	
	If(EXISTS(gi_PROC_Points)) SIGNAL(gi_PROC_Points, S_KILL_TREE); End
	/*
	Loop
		frame;
	End
	*/
OnExit
	gi_TrackLoaded = false;
End



//Function PlaySong(byte trackId)
Function PlaySong()
Begin

	//REPRODUCIMOS LA MÚSICA	
	
	//PlayTrack(BTTrackCollection[trackId]._trackId, 0);
	PlayTrack(tTrackId, 0);

	gi_initTime = get_timer();
	
	//showInitTime();
	
	if (IS_PLAYING_SONG())
		//TODO
		//initialiceTimer();
		
		gi_SonCanRunIt = 1;
		
		//LANZAMOS LOS PADRES
		//TODO
		//iTRACK_launchFathers(trackId);
		iTRACK_launchFathers();
		
		While(gi_SongFinish != 1)
			frame;
		End
		
		//say("Puntos SUPER: " 	+ gi_SuperPoints);
		//say("Puntos PERFECT: " 	+ gi_PerfectPoints);
		//say("Puntos GOOD: " 	+ gi_GoodPoints);
		//say("Puntos POOR: " 	+ gi_PoorPoints);
		//say("Puntos BAD: " 		+ gi_BadPoints);
		//say("TOTAL PUNTOS: " 	+ (gi_PerfectPoints+gi_GoodPoints+gi_PoorPoints));
		
	end
	
OnExit
End

/*
* Descripcion: 	Proceso que se encarga de mantener en espera las notas musicales
*				que no les toca aparecer aún en pantalla. Consulta el tiempo (get_timer() y si
*				coincide o supera el tiempo, muestra la nota.
*/
Process iGAME_WaitingForDisplay(byte trackId, int milis, byte chordType, byte chordIndex)
Private
	int justTime 	= 0;
	int diffTime 	= 0;
	int sonGraph 	= 0;
	int sonX		= 0;
	int sonY		= 0;
	int sonSpeed 	= 0;
Begin
	
	sonGraph 		= getGraph_byChordID(chordType);
	sonX 			= getXPos_byChordID(chordType);
	sonY 			= _MINCHORD_Y;
	sonSpeed 		= TrackArray[chordIndex][_SPEED];
	//sonSpeed = BTTrackCollection[trackId]._Chords[chordIndex]._Speed;
	
	Repeat
		frame;
	Until(gi_SonCanRunIt == 1)
	
	//Calculamos la diferencia desde que empezo a sonar la cancion hasta donde se deberia mostrar
	if (chordIndex == 0)
		diffTime = get_timer() - gi_initTime;
	end
		
	justTime = (get_timer() + milis) - diffTime - gi_rectificationTime;
	
	frame;
	
	Loop
		if(get_timer() >= justTime) break; End
		frame;
	End
	
	ChordShow(sonGraph, sonX, sonY, sonSpeed, chordType, chordIndex, justTime, trackId);
	
	frame;
End

Process DisplayLevel(GRAPH, X, Y, Z)
Begin
	
	FILE = gameFpg.Identifier;
	
	Loop
		frame;
	End
End


Process ChordShow(GRAPH, X, Y, int chordSpeed, byte chordType, byte chordIndex, int callerTime, byte trackId)
Private
	byte keyid 			= 0;
	int currentY 		= 0;
	int currentTime 	= 0;
	int justTime 		= 0;
	int yposCorrection 	= 0;
End
Begin
	
	frame;
	
	keyid = chordType;
	
	FILE = gameFpg.Identifier;
	Z = 97;

	frame;
	
	if(chordindex == 0)
		gi_rectificationTime = get_timer() - callerTime;
	end
	 
	Repeat
		
		frame;
		
		Y += chordSpeed;
		//Y += gi_SPEED;
		
		If(Y >= _MAX_GOTCHA + 1) break; End
		
		//SI LA NOTA ESTÁ A UN 75% DE LA GUITARRA, LANZA EL HIJO
		if((Y >= ((_MAXCHORD_Y * TrackArray[chordIndex][_SONTHROWEDP]) / 100)) && (TrackArray[chordIndex][_SONTHROWED] == 0))
			//Marcamos la nota como lanzada.
			TrackArray[chordIndex][_SONTHROWED] = 1;
			
			//Si el tiempo minimo no se ha establecido, es porque la cantidad de notas
			//no supone una carga para establecerlo, por lo que el hijo (Son) sigue siendo 0:
			if(TrackArray[chordIndex][_SON] != 0)
				SIGNAL(TrackArray[chordIndex][_SON], S_WAKEUP_FORCE);
			end
		end
		
		/*
		if((Y >= ((_MAXCHORD_Y * BTTrackCollection[trackId]._Chords[chordIndex]._SonThrowPercent) / 100)) && (BTTrackCollection[trackId]._Chords[chordIndex]._SonThrowed == 0))
			//Marcamos la nota como lanzada.
			BTTrackCollection[trackId]._Chords[chordIndex]._SonThrowed = 1;
			
			//Si el tiempo minimo no se ha establecido, es porque la cantidad de notas
			//no supone una carga para establecerlo, por lo que el hijo (Son) sigue siendo 0:
			if(BTTrackCollection[trackId]._Chords[chordIndex]._Son != 0)
				SIGNAL(BTTrackCollection[trackId]._Chords[chordIndex]._Son, S_WAKEUP_FORCE);
			end
		end
		*/
		
		
		If(NotificationKey_LEFT != 0 
			|| NotificationKey_DOWN != 0
			|| NotificationKey_RIGHT != 0
			|| NotificationKey_A != 0
			|| NotificationKey_B != 0
			|| NotificationKey_R != 0 )
		
			If((keyid == NotificationKey_LEFT && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_LEFT = 0;
					
					//TODO
					Points_Recalculate(currentY);
				End
			Elseif((keyid == NotificationKey_DOWN && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_DOWN = 0;
					
					//TODO
					Points_Recalculate(currentY);
				End
			Elseif((keyid == NotificationKey_RIGHT && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_RIGHT = 0;
					
					//TODO
					Points_Recalculate(currentY);
				End
			Elseif((keyid == NotificationKey_A && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_A = 0;
					//TODO
					Points_Recalculate(currentY);
				End
			Elseif((keyid == NotificationKey_B && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_B = 0;
					//TODO
					Points_Recalculate(currentY);
				End
			Elseif((keyid == NotificationKey_R && allowNotification))
				currentY = Y;
				If(isGotcha(currentY))
					allowNotification = false;
					
					NotificationKey_R = 0;
					//TODO
					Points_Recalculate(currentY);
				End
			End
			
		End
		
		frame;
	Until(Y >= _MAXCHORD_Y)
	
	
OnExit
	if(TrackArray[chordIndex][_LAST] == 1)
		gi_SongFinish = 1;
	end
	/*
	if(BTTrackCollection[trackId]._Chords[chordIndex]._Last == 1)
		gi_SongFinish = 1;
	end
	*/
End

Process PulsShow()
Begin
	Pul_LEFTShow();
	Pul_DOWNShow();
	Pul_RIGHTShow();
	Pul_AShow();
	Pul_BShow();
	Pul_RShow();
End

Process PulsationShow(int GRAPH, int Y, int X)
Private
	int i = 0;
Begin
	FILE = gameFpg.Identifier;
	Z = 1;	
	ALPHA = 90;
				
	Repeat
		if(isDivisible(i, 2)) ALPHA -= 4; end
		i++;
		frame;
	Until(ALPHA == 0 ||i == 60)
End

//Muestreo de pulsaciones
Process Pul_LEFTShow()
Private
	byte keyDeny = 0;
Begin

	Loop
		If(key(gamePad.PAD_LEFT))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(17, _PUL_POS_Y, 90);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
	
End

Process Pul_DOWNShow()
Private
	byte keyDeny = 0;
Begin

	Loop
	
		If(key(gamePad.PAD_DOWN))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(17, _PUL_POS_Y, 127);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
End

Process Pul_RIGHTShow()
Private
	byte keyDeny = 0;
Begin

	Loop
	
		If(key(gamePad.PAD_RIGHT))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(17, _PUL_POS_Y, 165);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
End

Process Pul_AShow()
Private
	byte keyDeny = 0;
Begin

	Loop
	
		If(key(gamePad.PAD_A))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(18, _PUL_POS_Y, 108);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
End

Process Pul_BShow()
Private
	byte keyDeny = 0;
Begin

	Loop
	
		If(key(gamePad.PAD_B))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(19, _PUL_POS_Y, 146);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
End

Process Pul_RShow()
Private
	byte keyDeny = 0;
Begin

	Loop
	
		If(key(gamePad.PAD_R))
			If(!keyDeny)
				keyDeny = true;
				PulsationShow(13, _PUL_POS_Y, 191);
			End
		Else
			keyDeny = false;
		End
		
		frame;
	End
End

/*
Process Chordtest()
Private
	int keyid = 0;
	int initTime = 0;
	int endTime = 0;
End
Begin
	
	frame;
	
	//keyid = gamePad.PAD_LEFT;
	PRIORITY = 1;
	FILE = gameFpg.Identifier;
	GRAPH = getGraph_byChordID(gamePad.PAD_LEFT);;
	X = getXPos_byChordID(gamePad.PAD_LEFT);
	Y = _MINCHORD_Y;
	Z = 97;
	
	initTime = get_timer();
	
	While(Y <= _MAXCHORD_Y)
		Y += gi_SPEED;
		frame;
	End
	
	endTime = get_timer();
	
	write(0, 580, 10, ALIGN_CENTER, initTime);
	write(0, 580, 20, ALIGN_CENTER, endTime);
	
End
*/

Function byte isGotcha(int ypos)
Begin
	return ypos >= _MIN_GOTCHA && ypos <= _MAX_GOTCHA;
End

Process SetTunnel(FILE, GRAPH, X, Y, Z)
Begin
	Loop
		frame;
	End
End

Process SetReflect(FILE, GRAPH, X, Y, Z)
Begin
	//TODO
	//EL ALPHA DE MOMENTO BLOQUEA EL JUEGO EN DREAMCAST POR LA CANTIDAD DE COLORES
	ALPHA = 120;
	Loop
		frame;
	End
End

Process SetGuitarBG()
Begin
	
	FILE = gameFpg.Identifier;
	GRAPH = 41;
	X = 144;
	Y = 189;
	Z = 99;
	
	Loop
		frame;
	End
End

Process SetGuitarScroll()
Private
	byte f;
End
Begin
	
	FILE = gameFpg.Identifier;
	GRAPH = 49;
	X = 144;
	Y = 11;
	Z = 98;
	
	Repeat
		
		For (f = 0 ; f < gi_Wait; f++) //Retardo
			frame;
		End
			
		Y += gi_Speed;
		X = X;
		
		If(Y >= _MAXGUITAR_YPOS)
			Y = 11;
		Else
			frame;
	    End
	Until(gi_SongFinish)
	
End

/*
Process Gotcha_ShowBad()
Private
	byte i = 0;
	byte nAnimation = 0;
End
Begin

	frame; //Ejecutamos para que el padre continúe y no me espere.
	
	FILE = 0;
	GRAPH = 0;
	X = 0;
	Y = 0;
	Z = 0;
	ALPHA = 0;
	
	nAnimation = 5; //TODO: Colocar la cantidad de animaciones de los frames
	
	From i=0 TO nAnimation STEP 1;
		GRAPH = GRAPH + 1;
		frame;
	End
	
End
*/

Function getLevel(byte trackLevel)
Begin
	Switch(trackLevel)
		case 0:
			return 44;
		end
		case 1:
			return 45;
		end
		case 2:
			return 46;
		end
	End
End

Function byte getGraph_byChordID(byte chordID)
Private
	//int graphId = 0;
End
Begin
	frame;
	
	Switch(chordID)
		case gamePad.PAD_LEFT: //B1
			return 60;
		end
		case gamePad.PAD_DOWN: //B2
			return 60;
		end
		case gamePad.PAD_RIGHT: //B3
			return 60;
		end
		case gamePad.PAD_A: //U1
			return 62;
		end
		case gamePad.PAD_B: //U2
			return 61;
		end
		case gamePad.PAD_R: //SCRATCH
			return 63;
		end
		case gamePad.PAD_L:
			return 999; //Sin definir
		end
	End
	
	//return graphId;
End

//Description: This function get the main X position of the chord by the Id.
//Returns: x position as int
Function byte getXPos_byChordID(byte chordID)
Private
End
Begin
	
	frame;
	
	Switch(chordID)
		case gamePad.PAD_LEFT: //B1
			return 89;
		end
		case gamePad.PAD_DOWN: //B2
			return 127;
		end
		case gamePad.PAD_RIGHT: //B3
			return 165;
		end
		case gamePad.PAD_A: //U1
			return 108;
		end
		case gamePad.PAD_B: //U2
			return 146;
		end
		case gamePad.PAD_R: //SCRATCH
			return 191;
		end
		case gamePad.PAD_L:
			return 193;
		end
	End
End

Function byte isDivisible(int nA, int nB)
Begin
	return (nA % nB) == 0 ? True : False;
End
