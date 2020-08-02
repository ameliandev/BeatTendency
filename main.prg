import "mod_video"
import "mod_screen";
import "mod_text"
import "mod_math"
import "mod_rand"
import "mod_key"
import "mod_joy"
import "mod_string"
import "mod_proc"
import "mod_say"
import "mod_map"
import "mod_mem"
import "mod_time"
import "mod_regex"
import "mod_sound"		//musica wav, mp3, .mod
//import "mod_file"
//import "mod_cd"
//import "mod_vlc"
//import "mod_ttf"
//import "mod_timers"
//import "mod_wm"
//import "mod_dream" 	//musica ogg, cdda

include "iVar.prg"
include "iTime.prg"
include "iConfiguration.prg"
include "iScreens.prg"
include "iPad.prg"
include "iTrack.prg"
include "iPoints.prg"
include "iPower.prg"
include "iGame.prg"
include "iPlayerDC.prg"

include "track01.prg"

//include "iMath.prg"
//include "iOptions.prg"
//include "iUtils.prg"
//include "iDebug.prg"



/**
  * @desc	Proceso principal del juego, encargado de lanzar el resto de procesos
  * @param 	null
  * @return void - no retorno
*/
Process Main()
Begin

	//If(os_id == 5) say("LANG: " + DC_FLASHLANG()); end
	If(os_id == 0) CloseGame(); End
	
	CONFIG_setConfiguration();
	
	RAMShowFree();
	
	//LA DURACUÓN DE LA MUSICA PARA LA INTRO ES DE 15seg
	iSCREEN_DisplayIntro();
	
	btnStartPressed = false;
	
	//RunGame(0);
	
	iSCREEN_displayMainMenu();
	
	loop frame; end
	
	Repeat
		frame;
	Until(SON.ID != 0)
	
	DemoLaunch(SON.ID);

	Loop
		frame;
	End
	
End

/**
  * @desc	Muestra la cantidad de RAM libre en en sistema.
  * @param 	null
  * @return void - no retorno
*/
Process RAMShowFree()
Private
Begin
	if(DEBUG)
		p_sMemFree = format(memory_free()) + " bytes";
		write(0, 640/2 - 20, 480 - 20, ALIGN_TOP_RIGHT, "RAM Free:");
		write_var(0, 640/2 + 120, 480 - 20, ALIGN_TOP_RIGHT, p_sMemFree);
		frame;
	end
End

Process DemoLaunch(int demoId)
Begin

	Demo(demoId);
	
	Repeat
		frame;
	Until(btnStartPressed == 1)
	
	if(ID.SON >= 0)
		SIGNAL(ID.SON, S_KILL_TREE);
	end
	
End

/**
  * @desc	Process that throw the demo if the user don't push any button
			in a specified time. 
  * @param 	int $screenId - Identificador de la pantalla de menu principal
  * @return void - no retorno
*/
Process Demo(int screenId)
Private
	int proc_DemoText 	= 0;
Begin
	
	frame;
	
	proc_DemoText = DisplayDemoText(gameFpg.Identifier, 640/2, 480/2);
	
	if(EXISTS(proc_DemoText)) SIGNAL(proc_DemoText, S_SLEEP);	end
	
	demoIsrunning = false;
	
	Repeat
		if (!demoIsrunning)
			
			DemoWaiting();
			
			if(!btnStartPressed)
			
				demoIsrunning = true;
				
				DemoLoad(screenId);

				DemoRun(proc_DemoText);

				DemoUnload(screenId, proc_DemoText);

				demoIsrunning = false;
				
				frame;
			end
		End
		
		frame;

	Until(btnStartPressed == 1)
	
	if(EXISTS(proc_DemoText)) SIGNAL(proc_DemoText, S_KILL);	end
OnExit
End

/**
  * @desc	Function that set the minimum waiting time (in seconds) 
			that the demo will be display. While this function is running, 
			the process still waiting without continue the loop.
  * @param 	null
  * @return void - no retorno
*/
Function DemoWaiting()
Private
Begin

	gi_TimeVar = get_timer() + TimeToMiliseconds("60.000");
	
	WaitingVar();
	Repeat
		frame;
	Until(gi_TimeVarFinished == 1)
	gi_TimeVarFinished = -1;
End

/**
  * @desc	Prepares the menu proccess to be asleep
  * @param 	int $prcMenu - Menu screen identifier
  * @return void - no retorno
*/
Function DemoLoad(int prcMenu)
Begin
	if(EXISTS(prcMenu)) SIGNAL(prcMenu, S_SLEEP_TREE); end
	ScreenChange();
End

/**
  * @desc	Prepares and run the game processes to be awakened
  * @param 	int $prcDemoText - Demo text process identifier
  * @return void - no retorno
*/
Function DemoRun(int prcDemoText)
Begin

	//rndTrack = RAND(0,9);
	if(EXISTS(prcDemoText)) SIGNAL(prcDemoText, S_WAKEUP); end
	
	StopTrack(true);
	//Añadimos una espera de un segundo para que si se reproduce otra 
	//canción seguidamente, no sea un cambio brusco
	WaitingUntil(TimeToMiliseconds("6.000"));
	
	gi_PROC_Game = RunGame(0);
	WaitingUntilKey(TimeToMiliseconds("40.000"), gamePad.PAD_START);
End

/**
  * @desc	Sleep the game processes and run the menu process again.
  * @param 	int $prcMenu - Menu process identifier
  *			int $prcDemoText - Demo text process identifier
  * @return void - no retorno
*/
Function DemoUnload(int prcMenu, int prcDemoText)
Begin
	StopTrack(true);
	
	//Añadimos una espera de un segundo para que si se reproduce otra 
	//canción seguidamente, no sea un cambio brusco
	WaitingUntil(TimeToMiliseconds("6.000"));
	
	PlayTrack(gi_MusicIntroId, -1);
	
	if(EXISTS(prcDemoText)) SIGNAL(prcDemoText, S_SLEEP); end
	if(EXISTS(gi_PROC_Game)) SIGNAL(gi_PROC_Game, S_KILL_TREE); end

	ScreenChange();
	
	if(EXISTS(prcMenu)) SIGNAL(prcMenu, S_WAKEUP_TREE); end
End


/**
  * @desc	Muestra el texto 'DEMO' parpadeando mientras la demo se está ejecutando.
  * @param 	int $FILE - Identificador del fichero de gráficos
			int $GRAPH - Número de gráfico a mostrar del $FILE
			int $X - Posición X del $GRAPH
			int $Y - Posición Y del $GRAPH
  * @return void - no retorno
*/
Process DisplayDemoText(FILE, X, Y)
Begin

	GRAPH = 14;
	Z = 1;
	
	Repeat
		if(demoIsrunning)
			
			WaitingUntil(TimeToMiliseconds("0.050"));
			
			GRAPH = 14;
			frame;
			
			WaitingUntil(TimeToMiliseconds("1.000"));
			
			GRAPH = -9999;
			frame;
			
			WaitingUntil(TimeToMiliseconds("1.000"));
		else
			GRAPH = -9999;
			frame;
		end
		
		frame;
	Until(btnStartPressed)	
OnExit
End

/**
  * @desc	Se encarga de cerrar el juego en PC, caso de que el usuario pulse Escape
  * @param 	null
  * @return void - no retorno
*/
Process CloseGame()
Begin
	
	Repeat
		frame;
	Until(key(_ESC))
	
	exit();
OnExit
End
