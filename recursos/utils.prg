//Clase de utilidades y de código para reciclar

/*PARA HACER PARPADEAR UN TEXTO------------------------------------------------------------------------*/
p_iPSID = write(0, 640/2, 480/2 + 150, 4 , "PRESS START");
		
For(ind = 0; ind < 20; ind = ind + 1)
	Switch(os_id) //if(key(_ENTER) || key(PAD_A)) break; end
		case 0:
			if(key(_ENTER)) break; end
		end
		case 5:
			if(joy_getbutton(gb_PadPort1, PAD_A)) break; end
		end
	End
		
	frame;
End

if(p_iPSID != 0) delete_text(p_iPSID); end

For(ind = 0; ind < 20; ind = ind + 1)
	Switch(os_id) //if(key(_ENTER) || key(PAD_A)) break; end
		case 0:
			if(key(_ENTER)) break; end
		end
		case 5:
			if(joy_getbutton(gb_PadPort1, PAD_A)) break; end
		end
	End
	
	frame;
End

frame;

/*ANIMACIÓN DE LOGOTIPO DANDO VUELTAS*/
Process Loading()
Private
	byte p_iGraph = 0;
End
Begin
	FILE = fpg_Loading;
	GRAPH = 1;
	X = 640 - 50;
	Y = 480 - 50;
	Z = 99;
	
	For(p_iGraph = 1; p_iGraph <= 12; p_iGraph++)
		if(p_iGraph == 12)
			For(p_iGraph = p_iGraph; p_iGraph >= 1; p_iGraph--)
				if(p_iGraph == 1) break; End
				GRAPH = p_iGraph;
				Wait(5);
			End
		end
		GRAPH = p_iGraph;
		Wait(5);
		frame;
	End
	
End


/*MÉTODO QUE PERMITE CAPTURAR PAUSA EN EL JUEGO*/
/*If(os_id == 0)
	Loop
		
		Loop
			say("menu 0 esperando");
			If(gb_MenuStatus != 0) break; End
			
			If(key(_ESC))
				If(!preventKey)
					preventKey = true;
					SIGNAL(gi_PROC_Game, S_FREEZE_TREE);
					gb_MenuStatus = 1;
					break;
				End
			Else
				preventKey = false;
			End
			frame;
		End
		
		Loop
			If(gb_MenuStatus != 1) break; End
			
			If(key(_ESC))
				If(!preventKey)
					preventKey = true;
					SIGNAL(gi_PROC_Game, S_WAKEUP_TREE);
					gb_MenuStatus = 0;
					break;
				End
			Else
				preventKey = false;
			End
			frame;
		End
	
	
		frame;
	End
	
ElseIf(os_id == 5)
	Loop
		If(PadExists())
			If(joy_getbutton(gb_PadPort1, PAD_START))
				SIGNAL(gi_PROC_Game, S_FREEZE);
				Loop
					If(joy_getbutton(gb_PadPort1, PAD_START))
						SIGNAL(gi_PROC_Game, S_WAKEUP);
						break;
					End
					frame;
				End
			End
		End
		frame;
	End
End*/

/*PARA CAMBIAR EL COLOR DEL TEXTO----------------------------------------------------------------------*/
int colorId = 0;
colorId = rgba(255,0,0,255);
set_text_color(colorId);

/*PARAMETROS PARA ENVIAR SIGNALS-----------------------------------------------------------------------*/
Constant 	- Value 	- Description
S_KILL 	- 0 	- Kill the process.
S_WAKEUP 	- 1 	- Wakeup the process.
S_SLEEP 	- 2 	- Put the process to sleep.
S_FREEZE 	- 3 	- Freeze the process.
S_KILL_FORCE 	- 50 	- Kill the process forcefully.
S_WAKEUP_FORCE 	- 51 	- Wakeup the process forcefully.
S_SLEEP_FORCE 	- 52 	- Put the process to sleep forcefully.
S_FREEZE_FORCE 	- 53 	- Freeze the process forcefully.
S_KILL_TREE 	- 100 	- Kill the process and all its connected descendants.
S_WAKEUP_TREE 	- 101 	- Wakeup the process and all its connected descendants.
S_SLEEP_TREE 	- 102 	- Put the process and all its connected descendants to sleep.
S_FREEZE_TREE 	- 103 	- Freeze the process and all its connected descendants.
S_KILL_TREE_FORCE 	- 150 	- Kill the process and all its connected descendants forcefully.
S_WAKEUP_TREE_FORCE 	- 151 	- Wakeup the process and all its connected descendants forcefully.
S_SLEEP_TREE_FORCE 	- 152 	- Put the process and all its connected descendants to sleep forcefully.
S_FREEZE_TREE_FORCE 	- 153 	- Freeze the process and all its connected descendants forcefully.

A descendant is connected when all its ascendants up until the process are still alive.

Note: The constants S_FORCE, S_TREE and ALL_PROCESS are for internal use only. 

/*ALINEAMIENTO DE TEXTO-----------------------------------------------------------------------*/
Constant 	- Value
ALIGN_TOP_LEFT 	- 0
ALIGN_TOP 	- 1
ALIGN_TOP_RIGHT 	- 2
ALIGN_CENTER_LEFT 	- 3
ALIGN_CENTER 	- 4
ALIGN_CENTER_RIGHT 	- 5
ALIGN_BOTTOM_LEFT 	- 6
ALIGN_BOTTOM 	- 7
ALIGN_BOTTOM_RIGHT 	- 8 


/*TEXTO DE ENTRADA-------------------------------------------------------------------------------------*/
/*Dreamcast is a registered trademark 
of SEGA Corporation.

This Dreamcast software is homebrew and is not officialy licensed, designed, manufactured, distribuuted or endorsed by SEGA Corporation

All other used brand names and trademarks mentioned or show are trademarks of their respective owner

Old consoles, just for fun*/



/*GAME PADS OPTIONS-------------------------------------------------------------------------------------*/
A) Modo estándar:
	Teclas blancas = IZQ, ABJ, DER
	Teclas negras = Boton A y B
	Scratch = Gatillo R
B) Modo 2:
	Teclas blancas = IZQ, ABJ, DER
	Teclas negras = Boton A y B
	Scratch = Gatillo L
E) Modo 3:
	Teclas Blancas = X, A , B
	Teclas Negras = IZQ y DER
	Scratch = Gatillo R
E) Modo 4:
	Teclas Blancas = X, A , B
	Teclas Negras = IZQ y DER
	Scratch = Gatillo L
	
BOTONES DC
B == Scratch
A Si funciona cuando seleccionas en el mennú y para seleccionar cancion
