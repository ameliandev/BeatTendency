//Autor: 		Adrian Melian (KeiDash)
//Date:  		25/03/2018
//Description: 	Include Game system config. Contiene todos los métodos de parámetros de configuración clave del programa.


/**
  * @desc	Función que se encarga de ejecutar todas las funciones, de carga de elementos del juego. (Pantalla, GamePad, 
			ficheros FPG, etc.)
  * @param 	null
  * @return void - no retorno
*/
Function CONFIG_setConfiguration()
Begin
	setPaths();
	set_MainFPGFiles();
	gi_PROC_Loading = displayLoading();
	setScreenConfig();
	setGamePadConfig();
	
	set_Sounds();
	//iTRACK_setTracksCollection();
	//set_TracksData(); 	//*
	//set_TrackChords();	//*
	SIGNAL(gi_PROC_Loading, S_SLEEP);
End


/**
  * @desc	Función que establece las rutas de acceso a los ficheros
			segun el S.O (os_id)
  * @param 	null
  * @return void - no retorno
*/
Function setPaths()
Begin
	
	switch(os_id)
		case 0:
			graphPath 	= "files/graphs/";
			audioPath 	= "files/audio/";
			fontPath 	= "files/fonts/";
			sfxPath 	= "files/sfx/";
		end
		case 5:
			graphPath 	= "/cd/files/graphs/";
			audioPath 	= "/cd/files/audio/";
			sfxPath 	= "/cd/files/sfx/";
			fontPath 	= "/cd/files/fonts/";
		end
		default:
			graphPath = graphPath;
		end
	End
End


/**
  * @desc	Función que carga los ficheros FPG de assets gráficos necesarios para el juego
  * @param 	null
  * @return void - no retorno
*/
Function set_MainFPGFiles()
Begin
	gameFpg.Identifier 	= LOAD_FPG(graphPath + "assets.fpg");
	gameFpg.Pal			= LOAD_PAL(graphPath + "assets.fpg");
	
	//set_FPG("assets.fpg", 0);
	//set_FPG("screen3.fpg", 0);
	//set_FPG("screen4.fpg", 1);
End


/**
  * @desc	Función encargada de añadir ficheros fpg a la memoria. A demás, carga la paleta de colores
			asociada.
  * @param 	string $fpgFileName - Nombre del fichero físico
			byte $indice - Índice del array de fpg's
  * @return void - no retorno
  * @notas	Esta función deberá cambiar cuando sea un único fichero FPG para todo el juego.
*/
Function set_FPG(string fpgFileName, byte indice)
Private
Begin

	//fpg_Main = 0;
	/*
	if(gi_pal != 0)
		if (PAL_DEL(gi_pal) == 1)
			palUnloaded = true;
		end
	else
		palUnloaded = true;
	end
	
	if (!palUnloaded) return; end
	*/
	
	//gameFpgs[indice].Identifier 	= LOAD_FPG(graphPath + fpgFileName);

	//gameFpgs[indice].Pal			= graphPath + fpgFileName;
	
End


/**
  * @desc	Función encargada de cargar la paleta de colores asociada al FPG
  * @param 	byte $indice - Índice del array de fpg's
  * @return void - no retorno
  * @notas	Esta función deberá cambiar cuando sea un único fichero FPG para todo el juego.
*/
Function get_FPG(byte indice)
Private
Begin
	//PAL_REFRESH(gameFpgs[indice].PalId);
	//LOAD_PAL(gameFpgs[indice].PalId);
	
	/*if(!gameFpgs[indice].PalLoaded)
		gameFpgs[indice].PalLoaded = true;
	end*/
	
	//return gameFpgs[indice].Identifier;
End


/**
  * @desc	Función que establece la configutacion de pantalla (resolucion, colores, etc)
  * @param 	null
  * @return void - no retorno
*/
Function setScreenConfig()
Begin
	
    define_region(1, 0, 0, 640, 480);
	set_mode(640,480, MODE_8BITS);
	set_fps(60, 1);	
	//If(os_Id == 0) set_title("BeatTendency"); End
End


/**
  * @desc	Proceso que muestra en pantalla el mensaje de 'loading' a modo informativo.
  * @param 	null
  * @return void - no retorno
*/
Process displayLoading()
Private
Begin
	FILE = gameFpg.Identifier;
	GRAPH = 13;
	X = 640 - 150;
	Y = 480 - 80;
	Z = 1;
	
	Loop
		frame;
	End

End

//#FUNCIONES EXTERNAS------------------------------------------------------

Function set_Sounds()
Begin
	iPLAYER_set_BasicSounds();
End

Function setGamePadConfig()
Begin
	iPAD_setPadConfig();
End

Function set_TracksData()
Begin
	iTRACK_setTracksCollection();
End

Function set_TrackChords()
Begin
	iTRACK_setTrackDemo();
End