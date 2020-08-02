Process showFps()
Begin
	
	//p_sCurrentFPS = "";
	//p_sCurrentFPS = format((memory_total()MB),0);
	
	write(0, 500, 40, ALIGN_TOP_RIGHT, "FPS:");
	write_var(0, 580, 40, ALIGN_TOP_RIGHT, fps);			//Fps
End

Process showTotalMem()
Begin
	p_sMemTotal = "";
	p_sMemTotal = format((memory_total()MB),0);
		
	write(0, 500, 50, ALIGN_TOP_RIGHT, "Total Mem:");
	write_var(0, 580, 50, ALIGN_TOP_RIGHT, p_sMemTotal);	//Total
End

/*
* Descripcion: 	Muestra la cantidad de RAM libre en en sistema.
*
*/
Process RAMShowFree()
Private
Begin
	p_sMemFree = format(memory_free()) + " bytes";
	write(0, 640/2 - 20, 480 - 20, ALIGN_TOP_RIGHT, "RAM Free:");
	write_var(0, 640/2 + 120, 480 - 20, ALIGN_TOP_RIGHT, p_sMemFree);
	frame;
End

Process showInitTime()
Private 
	mTime = 0;
Begin
	mTime = get_timer();
	write(0, 500, 90, ALIGN_TOP_RIGHT, "Init time:");
	write_var(0, 580, 90, ALIGN_TOP_RIGHT, mTime);
End

Process showTimeFor(int trackId, int chordId)
Private
Begin
	write(0, 500, 70, ALIGN_TOP_RIGHT, "Time for:" + chordId);
	write(0, 580, 70, ALIGN_TOP_RIGHT, BTTrackCollection[trackId]._Chords[chordId]._Tiempo);
	write(0, 500, 80, ALIGN_TOP_RIGHT, "Aparecio a:");
	
	Loop
		if(gi_time > 0)
			write_var(0, 580, 80, ALIGN_TOP_RIGHT, gi_Time);
			break;
		end
		frame;
	End
	
End