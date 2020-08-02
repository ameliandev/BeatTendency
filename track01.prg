Function setData()
Private
Begin
	tName 			= "Cool Chiptune";
	tAuthor 		= "Katie Cadet";
	tLevel 			= 1;
	tTiempoFreeze	= 0;
	tTiempoEspera 	= TimeToMiliseconds("6.130");
	tTrackId 		= gi_MusicTRK01;
	
	//say("NOMBRE: " 	+ tName);
	//say("AUTOR: " 	+ tAuthor);
	//say("NIVEL: " 	+ tLevel);
	//say("Notas: " 		+ tTotalChords);
	//say("ID: " 	+ tTrackId);
End

Function setTotalChords()
Private
Begin
	tTotalChords = NELEMS(TrackArray);
End

Function setChordsParameters()
Private
	int i = 0;
Begin
	//ESTABLECEMOS EL TIEMPO MINIMO DE CONGELACION
	set_FreezingTime(0);
	say("Tiempo Freeze: " 	+ tTiempoFreeze);
	
	//ESTABLECEMOS LOS FREEZE
	iTRACK_setSleeps(0);
	/*for(i = 0; i < tTotalChords; i++)
		say("Nota: " + i + " congelada: " + TrackArray[i][_FREEZE]);
		say("Nota: " + i + " porcentaje hijo: " + TrackArray[i][_SONTHROWEDP]);
		
		frame;
	end*/
	
	//OBTENEMOS LOS ID's DE TODOS LOS PROCESOS
	iTRACK_linkFatherProcIds(0);
	/*for(i = 0; i < tTotalChords; i++)
		say("Nota: " + i + " ID PADRE: " + TrackArray[i][_FATHER]);		
		frame;
	end*/


	//ASOCIAMOS HIJOS CON PADRES
	iTRACK_linkSonsToFathers(0);
	for(i = 0; i < tTotalChords; i++)
		say("Nota: " + i + " ID HIJO: " + TrackArray[i][_SON]);		
		frame;
	end
	
End

Function set_Track_01()
Private
	int espera = 0;
