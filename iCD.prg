//Autor: 		Adrian Melian (KeiDash)
//Date:  		29/10/2017
//Description: 	Include para tratar la reproducción de la música y los efectos especiales


Process PlayMusic(int trackId, string trackName, int wait, byte reiterar)
Private
	int i = 0;
	int repetir = 0;
End
Begin
	
	If(wait > 0)
		for(i=0;i<=wait;i++)
			frame;
		end
	End
	
	repetir = reiterar ? 1 : 0;
	
	Switch(os_id)
		case 0:
			repetir = reiterar ? 1 : 0;
	
			gi_WAV_CHANNEL = PLAY_WAV(trackId, repetir);
			RESUME_WAV(gi_WAV_CHANNEL);
		end
		case 5:
			
			OGG_INIT();
			
			/*If(!OGG_IS_PLAYING())
				OGG_INIT();
			End*/
			
			SET_OGG_VOLUME(255);
	
			OGG_PLAY(audioPath + trackName + ".ogg", repetir);
		end
	End
End

/*Process MusicStatus()
Private
	int keyDeny = 0;
Begin

	gi_DriveStatus = CD_STATUS(0);
	
	write_var(0, 500, 10, ALIGN_CENTER, gi_DriveStatus);
	
	Loop
		If(KEY(_ENTER))
			If(!keyDeny)
				keyDeny = true;
				CD_STOP(0);
				gi_DriveStatus = CD_STATUS(0);
				Wait(300);
				dc_cddaplay(3, 0);
				gi_DriveStatus = CD_STATUS(0);
			End
		Else
			keyDeny = false;
		End
		frame;
	End
End*/