//Autor: 		Adrian Melian (KeiDash)
//Date:  		29/10/2017
//Description: 	Include Main Screen. Contiene todos los métodos de los elementos que se muestran hasta el inicio del juego.


#define _OPT_START 0
#define _OPT_OPTIONS 1
#define _OPT_EXTRA 2
	
/**
  * @desc	Function that execute some methods when the screen change in the game.
  * @param 	byte $showRAM - Indica si se muestra la cantidad de RAM disponible en pantalla.
  * @return void - no retorno
*/
Function ScreenChange()
Private
Begin
	CLEAR_SCREEN();
	frame;
	//DELETE_TEXT(ALL_TEXT);
	if(DEBUG) RAMShowFree(); end
End


/**
  * @desc	Function that display the main game menu.
  * @param 	null
  * @return void - no retorno
*/
Process iSCREEN_displayMainMenu()
Private
	int p_iPSetLogo 	= 0;
	byte trackId 		= 0;
	byte isSelectingTrack 	= false;
Begin

	FILE = gameFpg.Identifier;
	GRAPH = 5;
	X = 640/2;
	Y = 480/2;
	Z = 5;

	p_iPSetLogo = iSCREEN_DisplayLogo();
	iSCREEN_DisplayTxtFeel(gameFpg.Identifier, 7, 640/2);

	iSCREEN_ActionPressStart();
	
	Repeat
		frame;
	Until(key(gamePad.PAD_START))
	btnStartPressed = true;
	
	If(EXISTS(ID.SON)) SIGNAL(ID.SON, S_KILL); End
	
	WaitingUntil(TimeToMiliseconds("0.500"));

	iSCREEN_DisplayOptions();
	iSCREEN_ActionSelectOption();
	
	gi_TrackLoaded = false;

	Loop

		//Reiniciamos los procesos del menú principal
		if(gb_goToMainMenu)
			
			StopTrack(false);
			WaitingUntil(TimeToMiliseconds("2.000"));
			PlayTrack(gi_MusicIntroId, -1);
			
			gb_OptionSelected 	= false;
			OPTIONSEL 			= 0;
			GRAPH 				= 5;
			X 					= 640/2;
			Y 					= 480/2;
			Z					= 5;
			
			if(EXISTS(p_iPSetLogo)) SIGNAL(p_iPSetLogo, S_WAKEUP); end
			if(EXISTS(p_iPSetLogo.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO, S_WAKEUP); end
			if(EXISTS(p_iPSetLogo.SMALLBRO.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO.SMALLBRO, S_WAKEUP); end
			if(EXISTS(p_iPSetLogo.SMALLBRO.SMALLBRO.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO.SMALLBRO.SMALLBRO, S_WAKEUP); end
			
			Repeat frame; Until(gb_OptionSelected)
			
			gb_goToMainMenu = false;
		end
		
		if(gb_OptionSelected && !gb_goToMainMenu)
			if(OPTIONSEL != -1)
				Switch(OPTIONSEL)
					case _OPT_START:
						
						trackWasPlayed = false;
						demoIsrunning = false;
						
						isSelectingTrack = true;
						
						ScreenChange();
						
						StopTrack(true);
						
						WaitingUntil(TimeToMiliseconds("2.000"));
						
						GRAPH = -9999;
						
						if(EXISTS(p_iPSetLogo.SMALLBRO.SMALLBRO.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO.SMALLBRO.SMALLBRO, S_SLEEP); end
						if(EXISTS(p_iPSetLogo.SMALLBRO.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO.SMALLBRO, S_SLEEP); end
						if(EXISTS(p_iPSetLogo.SMALLBRO)) SIGNAL(p_iPSetLogo.SMALLBRO, S_SLEEP); end
						if(EXISTS(p_iPSetLogo)) SIGNAL(p_iPSetLogo, S_SLEEP); end

						DELETE_TEXT(ALL_TEXT);
						ScreenChange();
						
						WaitingUntil(TimeToMiliseconds("3.000"));
						
						trackId = iSCREEN_ActionSelectTrack();
						
						if(!gb_goToMainMenu)
						
							DELETE_TEXT(ALL_TEXT);
							ScreenChange();
							
							StopTrack(true);
							WaitingUntil(TimeToMiliseconds("2.000"));
												
							//CARGAMOS EL FPG PARA LOS READY:
							//fpg_SCR4_RDY = load_fpg(graphPath + "screen4RDY.fpg"); //6.432mb libres
							
							//OBTENEMOS CANCION EN ARRAY Y MEMORIA:
							//iTRACK_setTrack(trackId);
							set_text_color(rgb(255,255,255));
							write(0, 100, 20, ALIGN_TOP_LEFT, "Num Cancion: " 	+ trackId);
							
							
							Switch(trackId)
								case 0:
									write(0, 100, 40, ALIGN_TOP_LEFT, "Se van a cargar datos de la cancion: " 	+ trackId);
									set_Track_01();
								end
							End
							
							write(0, 100, 60, ALIGN_TOP_LEFT, "Datos cargados");
							
							//MOSTRAMOS READY:
							//proc_Ready = iSCREEN_DisplayReady();

							//Esperamos a que la carga de los datos del tema se complete
							/*Repeat
								frame;
							Until(gi_TrackLoaded == true)
							*/
							gi_TrackLoaded = false;
							
							/*if(iGAME_LoadGameAssets() == 1)					
								displayLoading(false);
							else
								write(0, 640/2, 480/2, 0, "ERROR DE CARGA DE CANCION");
							end*/
							
							//if(exists(proc_Ready)) SIGNAL(proc_Ready, S_KILL_TREE); end
											
							//OCULTAMOS READY:
							//proc_Flash = iSCREEN_DisplayFlash(640/2, 480/2, 1);
				
							/*Repeat
								frame;
							Until(gi_GameLoadFinished == 1)
							
							gi_GameLoadFinished = -1;*/
							
							//if(exists(proc_Flash)) SIGNAL(proc_Flash, S_KILL_TREE); end
							//if (fpg_SCR4_RDY != 0) UNLOAD_FPG(fpg_SCR4_RDY); end
							
							DELETE_TEXT(ALL_TEXT);
							ScreenChange();
			
							gi_PROC_Game = RunGame(trackId);
							
							While(!trackWasPlayed)
								frame;
							End
							trackWasPlayed = true;
							
							if(EXISTS(gi_PROC_Game)) SIGNAL(gi_PROC_Game, S_KILL_TREE); end
							
							DELETE_TEXT(ALL_TEXT);
							ScreenChange();
							
							gb_goToMainMenu 	= false;
							gb_OptionSelected 	= true;
						
						else
							gb_goToMainMenu 	= true;
							gb_OptionSelected 	= false;
						end
						
						
						
					end
					case _OPT_OPTIONS:
						//iSCREEN_UnloadMainFPG();
						//DisplayOptions();
					end
					case _OPT_EXTRA:
						//iSCREEN_UnloadMainFPG();
					end
				End
			end
		end
		
		frame;
	End
End


/**
  * @desc	Function that display the previous screens at the main menu. Throw a background
			music track too.
  * @param 	null
  * @return void - no retorno
*/
Function iSCREEN_DisplayIntro()
Private
Begin
	
	PlayTrack(gi_MusicIntroId, -1);
	
	//iSCREEN_DisplayRights();
	//iSCREEN_DisplayAuthorLogo();
	//iSCREEN_DisplayBennuGd();
End


/**
  * @desc	Function that dispaly the rights screen.
  * @param 	null
  * @return void - no retorno
*/
Function iSCREEN_DisplayRights()
Private
	byte i = 0;
End
Begin

	FILE = gameFpg.Identifier;
	GRAPH = 1;
	X = 640/2;
	Y = 480/2;
	//ALPHA = 0;
	
	/*for(i=0;i<100;i++)
		if(i == (m * 10)) m++; ALPHA += 40; End
		frame;
	end*/
	
	frame;
	
	WaitingUntil(TimeToMiliseconds("5.000"));
	
	/*
	for(i=100;i>0;i--)
		if(i == (m * 10)) m--; ALPHA -= 40; End
		frame;
	end
	*/
	
	return true;
	
End

/**
  * @desc	Function that display credits screen
  * @param 	null
  * @return void - no retorno
*/
Function iSCREEN_DisplayBennuGd()
Private
	byte i = 0;
	//int m = 1;
End
Begin
	
	FILE = gameFpg.Identifier;
	GRAPH = 3;
	X = 640/2;
	Y = 480/2;
	//ALPHA = 0;
	
	/*
	for(i=0;i<100;i++)
		if(i == (m * 10)) m++; ALPHA += 40; End
		frame;
	end
	*/
	WaitingUntil(TimeToMiliseconds("5.000"));
	/*
	for(i=100;i>0;i--)
		if(i == (m * 10)) m--; ALPHA -= 40; End
		frame;
	end	
	*/
End

/**
  * @desc	Function that display my own logo in the screen
  * @param 	null
  * @return void - no retorno
*/
Function iSCREEN_DisplayAuthorLogo()
Private
	//int i = 0;
	//int m = 1;
End
Begin

	FILE = gameFpg.Identifier;
	GRAPH = 2;
	X = 640/2;
	Y = 480/2;
	Z = 2;
	//ALPHA = 0;

	frame;
	
	WaitingUntil(TimeToMiliseconds("5.000"));
	
	//iPLAYER_LoadTrack("snd_logo_display.mod");
	
	/*
	if(gi_CurrentSongId != 0)
		PlayTrackUntil(gi_CurrentSongId, -1, 2000);
	end
	
	for(i=0;i<100;i++)
		if(i == (m * 10)) m++; ALPHA += 40; End
		frame;
	end
	*/
	
	//TODO
	//Animate(gameFpg.Identifier, 10, 12, 1, 640/2 + 205, 480/2 - 35, 1, true, 10);
	//Animate(gameFpg.Identifier, 10, 12, 1, 640/2, 480/2 + 50, 1, true, 40);
	//Animate(gameFpg.Identifier, 10, 12, 1, 640/2 - 40, 480/2, 1, true, 60);
	//Animate(gameFpg.Identifier, 10, 12, 1, 640/2 - 250, 480/2 - 33, 1, true, 120);
	//Animate(gameFpg.Identifier, 10, 12, 1, 640/2 + 100, 480/2 + 60, 1, true, 230);
	
	/*
	Waiting(TimeToMiliseconds("6.000"));
				
	Repeat
		frame;
	Until(gi_TimeFinished == 1)
	gi_TimeFinished = -1;
	*/
	
	//UNLOAD_SONG(gi_CurrentSongId);
	
	//iPLAYER_LoadTrack("snd_game_intro_2.mod");

	/*
	if(gi_CurrentSongId != 0)
		PlayTrackUntil(gi_CurrentSongId, -1, 0);
	end
	
	for(i=100;i>0;i--)
		if(i == (m * 10)) m--; ALPHA -= 40; End
		frame;
	end
	*/
	
	return true;
	
OnExit
End

Process iSCREEN_ActionPressStart()
Private
	byte i = 0;
Begin
	
	FILE = gameFpg.Identifier;
	GRAPH = 8;
	X = 640/2;
	Y = 480/2 + 130;
	
	loop
		from i = 0 TO 20 STEP 1;
			frame;
		end

		GRAPH = 8;
		frame;
		
		from i = 0 TO 20 STEP 1;
			frame;
		end
		
		GRAPH = -9999;
		frame;
			
		from i = 0 TO 20 STEP 1;
			frame;
		end
		
		frame; 
	end
OnExit
End

Process iSCREEN_DisplayTxtFeel(FILE, GRAPH, X)
Begin
	
	Z = 3;
	
	Repeat
		Y += 2;
		frame;
	Until(Y >= 450/2 || key(gamePad.PAD_START))
	
	Y = 450/2;
	
	Loop
		frame;
	End
End


Process iSCREEN_ActionSelectOption()
Private
	byte keyDeny = 0;
End
Begin
	
	gb_OptionSelected = false;
	
	FILE = gameFpg.Identifier;
	GRAPH = 10;
	X = 640/2 + 1;
	Y = 640/2 + 10;
	Z = 1;
	
	frame;
	
	if(OPTIONSEL < 0) OPTIONSEL = 0; end

	Loop
		if(gb_OptionSelected == 0)
			Repeat

				If((key(gamePad.PAD_UP)) || (joy_getaxis(gb_PadPort1, 1) JA_UP))
					If(!keyDeny)
						
						keyDeny = true;
						gi_TimeVar = get_timer() + TimeToMiliseconds("20.000");
						
						If(OPTIONSEL != 0)
							Y -= 30;
							OPTIONSEL--;
						End
						
						Switch(OPTIONSEL)
							case 0:
								GRAPH = 10;
							end
							case 1:
								GRAPH = 11;
							end
							case 2:
								GRAPH = 12;
							end
						End
						
					End
				Elseif((key(gamePad.PAD_DOWN)) || (joy_getaxis(gb_PadPort1, 1) JA_DOWN))
					If(!keyDeny)
					
						keyDeny = true;
						gi_TimeVar = get_timer() + TimeToMiliseconds("20.000");
						
						If(OPTIONSEL < 2)
							Y += 30; 
							OPTIONSEL++;
						End
						
						Switch(OPTIONSEL)
							case 0:
								GRAPH = 10;
							end
							case 1:
								GRAPH = 11;
							end
							case 2:
								GRAPH = 12;
							end
						End
					End
				Else
					keyDeny = false;
				end
				
				frame;
			Until(key(gamePad.PAD_START) || key(gamePad.PAD_A))
		
			gb_OptionSelected = 1;
		
			if(OPTIONSEL < 0) OPTIONSEL = 0; end
		End
	
		frame;
	
	End
	
	//if(OPTIONSEL < 0) OPTIONSEL = 0; end
	
OnExit
	//gb_OptionSelected = true;
End

Process displayCasette(FILE, GRAPH, X, Y, Z)
Begin
	Loop
		frame;
	End
End

Function byte iSCREEN_ActionSelectTrack()
Private
	int sId = 0;
	byte keyDeny = 0;
	byte minTrackGraph = 18;
Begin
	
	FILE = gameFpg.Identifier;
	GRAPH = 16;
	X = 640/2;
	Y = 480/2;
	Z = 3;
	
	set_text_color(rgb(0,0,0));
	
	sId = displayCasette(gameFpg.Identifier, 17, 640/2, 480/2, 2);
	
	WaitingUntil(TimeToMiliseconds("0.200"));
	
	//Obtenemos el primer track para mostrarlo por defecto:
	//trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , BTTrackCollection[0]._Name);
	//trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , BTTrackCollection[0]._Author);
	//trackDifficul 	= write(0, 640/2, 480/2 + 60, ALIGN_CENTER , BTTrackCollection[0]._Level);

	frame;
	
	//proc_TrackPlaying = PlayTrack(BTTrackCollection[0]._trackId, -1);
	PlayTrack(gi_MusicTRK01, -1);
	//PlayTrack(BTTrackCollection[0]._trackId, -1);
	
	DisplayTrackName(gameFpg.Identifier, 18, 640/2, 480/2 - 62, 1);
	
	iSCREEN_GoToMainMenu();
	
	Repeat
		If((key(gamePad.PAD_LEFT)) || (joy_getaxis(gb_PadPort1, 0) JA_LEFT))
			If(!keyDeny)
				
				keyDeny = true;
				
				If(!trackNumber <= 0)
				
					trackNumber--;
		
					StopTrack(false);
					
					If(trackName != 0) DELETE_TEXT(trackName); End
					If(trackName != 0) DELETE_TEXT(trackAuthor); End
					If(trackName != 0) DELETE_TEXT(trackDifficul); End
					
					switch(trackNumber)
						case 0:
							trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , "Cool Chiptune");
							trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , "Katie Cadet");
							trackDifficul = write(0, 640/2, 480/2 + 60, ALIGN_CENTER , 1);
							PlayTrack(gi_MusicTRK01, -1);
						end
						case 1:
							trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , "Bit loader");
							trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , "KeiDash");
							trackDifficul = write(0, 640/2, 480/2 + 60, ALIGN_CENTER , 1);
							PlayTrack(gi_MusicTRK02, -1);
						end
					end

					
					//PlayTrack(BTTrackCollection[trackNumber]._trackId, -1);
					
				End
			End
		ElseIf((key(gamePad.PAD_RIGHT)) || (joy_getaxis(gb_PadPort1, 0) JA_RIGHT))
			If(!keyDeny)
				
				keyDeny = true;
				
				If(!trackNumber < NTRACKS)
					If((trackNumber + 1) != NTRACKS) trackNumber++; End
				
					StopTrack(false);				
					
					If(trackName != 0) DELETE_TEXT(trackName); End
					If(trackName != 0) DELETE_TEXT(trackAuthor); End
					If(trackName != 0) DELETE_TEXT(trackDifficul); End
					
					switch(trackNumber)
						case 0:
							trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , "Cool Chiptune");
							trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , "Katie Cadet");
							trackDifficul = write(0, 640/2, 480/2 + 60, ALIGN_CENTER , 1);
							PlayTrack(gi_MusicTRK01, -1);
						end
						case 1:
							trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , "Bit loader");
							trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , "KeiDash");
							trackDifficul = write(0, 640/2, 480/2 + 60, ALIGN_CENTER , 1);
							PlayTrack(gi_MusicTRK02, -1);
						end
					end
					
					//PlayTrack(BTTrackCollection[trackNumber]._trackId, -1);
					
					//If(trackName != 0) DELETE_TEXT(trackName); End
					//If(trackName != 0) DELETE_TEXT(trackAuthor); End
					//If(trackName != 0) DELETE_TEXT(trackDifficul); End
					
					//trackName 		= write(0, 640/2 - 80, 480/2 - 75, ALIGN_CENTER , BTTrackCollection[trackNumber]._Name);
					//trackAuthor 	= write(0, 640/2 + 100, 480/2 - 52, ALIGN_CENTER_RIGHT , BTTrackCollection[trackNumber]._Author);
					//trackDifficul = write(0, 640/2, 480/2 + 60, ALIGN_CENTER , BTTrackCollection[trackNumber]._Level);
				End
			End
		Else
			keyDeny = false;
		End
	
		frame;
	Until(key(gamePad.PAD_A) || key(gamePad.PAD_START) || gb_goToMainMenu == true)

	DELETE_TEXT(ALL_TEXT);
	ScreenChange();
	frame;
	
	SIGNAL(sId.SMALLBRO, S_KILL);
	SIGNAL(sId, S_KILL);
	frame;
	
	return trackNumber;
	
