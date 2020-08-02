//Autor: 		Adrian Melian (KeiDash)
//Date:  		29/10/2017
//Description: 	Include que almacena todas las variables externas a las privadas de los procesos.



//#DECLARACIONES DE FUNCIONES QUE DEVUELVEN VALORES

DECLARE Function byte isDivisible(int nA, int nB)
End

DECLARE Function byte iSCREEN_ActionSelectTrack()
	Private
		int trackNumber = 0;
		int trackName = 0;
		int trackAuthor = 0;
		int trackDifficul = 0;
		int currentTime = -1;
	End
End

DECLARE Function string iTRACK_getTrackDataById(int trackId)
End

DECLARE Function float iTIME_get_PercentToShowSon(byte chordSpeed)
	Private
		float ciclos = 0.0;
		float minTime = 0.0;
	End
End

DECLARE Function byte getGraph_byChordID(byte chordID)
End

DECLARE Function byte getXPos_byChordID(byte chordID)
End


//#END DECLARACIONES-------------------------------------------------------

//#TIPOS DE DATOS 
/*
Type BTChord
	byte _Nota;
	byte _Freeze;
	byte _Last;
	int _Tiempo;
	int _Father;
	int _Son;
	byte _SonThrowed;
	byte _SonThrowPercent;
	byte _Speed;
End
*/

/*
Type BTTrack
	BTChord _Chords[46];
	string 	_Name;
	string 	_Author;
	int 	_Level;
	int 	_TiempoEspera;
	int		_TiempoFreeze;
	int 	_TotalChords;
	int		_trackId;
	byte	_Loaded;
End
*/

Type DCGamepad
	byte PAD_UP 		= 0;
	byte PAD_DOWN 		= 0;
	byte PAD_LEFT 		= 0;
	byte PAD_RIGHT 		= 0;
	byte PAD_ANG_UP 	= -127;
	byte PAD_ANG_DOWN 	= 127;
	byte PAD_ANG_LEFT 	= -127;
	byte PAD_ANG_RIGHT 	= 127;
	byte PAD_A 			= 0;
	byte PAD_B 			= 0;
	byte PAD_X 			= 0;
	byte PAD_Y 			= 0;
	byte PAD_START 		= 0;
	byte PAD_L 			= 0;
	byte PAD_R 			= 0;
End

Type GameFpg
	int Identifier	= 0;
	int Pal		= 0;
End


//#END TIPOS DE DATOS-----------------------------------------------------

GLOBAL

	//SISTEMA
	byte demoIsrunning 		= false;
	byte btnStartPressed 	= false;
	byte gi_SonCanRunIt 	= false;
	int gi_initTime 		= 0;	//Tiempo en el que comienza la cancion
	int gi_rectificationTime = 0;	//Tiempo de rectificacion
	int gi_Time 			= 0;
	
	GameFpg gameFpg;
	
	//TEMAS MUSICALES
	//BTTrack BTTrackCollection[9];			//Colleccion de Canciones
	//string gs_ArrayStrDataTrack01[46];		//Podemos usar el mismo para todas, incrementando el indice al máximo de notas posibles
	
	//NUEVA CARGA DE CANCIONES 2019
	int TrackArray[12][9];
	string tName 		= "";
	string tAuthor 		= "";
	byte tLevel 		= 0;
	int tTiempoEspera 	= 0;
	int tTiempoFreeze	= 0;
	int tTotalChords 	= 0;
	int tTrackId 		= 0;
	
	//CD-ROM
	//int gi_DriveStatus = -1;
	
	//DEBUG VARS
	//string p_sCurrentFPS = "";
	//string p_sMemTotal = "";
	string p_sMemFree = "";
	int gi_TimeFinished 		= -1;
	int gi_GameLoadFinished 	= -1;
	int gi_TimeVarFinished 		= -1;
	int gi_TimeVar = 0;
	
	
	//Identificadores de Procesos
	byte gb_OptionSelected 	= false;
	byte gb_goToMainMenu	= false;
	byte gi_TrackLoaded 	= false;
	byte trackWasPlayed 	= false;
	int gi_WAV_CHANNEL 		= 0;
	int gi_PROC_Loading 	= 0;
	int gi_PROC_Game 		= 0;
	int gi_PROC_PowerBar 	= 0;
	int gi_PROC_Close 		= 0;
	int gi_PROC_Points		= 0;
	
	
	//Efectos de sonido y musica
	int gi_SFX_OK = 0;
	int gi_CurrentSongId = 0;
	
	int gi_MusicMuteId = 0;
	int gi_MusicIntroId = 0;
	int gi_MusicTRK01 = 0;
	int gi_MusicTRK02 = 0;
	int gi_MusicTRK03 = 0;
	int gi_MusicTRK04 = 0;
	int gi_MusicTRK05 = 0;
	int gi_MusicTRK06 = 0;
	int gi_MusicTRK07 = 0;
	int gi_MusicTRK08 = 0;
	int gi_MusicTRK09 = 0;
	
	
	//FICHEROS---------------------------------------------:	
	//Paths
	string graphPath 	= "";
	string fontPath 	= "";
	string audioPath 	= "";
	string sfxPath 		= "";
	
	//FpgFiles
	//int fpg_Main = 0;
	
	//FIN FICHEROS-----------------------------------------:
	
	//Sistema de Puntuación
	//int gi_MaxGotcha = 373;
	int gi_GotchaTypes[3][6];
	
	//Propiedades del track
	int gi_SPEED = 1;
	byte gi_Wait = 2;
	
	//byte gi_KeyWhite = 57;
	//byte gi_KeyA = 53;
	//byte gi_KeyB = 55;
	//byte gi_KeyScratchStable = 999;
	//byte gi_KeyScratchSlice = 999;
	
	byte gb_totalTrackBeats 	= 0;
	byte gi_SongFinish 			= false;
	
	//Notification Items
	int NotificationKey_UP 		= 0;
	int NotificationKey_DOWN 	= 0;
	int NotificationKey_LEFT 	= 0;
	int NotificationKey_RIGHT 	= 0;
	int NotificationKey_A 		= 0;
	int NotificationKey_B 		= 0;	
	int NotificationKey_R 		= 0;

	//VARIABLES DE LA MAIN SCREEN
	
	//VARIABLES DE LA PANTALLA DE INICIO
	int OPTIONSEL = -1;
	
	//Game items
	byte gi_SuperPoints 	= 0;
	byte gi_PerfectPoints 	= 0;
	byte gi_GoodPoints 		= 0;
	byte gi_BadPoints 		= 0;
	byte gi_PoorPoints		= 0;
	byte gi_GreatsCounter 	= 0;
	int gi_Points 			= 0;
	int gf_TotalPoints 		= 0;
	float gi_PowerPoints 	= 0.000; //Representa el valor de la barra de poder.
	float gi_PointValue 	= 0.000; //representa lo que vale un punto
	
	//VARIABLES RELACIONADAS CON EL MENÚ DE OPCIONES (PAUSE)
	byte gb_MenuStatus 		= 0;
	
	//VARIABLES RELACIONADAS CON LOS PADS--------------------------------:
	byte gb_PadPort1 		= -1;
	DCGamepad gamePad;
	
	//FIN VARIABLES RELACIONADAS CON LOS PADS-----------------------------:
	