Begin

	setData();
	
	/*
	TrackArray[0][_TIEMPO] 		= TIEMPO PROPIO DE INICO DE LA NOTA + TIEMPO DE CARGA DE LA PARTIDA;
	TrackArray[0][_NOTA] 		= NOTA QUE REPRESENTA
	TrackArray[0][_FREEZE] 		= INDICA SI SE CONGELA O NO
	TrackArray[0][_LAST] 		= INDICA SI ES LA ÚLTIMA NOTA PARA TERMINAR LA CANCIÓN
	TrackArray[0][_FATHER] 		= INDICA EL ID DEL PADRE
	TrackArray[0][_SON] 		= INDICA EL ID DEL HIJO
	TrackArray[0][_SONTHROWED] 	= INDICA SI EL HIJO YA HA SIDO LANZADO
	TrackArray[0][_SONTHROWEDP]	= INDICA EL PORCENTAJE DONDE DEBE MOSTRARSE EL HIJO
	TrackArray[0][_SPEED] 		= VELOCIDAD DE LA NOTA
	*/
	
	//NOTAS:
	
	// -> Nota 1
	TrackArray[0][_TIEMPO] 		= TimeToMiliseconds("2.440") + tTiempoEspera;
	TrackArray[0][_NOTA] 		= gamePad.PAD_A;
	TrackArray[0][_SPEED] 		= 2;
	
	TrackArray[1][_TIEMPO] 		= TimeToMiliseconds("4.280") + tTiempoEspera;
	TrackArray[1][_NOTA] 		= gamePad.PAD_R;
	TrackArray[1][_SPEED] 		= 2;
	
	TrackArray[2][_TIEMPO] 		= TimeToMiliseconds("6.127") + tTiempoEspera;
	TrackArray[2][_NOTA] 		= gamePad.PAD_B;
	TrackArray[2][_SPEED] 		= 2;
	
	TrackArray[3][_TIEMPO] 		= TimeToMiliseconds("8.972") + tTiempoEspera;
	TrackArray[3][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[3][_SPEED] 		= 2;
	
	TrackArray[4][_TIEMPO] 		= TimeToMiliseconds("10.805") + tTiempoEspera;
	TrackArray[4][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[4][_SPEED] 		= 2;
	
	TrackArray[5][_TIEMPO] 		= TimeToMiliseconds("12.634") + tTiempoEspera;
	TrackArray[5][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[5][_SPEED] 		= 2;
	
	TrackArray[6][_TIEMPO] 		= TimeToMiliseconds("14.510") + tTiempoEspera;
	TrackArray[6][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[6][_SPEED] 		= 2;
	
	TrackArray[7][_TIEMPO] 		= TimeToMiliseconds("20.357") + tTiempoEspera;
	TrackArray[7][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[7][_SPEED] 		= 2;
	
	TrackArray[8][_TIEMPO] 		= TimeToMiliseconds("22.178") + tTiempoEspera;
	TrackArray[8][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[8][_SPEED] 		= 2;
	
	TrackArray[9][_TIEMPO] 		= TimeToMiliseconds("24.008") + tTiempoEspera;
	TrackArray[9][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[9][_SPEED] 		= 2;
	
	TrackArray[9][_TIEMPO] 		= TimeToMiliseconds("24.488") + tTiempoEspera;
	TrackArray[9][_NOTA] 		= gamePad.PAD_LEFT;
	TrackArray[9][_SPEED] 		= 2;
	
	TrackArray[10][_TIEMPO] 	= TimeToMiliseconds("27.008") + tTiempoEspera;
	TrackArray[10][_NOTA] 		= gamePad.PAD_R;
	TrackArray[10][_SPEED] 		= 2;
	
	TrackArray[11][_TIEMPO] 	= TimeToMiliseconds("28.108") + tTiempoEspera;
	TrackArray[11][_NOTA] 		= gamePad.PAD_B;
	TrackArray[11][_SPEED] 		= 2;
	
	TrackArray[12][_TIEMPO] 	= TimeToMiliseconds("34.518") + tTiempoEspera;
	TrackArray[12][_NOTA] 		= gamePad.PAD_A;
	TrackArray[12][_SPEED] 		= 2;
	
	
	/*

	//return "46,2.440:" + PAD_LEFT + ":0:0:0:0:0,4.280:" + PAD_LEFT + ":0:0:0:0:0,6.127:" + PAD_LEFT + ":0:0:0:0:0,8.972:" + PAD_LEFT + ":0:0:0:0:0,10.805:" + PAD_LEFT + ":0:0:0:0:0,12.634:" + PAD_LEFT + ":0:0:0:0:0,
	//14.510:" + PAD_LEFT + ":0:0:0:0:0,20.357:" + PAD_LEFT + ":0:0:0:0:0,22.178:" + PAD_LEFT + ":0:0:0:0:0,
	//24.008:" + PAD_LEFT + ":0:0:0:0:0,24.488:" + PAD_RIGHT + ":0:0:0:0:0,25.170:" + PAD_A + ":0:0:0:0:0,25.397:" + PAD_B + ":0:0:0:0:0,25.824:" + PAD_LEFT + ":0:0:0:0:0,27.640:" + PAD_LEFT + ":0:0:0:0:0,29.480:" + PAD_LEFT + ":0:0:0:0:0,29.932:" + PAD_RIGHT + ":0:0:0:0:0,36.768:" + PAD_R + ":0:0:0:0:0,38.646:" + PAD_R + ":0:0:0:0:0,40.475:" + PAD_R + ":0:0:0:0:0,38.152:" + PAD_DOWN + ":0:0:0:0:0,40.000:" + PAD_DOWN + ":0:0:0:0:0,41.844:" + PAD_DOWN + ":0:0:0:0:0,42.232:" + PAD_LEFT + ":0:0:0:0:0,42.361:" + PAD_A + ":0:0:0:0:0,42.658:" + PAD_LEFT + ":0:0:0:0:0,42.796:" + PAD_A + ":0:0:0:0:0,43.093:" + PAD_LEFT + ":0:0:0:0:0,43.255:" + PAD_A + ":0:0:0:0:0,44.700:" + PAD_LEFT + ":0:0:0:0:0,44.830:" + PAD_A + ":0:0:0:0:0,44.930:" + PAD_DOWN + ":0:0:0:0:0,45.030:" + PAD_B + ":0:0:0:0:0,46.300:" + PAD_LEFT + ":0:0:0:0:0,46.430:" + PAD_A + ":0:0:0:0:0,46.530:" + PAD_DOWN + ":0:0:0:0:0,46.630:" + PAD_B + ":0:0:0:0:0,47.080:" + PAD_R + ":0:0:0:0:0,51.810:" + PAD_LEFT + ":0:0:0:0:0,51.940:" + PAD_A + ":0:0:0:0:0,52.070:" + PAD_DOWN + ":0:0:0:0:0,52.200:" + PAD_B + ":0:0:0:0:0,53.590:" + PAD_LEFT + ":0:0:0:0:0,53.720:" + PAD_A + ":0:0:0:0:0,53.850:" + PAD_DOWN + ":0:0:0:0:0,53.980:" + PAD_B + ":0:1:0:0:0";
	
	
	/*
	espera = TimeToMiliseconds(T_ESPERA);
	
	arrTRACK[0].mscName = "Mystic";
	
	arrTRACK[0].aNotas[0][0] = TimeToMiliseconds("7.440") - espera;
	arrTRACK[0].aNotas[0][1] = PAD_LEFT;
	//BT_track01[0]._Tiempo = TimeToMiliseconds("7.440") - espera;
	//BT_track01[0]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[1][0] = TimeToMiliseconds("9.280") - espera;
	arrTRACK[0].aNotas[1][1] = PAD_LEFT;
	//BT_track01[1]._Tiempo = TimeToMiliseconds("9.280") - espera;
	//BT_track01[1]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[2][0] = TimeToMiliseconds("11.127") - espera;
	arrTRACK[0].aNotas[2][1] = PAD_LEFT;
	//BT_track01[2]._Tiempo = TimeToMiliseconds("11.127") - espera;
	//BT_track01[2]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[3][0] = TimeToMiliseconds("12.972") - espera;
	arrTRACK[0].aNotas[3][1] = PAD_LEFT;
	//BT_track01[3]._Tiempo = TimeToMiliseconds("12.972") - espera;
	//BT_track01[3]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[4][0] = TimeToMiliseconds("14.805") - espera;
	arrTRACK[0].aNotas[4][1] = PAD_LEFT;
	//BT_track01[4]._Tiempo = TimeToMiliseconds("14.805") - espera;
	//BT_track01[4]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[5][0] = TimeToMiliseconds("16.634") - espera;
	arrTRACK[0].aNotas[5][1] = PAD_LEFT;
	//BT_track01[5]._Tiempo = TimeToMiliseconds("16.634") - espera;
	//BT_track01[5]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[6][0] = TimeToMiliseconds("18.510") - espera;
	arrTRACK[0].aNotas[6][1] = PAD_LEFT;
	//BT_track01[6]._Tiempo = TimeToMiliseconds("18.510") - espera;
	//BT_track01[6]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[7][0] = TimeToMiliseconds("20.357") - espera;
	arrTRACK[0].aNotas[7][1] = PAD_LEFT;
	//BT_track01[7]._Tiempo = TimeToMiliseconds("20.357") - espera;
	//BT_track01[7]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[8][0] = TimeToMiliseconds("22.178") - espera;
	arrTRACK[0].aNotas[8][1] = PAD_LEFT;
	//BT_track01[8]._Tiempo = TimeToMiliseconds("22.178") - espera;
	//BT_track01[8]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[9][0] = TimeToMiliseconds("24.008") - espera;
	arrTRACK[0].aNotas[9][1] = PAD_LEFT;
	//BT_track01[9]._Tiempo = TimeToMiliseconds("24.008") - espera;
	//BT_track01[9]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[10][0] = TimeToMiliseconds("24.488") - espera;
	arrTRACK[0].aNotas[10][1] = PAD_RIGHT;
	//BT_track01[10]._Tiempo = TimeToMiliseconds("24.488") - espera;
	//BT_track01[10]._Nota = PAD_RIGHT;
	
	arrTRACK[0].aNotas[11][0] = TimeToMiliseconds("25.170") - espera;
	arrTRACK[0].aNotas[11][1] = PAD_A;
	//BT_track01[11]._Tiempo = TimeToMiliseconds("25.170") - espera;
	//BT_track01[11]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[12][0] = TimeToMiliseconds("25.397") - espera;
	arrTRACK[0].aNotas[12][1] = PAD_B;
	//BT_track01[12]._Tiempo = TimeToMiliseconds("25.397") - espera;
	//BT_track01[12]._Nota = PAD_B;
	
	arrTRACK[0].aNotas[13][0] = TimeToMiliseconds("25.824") - espera;
	arrTRACK[0].aNotas[13][1] = PAD_LEFT;
	//BT_track01[13]._Tiempo = TimeToMiliseconds("25.824") - espera;
	//BT_track01[13]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[14][0] = TimeToMiliseconds("27.640") - espera;
	arrTRACK[0].aNotas[14][1] = PAD_LEFT;
	//BT_track01[14]._Tiempo = TimeToMiliseconds("27.640") - espera;
	//BT_track01[14]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[15][0] = TimeToMiliseconds("29.480") - espera;
	arrTRACK[0].aNotas[15][1] = PAD_LEFT;
	//BT_track01[15]._Tiempo = TimeToMiliseconds("29.480") - espera;
	//BT_track01[15]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[16][0] = TimeToMiliseconds("29.932") - espera;
	arrTRACK[0].aNotas[16][1] = PAD_RIGHT;
	//BT_track01[16]._Tiempo = TimeToMiliseconds("29.932") - espera;
	//BT_track01[16]._Nota = PAD_RIGHT;
	
	arrTRACK[0].aNotas[17][0] = TimeToMiliseconds("36.768") - espera;
	arrTRACK[0].aNotas[17][1] = PAD_R;
	//BT_track01[17]._Tiempo = TimeToMiliseconds("36.768") - espera;
	//BT_track01[17]._Nota = PAD_R;
	
	arrTRACK[0].aNotas[18][0] = TimeToMiliseconds("38.646") - espera;
	arrTRACK[0].aNotas[18][1] = PAD_R;
	//BT_track01[18]._Tiempo = TimeToMiliseconds("38.646") - espera;
	//BT_track01[18]._Nota = PAD_R;

	arrTRACK[0].aNotas[19][0] = TimeToMiliseconds("40.475") - espera;
	arrTRACK[0].aNotas[19][1] = PAD_R;
	//BT_track01[19]._Tiempo = TimeToMiliseconds("40.475") - espera;
	//BT_track01[19]._Nota = PAD_R;
	
	arrTRACK[0].aNotas[20][0] = TimeToMiliseconds("38.152") - espera;
	arrTRACK[0].aNotas[20][1] = PAD_DOWN;
	//BT_track01[20]._Tiempo = TimeToMiliseconds("38.152") - espera;
	//BT_track01[20]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[21][0] = TimeToMiliseconds("40.000") - espera;
	arrTRACK[0].aNotas[21][1] = PAD_DOWN;
	//BT_track01[21]._Tiempo = TimeToMiliseconds("40.000") - espera;
	//BT_track01[21]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[22][0] = TimeToMiliseconds("41.844") - espera;
	arrTRACK[0].aNotas[22][1] = PAD_DOWN;
	//BT_track01[22]._Tiempo = TimeToMiliseconds("41.844") - espera;
	//BT_track01[22]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[23][0] = TimeToMiliseconds("42.232") - espera;
	arrTRACK[0].aNotas[23][1] = PAD_LEFT;
	//BT_track01[23]._Tiempo = TimeToMiliseconds("42.232") - espera;
	//BT_track01[23]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[24][0] = TimeToMiliseconds("42.361") - espera;
	arrTRACK[0].aNotas[24][1] = PAD_A;
	//BT_track01[24]._Tiempo = TimeToMiliseconds("42.361") - espera;
	//BT_track01[24]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[25][0] = TimeToMiliseconds("42.658") - espera;
	arrTRACK[0].aNotas[25][1] = PAD_LEFT;
	//BT_track01[25]._Tiempo = TimeToMiliseconds("42.658") - espera;
	//BT_track01[25]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[26][0] = TimeToMiliseconds("42.796") - espera;
	arrTRACK[0].aNotas[26][1] = PAD_A;
	//BT_track01[26]._Tiempo = TimeToMiliseconds("42.796") - espera;
	//BT_track01[26]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[27][0] = TimeToMiliseconds("43.093") - espera;
	arrTRACK[0].aNotas[27][1] = PAD_LEFT;
	//BT_track01[27]._Tiempo = TimeToMiliseconds("43.093") - espera;
	//BT_track01[27]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[28][0] = TimeToMiliseconds("43.225") - espera;
	arrTRACK[0].aNotas[28][1] = PAD_A;
	//BT_track01[28]._Tiempo = TimeToMiliseconds("43.225") - espera;
	//BT_track01[28]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[29][0] = TimeToMiliseconds("44.700") - espera;
	arrTRACK[0].aNotas[29][1] = PAD_LEFT;
	//BT_track01[29]._Tiempo = TimeToMiliseconds("44.700") - espera;
	//BT_track01[29]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[30][0] = TimeToMiliseconds("44.830") - espera;
	arrTRACK[0].aNotas[30][1] = PAD_A;
	//BT_track01[30]._Tiempo = TimeToMiliseconds("44.830") - espera;
	//BT_track01[30]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[31][0] = TimeToMiliseconds("44.930") - espera;
	arrTRACK[0].aNotas[31][1] = PAD_DOWN;
	//BT_track01[31]._Tiempo = TimeToMiliseconds("44.930") - espera;
	//BT_track01[31]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[32][0] = TimeToMiliseconds("45.030") - espera;
	arrTRACK[0].aNotas[32][1] = PAD_B;
	//BT_track01[32]._Tiempo = TimeToMiliseconds("45.030") - espera;
	//BT_track01[32]._Nota = PAD_B;
	
	arrTRACK[0].aNotas[33][0] = TimeToMiliseconds("46.300") - espera;
	arrTRACK[0].aNotas[33][1] = PAD_LEFT;
	//BT_track01[33]._Tiempo = TimeToMiliseconds("46.300") - espera;
	//BT_track01[33]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[34][0] = TimeToMiliseconds("46.430") - espera;
	arrTRACK[0].aNotas[34][1] = PAD_A;
	//BT_track01[34]._Tiempo = TimeToMiliseconds("46.430") - espera;
	//BT_track01[34]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[35][0] = TimeToMiliseconds("46.530") - espera;
	arrTRACK[0].aNotas[35][1] = PAD_DOWN;
	//BT_track01[35]._Tiempo = TimeToMiliseconds("46.530") - espera;
	//BT_track01[35]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[36][0] = TimeToMiliseconds("46.630") - espera;
	arrTRACK[0].aNotas[36][1] = PAD_B;
	//BT_track01[36]._Tiempo = TimeToMiliseconds("46.630") - espera;
	//BT_track01[36]._Nota = PAD_B;
	
	arrTRACK[0].aNotas[37][0] = TimeToMiliseconds("47.080") - espera;
	arrTRACK[0].aNotas[37][1] = PAD_R;
	//BT_track01[37]._Tiempo = TimeToMiliseconds("47.080") - espera;
	//BT_track01[37]._Nota = PAD_R;
	
	arrTRACK[0].aNotas[38][0] = TimeToMiliseconds("51.810") - espera;
	arrTRACK[0].aNotas[38][1] = PAD_LEFT;
	//BT_track01[38]._Tiempo = TimeToMiliseconds("51.810") - espera;
	//BT_track01[38]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[39][0] = TimeToMiliseconds("51.940") - espera;
	arrTRACK[0].aNotas[39][1] = PAD_A;
	//BT_track01[39]._Tiempo = TimeToMiliseconds("51.940") - espera;
	//BT_track01[39]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[40][0] = TimeToMiliseconds("52.070") - espera;
	arrTRACK[0].aNotas[40][1] = PAD_DOWN;
	//BT_track01[40]._Tiempo = TimeToMiliseconds("52.070") - espera;
	//BT_track01[40]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[41][0] = TimeToMiliseconds("52.200") - espera;
	arrTRACK[0].aNotas[41][1] = PAD_B;
	//BT_track01[41]._Tiempo = TimeToMiliseconds("52.200") - espera;
	//BT_track01[41]._Nota = PAD_B;
	
	arrTRACK[0].aNotas[42][0] = TimeToMiliseconds("53.590") - espera;
	arrTRACK[0].aNotas[42][1] = PAD_LEFT;
	//BT_track01[42]._Tiempo = TimeToMiliseconds("53.590") - espera;
	//BT_track01[42]._Nota = PAD_LEFT;
	
	arrTRACK[0].aNotas[43][0] = TimeToMiliseconds("53.720") - espera;
	arrTRACK[0].aNotas[43][1] = PAD_A;
	//BT_track01[43]._Tiempo = TimeToMiliseconds("53.720") - espera;
	//BT_track01[43]._Nota = PAD_A;
	
	arrTRACK[0].aNotas[44][0] = TimeToMiliseconds("53.850") - espera;
	arrTRACK[0].aNotas[44][1] = PAD_DOWN;
	//BT_track01[44]._Tiempo = TimeToMiliseconds("53.850") - espera;
	//BT_track01[44]._Nota = PAD_DOWN;
	
	arrTRACK[0].aNotas[45][0] = TimeToMiliseconds("53.980") - espera;
	arrTRACK[0].aNotas[45][1] = PAD_B;
	arrTRACK[0].aNotas[45][arrTRACK[0].Ids._Last] = 1;
	//BT_track01[45]._Tiempo = TimeToMiliseconds("53.980") - espera;
	//BT_track01[45]._Nota = PAD_B;
	//BT_track01[45]._Last = 1;
	*/
	
	OnExit
		setTotalChords();
		setChordsParameters();
End
