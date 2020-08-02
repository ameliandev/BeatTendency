//Autor: 		Adrian Melian (KeiDash)
//Date:  		02/03/2018
//Description: 	Include para tratar la reproducción de música y efectos de sonido en el juego.
//				Versión PC

Process PlaySound(int soundId, string soundName, int milis4Wait, byte reiterate, byte isSFX)
Private
	int repetir = 0;
Begin

	If(milis4Wait > 0)
		WaitSeconds(milis4Wait);
	End
	
	repetir = reiterate ? 1 : 0;
	
	gi_WAV_CHANNEL = PLAY_WAV(soundId, repetir);
	RESUME_WAV(gi_WAV_CHANNEL);
End

Process StopSound(int soundId)
Begin
	UNLOAD_WAV(soundId);
End

Function setSounds()
Begin
	
	gi_SFX_BTMain = Sfx_Allocate(sfxPath + gui_intro + ".wav");
	gi_SFX_MOVE = Sfx_Allocate(sfxPath + gui_move + ".wav");
	gi_SFX_OK = Sfx_Allocate(sfxPath + gui_ok + ".wav");
	gi_SFX_BTVoice = Sfx_Allocate(sfxPath + gui_voice + ".wav");
	
	say("ID 1 : " + gi_SFX_MOVE );
	say("ID 2 : " + gi_SFX_OK );
	say("ID 3 : " + gi_SFX_BTVoice );
	
	If(os_id == 0)
		gi_TRK_01 = Sfx_Allocate(audioPath + trk_01_test + ".wav");
	End
	
	SET_WAV_VOLUME(gi_SFX_MOVE, 128);
	SET_WAV_VOLUME(gi_SFX_OK, 128);
	SET_WAV_VOLUME(gi_SFX_BTVoice, 128);
	SET_WAV_VOLUME(gi_SFX_BTMain, 128);
	
End

Process Sfx_UnassingByID(int sfxID)
Begin
	If(sfxID != 0) UNLOAD_WAV(sfxID); End
	
	sfxID = 0;
End

Process Sfx_UnassingAll()
Private
End	
Begin

	If(gi_SFX_MOVE != 0) UNLOAD_WAV(gi_SFX_MOVE); End
	If(gi_SFX_OK != 0) UNLOAD_WAV(gi_SFX_OK); End
	If(gi_SFX_BTVoice != 0) UNLOAD_WAV(gi_SFX_BTVoice); End
	If(gi_SFX_BTMain != 0) UNLOAD_WAV(gi_SFX_BTMain); End

	gi_SFX_MOVE = 0;
	gi_SFX_OK = 0;
	gi_SFX_BTVoice = 0;
	gi_SFX_BTMain = 0;
	
End

Function int Sfx_Allocate(string sfxPath)
Private
End
Begin
	return LOAD_WAV(sfxPath);
End

Process PauseSound()
Begin
	PAUSE_WAV(gi_WAV_CHANNEL);
End

/*Process StopSound()
Begin
	STOP_WAV(gi_WAV_CHANNEL);
End*/

Process StopSFX(int soundID)
Begin
	PAUSE_WAV(soundID);
	//STOP_WAV(soundID);
End