END

LOCAL
	byte allowNotification = true;
END


//#DEFINE MB /1024
#DEFINE JA_UP < -115
#DEFINE JA_DOWN > 115
#DEFINE JA_LEFT < -115
#DEFINE JA_RIGHT > 115

#define DEBUG 1
#define NELEMS(x) sizeof(x)/sizeof(x[0])

// INDICES DEL ARRAY DE LA CANCIÓN:
#define _TIEMPO 		0
#define _NOTA 			1
#define _FREEZE 		2
#define _LAST 			3
#define _FATHER 		4
#define _SON 			5
#define _SONTHROWED 	6
#define _SONTHROWEDP 	7
#define _SPEED 			8

#define NTRACKS			2	//TOTAL DE TEMAS MUSICALES

//POSICIONES Y PARA PUNTUAR LAS NOTAS-------------------------:
#define _MIN_GOTCHA 362
#define _MAX_GOTCHA 379
#define _MIN_POS_POOR_R1 362
#define _MAX_POS_POOR_R1 365
#define _MIN_POS_POOR_R2 375
#define _MAX_POS_POOR_R2 378
#define _MIN_POS_PERFECT 369
#define _MAX_POS_PERFECT 371
#define _MIN_POS_GOOD_R1 366
#define _MAX_POS_GOOD_R1 368
#define _MIN_POS_GOOD_R2 372
#define _MAX_POS_GOOD_R2 374

//POSICIONES PULSACIONES
#define _PUL_POS_Y 224

//BARRA DE POWER
#define _TOTALPOW 60.00

//POSICIONES VISUALES-----------------------------------------:
#define _MAXGUITAR_YPOS 376 	//Máximo Y para la barra de la guitarra.
#define _MAXCHORD_Y 379			//Máximo Y para las notas
#define _MINCHORD_Y 11			//Mínimo Y para las notas
//FIN POSICIONES VISUALES------------------------------------:
	
//TIPOS DE ACIERTOS-------------------------------------------:
#define _PERFECT 0
#define _GOOD 1
#define _POOR 2
#define _BAD 4
#define _PPERFECT 5
//FIN TIPOS DE ACIERTOS---------------------------------------:
	
//VALORES DE PUNTUACIONES-------------------------------------:
#define _POORGOTCHA 20
#define _GOODGOTCHA 50
#define _PERFECTGOTCHA 100
#define _SUPERGOTCHA 200
#define _HIPERGOTCHA 300
#define _MEGAGOTCHA 400
#define _ULTRAGOTCHA 600
#define _GOTCHAX2 10
//FIN VALORES DE PUNTUACIONES---------------------------------: