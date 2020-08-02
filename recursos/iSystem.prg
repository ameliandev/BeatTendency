//Autor: 		Adrian Melian (KeiDash)
//Date:  		29/10/2017
//Description: 	Include Game system config. Contiene todos los métodos de parámetros de configuración clave del programa.

Function SetSystemConfig()
Begin
	
    define_region(1, 0, 0, 640, 480);

    setResolution_byOS(os_Id);
	
    set_fps(60, 1); //Segundo parámetro, indica los segundos que permite a la máquina saltarse si se ve apurada.
	
	If(os_Id == 0)
		set_title("BeatTendency");
	End
	
	setPadConfig();

	frame;
End

//Establece la configuración del sistema según el tipo de S.O donde se ejecute
//param: osId > Id del sistema operativo establecido por el entorno.
Function setResolution_byOS(int osId)
Begin
	switch(os_id)
		case 0: //PC
			set_mode(640,480, MODE_16BITS, mode_waitvsync);
		end
		case 1: //Linux
		end
		case 5: //Dreamcast
			set_mode(640,480, MODE_8BITS);
			//set_mode(640,480, gi_Colors);
		end
		default:
		end
	end
End

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

/*Function int Wait(int t)
Begin
    t += timer[0];
    While(timer[0]<t) frame; End
    return t-timer[0];
End*/

Process DebugPrint(string method, string message)
Private
	string p_sDefaultText = "Process executed correctly.";
End
Begin
	If(strlen(message) <= 0)
		message = p_sDefaultText;
	End
	say("> DEBUG :: ----------------------------------------------------------");
	say("> > Method: " + method);
	say("> > Message: " + message);
End