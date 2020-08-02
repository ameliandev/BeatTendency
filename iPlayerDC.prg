//Autor: 		Adrian Melian (KeiDash)
//Date:  		02/03/2018
//Description: 	Include para tratar la reproducción de música y efectos de sonido en el juego.
//				Versión Dreamcast

Function int iPLAYER_LoadTrack(string songName)
Begin
	return LOAD_SONG(audioPath + songName);
	
	/*While(gi_CurrentSongId == -2) //se supone que esto está cargando..
		say("Cargando..");
		//nada?
	End*/
End

Process PlayTrack(int songId, int repeats)
Begin
	//-1 es para repetir
	SET_SONG_VOLUME(128);
	PLAY_SONG(songId, repeats);
	
End

Process PlayTrackUntil(int songId, int repeats, int waitSeconds)
Private
Begin
	frame;
	
	WaitingUntil(waitSeconds);
	
	SET_SONG_VOLUME(128);
	PLAY_SONG(songId, repeats);
	
End

Process StopTrack(byte fadeOut)
Private
	byte volume = 128;
Begin

	if(fadeOut)
		Repeat
			SET_SONG_VOLUME(volume);
			volume -= 2;
			frame;
		Until(volume <= 10)
	end
	
	SET_SONG_VOLUME(0);
OnExit
End


Process PlaySound(int soundId, string soundName, int milis4Wait, byte reiterate, byte isSFX)
Private
	byte repetir = 0;
Begin

	frame;
	
	If(milis4Wait > 0)
		Waiting(milis4Wait);
	End
	
	repetir = reiterate ? true : false;
	
	if(isSFX)
		gi_WAV_CHANNEL = PLAY_WAV(soundId, repetir);
		RESUME_WAV(gi_WAV_CHANNEL);
		SET_CHANNEL_VOLUME(gi_WAV_CHANNEL, 128);
	else
		//OGG NO ESTA CARGADO COMO INCLUDE
		/*OGG_INIT();
		If(!OGG_IS_PLAYING())
			OGG_INIT();
		End
		SET_OGG_VOLUME(255);	
		OGG_PLAY(soundName, repetir);*/
	end
End

//SOLO PARA CDDA EN CASO DE DREAMCAST
Function iPLAYER_set_BasicSounds()
Begin
	//gi_SFX_OK = iPLAYER_setAlloc(sfxPath + "pressbtn.wav");
	
	gi_MusicIntroId 	= iPLAYER_LoadTrack("gameIntro.xm");
	gi_MusicTRK01 		= iPLAYER_LoadTrack("trk01.it");
	gi_MusicTRK03 		= iPLAYER_LoadTrack("trk01-fx-01.wav");
	gi_MusicTRK02 		= iPLAYER_LoadTrack("trk02.xm");
	
	//gi_MusicTRK03 		= iPLAYER_LoadTrack("trk03.xm");
	//gi_MusicTRK04 		= iPLAYER_LoadTrack("trk04.xm");
	//gi_MusicTRK05 		= iPLAYER_LoadTrack("trk05.xm");
	//gi_MusicTRK06 		= iPLAYER_LoadTrack("trk06.xm");
	//gi_MusicTRK07 		= iPLAYER_LoadTrack("trk07.xm");
	//gi_MusicTRK08 		= iPLAYER_LoadTrack("trk08.xm");
	//gi_MusicTRK09 		= iPLAYER_LoadTrack("trk09.xm");
	
	//gi_MusicMuteId		= iPLAYER_LoadTrack("mute.it");
	
	//SET_WAV_VOLUME(gi_SFX_OK, 128);
	
End

Function int iPLAYER_setAlloc(string soundPath)
Begin
	return LOAD_WAV(soundPath);
End


/*Process PlayCDA(int trackNumber, int wait, byte looping)
Private
	int i = 0;
	int bucle = 0;
End
Begin
	
	If(wait > 0)
		for(i=0;i<=wait;i++)
			frame;
		end
	End
	
	If(looping) bucle = 15; End

	dc_cddaplay(trackNumber, bucle);
	
End*/