OnExit

End

Process iSCREEN_GoToMainMenu()
Private
Begin
	Repeat
		frame;
	Until(key(gamePad.PAD_B))
	
	gb_goToMainMenu = true;
End

Process DisplayTrackName(FILE, GRAPH, X , Y, Z)
Private
Begin
	loop frame; end
End

Process iSCREEN_DisplayLogo()
Private
End
Begin
	
	FILE = gameFpg.Identifier;
	REGION = 1;
	GRAPH = 6;
	X = 640/2;
	Y = 480/2 - 65;
	Z = 4;
	
	Loop
		frame; 
	End
End

Process iSCREEN_DisplayOptions()
Private
End
Begin
	
	FILE = gameFpg.Identifier;
	REGION = 1;
	GRAPH = 9;
	X = 640/2;
	Y = 480/2 + 120;
	Z = 2;
	
	Loop 
		frame; 
	End
End

Process iSCREEN_DisplayReady()
Private
	//int proc1Id = 0;
	//int proc2Id = 0;
	//int proc3Id = 0;
	//int proc4Id = 0;
	//int i = 0;
Begin
	
	//put_screen(fpg_SCR4_RDY, 1);
	
	//gi_SFX_RDYVoice = iPLAYER_setAlloc(audioPath + "AUReady.wav");
	
	//REPRODUCIMOS LA MÚSICA	
	//PlaySound(gi_SFX_RDYVoice, "", 0, false, true);
	
	//proc1Id = iSCREEN_DisplayReadyItem(fpg_SCR4_RDY, 3, 0, 480/2 - 25, 640/2 - 35, 3, 1, 0, 255);
	//proc2Id = iSCREEN_DisplayReadyItem(fpg_SCR4_RDY, 4, 640, 480/2 + 6, 640/2 - 26, 4, 0, 1, 255);
	//proc3Id = iSCREEN_DisplayReadyItem(fpg_SCR4_RDY, 5, 640, 480/2, 640/2 + 100, 5, 1, 0, 255);
	//proc4Id = iSCREEN_DisplayReadyItem(fpg_SCR4_RDY, 2, 640, 480/2, 640/2, 6, 1, 0, 255);
	
	Loop
		frame;
	End
	
	/*Waiting(TimeToMiliseconds("2.500"));
	Repeat
		frame;
	Until(gi_TimeFinished == 1)
	
	gi_TimeFinished = 0;
	
	iSCREEN_DisplayFlash(fpg_SCR4_RDY, 640/2, 480/2, 1, 90);
	
	if(proc1Id != 0) SIGNAL(proc1Id, S_KILL); end
	if(proc2Id != 0) SIGNAL(proc2Id, S_KILL); end
	if(proc3Id != 0) SIGNAL(proc3Id, S_KILL); end
	if(proc4Id != 0) SIGNAL(proc4Id, S_KILL); end*/
	
