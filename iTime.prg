//Autor: 		Adrian Melian (KeiDash)
//Date:  		10/12/2017
//Description: 	Modulo que distribuye y manipula las proporciones de tiempo.

Function int iTIME_get_PercentToShowSon(byte chordSpeed)
Begin

	ciclos = _MAXCHORD_Y - _MINCHORD_Y;
	
	frame;

	Switch(chordSpeed)
		case 1:
			minTime = ((ciclos / FPS) * 2);
		end
		case 2:
			minTime = ciclos / FPS;
		end
		case 3:
			minTime = ciclos / (FPS * 3);
		end
	End
	
	return minTIme * 1000;
End

Function float iTIME_get_TiempoMinimoEspera()
Begin
	return ((_MAXCHORD_Y - _MINCHORD_Y) / FPS) * 1000;
End

Function int TimeToMiliseconds(string time)
Private
	float ftime = 0.0;
	int mTime = 0;
Begin
	
	ftime = atof(time);
	mTime = ftime * 1000;
	return mTime;
End


/*Process initialiceTimer()
Private
Begin
	Loop
		gi_MILIS = get_timer();
		frame;
	End
End*/

/*Function WaitSeconds(int milis)
Private
	int toWait = 0;
Begin
	toWait = get_timer() + milis;
	
	Repeat
		frame;
	Until(get_timer() >= towait)
End*/

/*
* Descripcion: 	Proceso que lanza una espera de tiempo en milisegundos.
*				Para indicar que ha terminado, actualiza la varible global
*				gi_TimeFinished a 1.
* Nota:			El usuario debe actualizar el valor de gi_TimeFinished a -1
*				para que vuelva a inicializarse la variable y se pueda usar posteriormente.
* Parametros:
*  - int milis	Tiempo en milisegundos. Se puede generar con la ayuda de la función TimeToMiliseconds()
*/
Process Waiting(int milis)
Private
	int toWait = 0;
Begin

	frame;
	
	gi_TimeFinished = -1;
	
	toWait = get_timer() + milis;
	
	Repeat
		frame;
	Until(get_timer() >= towait)
	
OnExit
	gi_TimeFinished = 1;
End

Process WaitingVar()
Private
	int toWait = 0;
	int myTime = 0;
Begin

	gi_TimeVarFinished = -1;
	//write_var(0,40,20, 0, gi_TimeVar);
	//write_var(0,20,40, 0, myTime);
	//write_var(0,20,20, 0, fps);
	
	Repeat
		myTime = get_timer();
		frame;
	Until(myTime >= gi_TimeVar)
	
OnExit
	gi_TimeVarFinished = 1;
End

Function WaitingUntil(int milis)
Begin

	Waiting(milis);
	Repeat
		frame;
	Until(gi_TimeFinished == 1)
	gi_TimeFinished = -1;
End

Function WaitingUntilKey(int milis, int keyId)
Begin
	Waiting(milis);
	Repeat
		frame;
	Until(gi_TimeFinished == 1 || key(keyId))
	gi_TimeFinished = -1;
End

/*Process Cronometro()
Private
	int i = 0;
	char val = "";
End
Begin
	//PRIORITY = 1; 
	
	Loop
		
		if(itoa(time()*1000)[5] != val)
			val = itoa(time()*1000)[5];
			gi_SECONDS = atoi(val);
		end
		
		frame;
	End
	
End*/

//Establece la cantidad de ciclos que tiene que dar un bucle, para que se ejecute una instrucción.
//Parámetros:
//Segundo (float) - Tiempo en segundos.décimas (0.0)
/*Function int ObtenerCiclos(float segundo)
Private
	int sec = 0;
	int dec = 0;
	int total = 0;
	string strsec = "";
	int i = 0;
	byte beforePoint = false;
	int lenght = 0;
End
Begin

	lenght = len(ftoa(segundo));
	
	for(i = 0; i < len(ftoa(segundo)); i++)
		if(ftoa(segundo)[i] == ".") break; end
		strsec += ftoa(segundo)[i];
	end
	
	sec = atoi(strsec);
	strsec = "";
	
	for(i = 0; i < len(ftoa(segundo)); i++)
	
		if(ftoa(segundo)[i] == ".") 
			beforePoint = true;
			continue;
		end
		
		if(beforePoint)
			strsec += ftoa(segundo)[i];
			break; //Fuerzo que se detenga porque a veces bennu me da un float con más decimales.
		end
	end

	dec = atoi(strsec);

	total = (60 * sec) + (60 * (dec * 10) / 100);
	
	return total;
End*/


/*Function int ObtenerCiclos2(string segundos)
Private
	int sec = 0;
	int dec = 0;
	float cen = 0.0;

	int total = 0;
	string strsec = "";
	byte beforePoint = false;
	int lenght = 0;

	string str = "";
	string newstr = "";
	string a[4];
	int n;
	int i;
End
Begin
	
	if(len(segundos) <= 0) return; end

	lenght = len(segundos) - 1;
	
	//NO debe estar eliminado, lo comenté por optimización de código.
	//newstr = Remove(segundos, '.');
	
	for(i=0; i<lenght; i++)
		if(newstr[i] == "") continue; end
		a[i] = newstr[i];
	end

	//2 = 0.0, 3 = 0.00, 4 = 00.00
	switch(lenght)
		case 2:
			sec = atoi(a[0]);
			dec = atoi(a[1]);
			total = (60 * sec) + (60 * (dec * 10) / 100);
		end
		case 3:
			sec = atoi(a[0]);
			cen = ftoa("0." + a[1] + a[2]);
			total = (60 * sec) + (60 * (cen * 100) / 100);
		end
		case 4:
			sec = atoi(a[0] + a[1]);
			cen = ftoa("0." + a[2] + a[3]);
			say(ftoa(cen));
			total = (60 * sec) + (60 * (cen * 100) / 100);
		end
	end

	return total;
End*/

/*Process ObtenerFecha()
Private
	int pi_Before = 0;
	int pi_Now = 0;
	int pi_Weeks = 0;
	int pi_Days = 0;
	int pi_Hours = 0;
	int pi_Minutes = 0;
	int pi_Seconds = 0;
	int pi_MSeconds = 0;
	int pi_diff = 0;
	int i;
End
Begin
	
	//$milliseconds = time()*1000 - $user_timestamp*1000;
	
	pi_Before = time()*1000; //Tiempo anterior
	
	for(i = 0; i < 100; i++) //5 Seg aprox
		frame;
	end
	
	pi_Now = time()*1000;
	
	pi_diff = pi_Now - pi_Before;
	
	If(1 > pi_diff)
		//
	Else
		pi_Weeks = pi_diff / 86400 / 7;
		pi_Days = pi_diff / 86400 % 7;
		pi_Hours = pi_diff / 3600 % 24;
		pi_Minutes = pi_diff / 60 % 60;
		pi_Seconds = pi_diff % 60;
		pi_MSeconds = pi_diff;

		say("El tiempo transcurrido es: Semanas = " + pi_Weeks + "; Dias = " + pi_Days + "; Horas = " + pi_Hours + "; Minutos = " + pi_Minutes + "; Segundos = " + pi_Seconds + "; MSeg = " + pi_MSeconds);
	End


End*/