End

Process iSCREEN_DisplayReadyItem(FILE, GRAPH, X ,Y, int toX, Z, byte fromLeft, byte fromRight, ALPHA)
Begin
	
	Repeat
		if(fromLeft)
			If(X == (640/2 - 70)) X++; else X+=10; end
		elseif(fromRight)
			If(X == (640/2 - 70)) X--; else X-=10; end
		end
		
		frame;
	Until(fromLeft ? X >= toX : x <= toX)
	
	X = toX;
	
	Loop
		frame;
	End
End

Process iSCREEN_DisplayFlash(X, Y, Z)
Private
	byte i = 1;
Begin
	
	//FILE = fpg_SCR4_RDY;
	GRAPH = 6;
	ALPHA = 90;
	
	Repeat
		if(isDivisible(i, 3)) GRAPH += 1; end
		i++;
		frame;
	Until(GRAPH == 9)
	
	/*Repeat
		Waiting(TimeToMiliseconds("0.050"));
		
		Repeat
			frame;
		Until(gi_TimeFinished == 1)
		
		gi_TimeFinished = 0;
		
		//WaitSeconds(TimeToMiliseconds("0.050"));
		
		GRAPH += 1;
		frame;
	Until(GRAPH == 9)*/
	
	
	GRAPH = 10;
	X = 640/2;
	Y = 480/2;
	ALPHA = 10;
	

	//REPRODUCIMOS LA MÚSICA
	//PlaySound(gi_SFX_Next, "", 0, false, true);
	
	/*Switch(os_id)
		case 0: //iPlayerPC.prg
			PlaySound(gi_SFX_Next, "", 0, false, true);
		end
		case 5: //iPlayerDC.prg
			PlaySound(0, gi_dc_SFX_Next, 0, 0, false);
		end
	End*/
	
	Repeat
		ALPHA += 10;
		frame;
	Until(ALPHA >= 255)
	
	/*frame;
	Waiting(TimeToMiliseconds("4.000"));
	Repeat
		frame;
	Until(gi_TimeFinished == 1)
	
	gi_TimeFinished = 0;
	
	loop
		frame;
	end*/
	
	gi_GameLoadFinished = 1;
	
OnExit
	
End