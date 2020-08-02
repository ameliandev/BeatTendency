//1% = totalPower * 1 / totalNotas

//Process Points_Initialice(byte trackId)
Process Points_Initialice()
Begin
	
	gi_PointValue = tTotalChords * 1 / _TOTALPOW;
	//gi_PointValue = BTTrackCollection[trackId]._TotalChords * 1 / _TOTALPOW;

	Points_SetMainGlobalValues();
	Points_Show();
	
	loop frame; end
End

Function Points_SetMainGlobalValues()
Begin

	write_float(0,10,10,0, &gi_PointValue);
	
	gi_GotchaTypes[_PERFECT][0] = 369;
	gi_GotchaTypes[_PERFECT][1] = 370;
	gi_GotchaTypes[_PERFECT][2] = 371;
	
	gi_GotchaTypes[_GOOD][0] = 372;
	gi_GotchaTypes[_GOOD][1] = 373;
	gi_GotchaTypes[_GOOD][2] = 368;
	gi_GotchaTypes[_GOOD][3] = 367;
	gi_GotchaTypes[_GOOD][4] = 366;
	gi_GotchaTypes[_GOOD][5] = 365;
	
	gi_GotchaTypes[_POOR][0] = 364;
	gi_GotchaTypes[_POOR][1] = 363;
	gi_GotchaTypes[_POOR][2] = 362;
	
End

Process Points_Show()
Begin
	
	write_var(0, 470, 408, 0, gf_TotalPoints);
	write_float(1, 30, 15, 0, &gi_PowerPoints);
	
	write_var(0, 225, 80, 0, gi_GreatsCounter);
	write_var(0, 225, 100, 0, gi_GoodPoints);
	write_var(0, 225, 120, 0, gi_BadPoints);
	write_var(0, 225, 140, 0, gi_PerfectPoints);
	
	gi_PROC_PowerBar = DisplayPowerBar();
	SIGNAL(gi_PROC_PowerBar, S_FREEZE);
	
	Loop
		frame;
	End
End

Function byte isPerfect(int gotchaPosition)
Begin
	return gotchaPosition >= _MIN_POS_PERFECT && gotchaPosition <= _MAX_POS_PERFECT;
End

Function byte isGood(int gotchaPosition)
Begin
	return (gotchaPosition >= _MIN_POS_GOOD_R1 && gotchaPosition <= _MAX_POS_GOOD_R1) 
		|| (gotchaPosition >= _MIN_POS_GOOD_R2 && gotchaPosition <= _MAX_POS_GOOD_R2);
End

Function byte isPoor(int gotchaPosition)
Begin
	return (gotchaPosition >= _MIN_POS_POOR_R1 && gotchaPosition < _MAX_POS_POOR_R1)
		|| (gotchaPosition >= _MIN_POS_POOR_R2 && gotchaPosition < _MAX_POS_POOR_R2);
End

Process Points_Recalculate(int gotchaPosition)
Private
	byte gotchaType = -1;
End
Begin
	
	frame;
	
	If(isPerfect(gotchaPosition))
		gotchaType = _PERFECT;
	Elseif(isGood(gotchaPosition))
		gotchaType = _GOOD;
	Elseif(isPoor(gotchaPosition))
		gotchaType = _POOR;
	Else
		say("es malo " + gotchaPosition);
		gotchaType = _BAD;
	End
	
	
	Switch(gotchaType)
		case _PERFECT:
			say("es perfecto " + gotchaPosition);
			gi_PerfectPoints++;
			gi_GreatsCounter++;
			gf_TotalPoints += _PERFECTGOTCHA;
			gi_PowerPoints += gi_PointValue;
			
			SIGNAL(gi_PROC_PowerBar, S_WAKEUP);
			
			//TODO:
			//Si 10, + 200 SUPER GREAT
			//Si 20, + 300 HIPER GREAT
			//Si 30, + 400 MEGA GREAT
			//Si > 40, + 600 ULTRA GREAT
			
			if(gi_GreatsCounter >= _GOTCHAX2) 
				gf_TotalPoints = gf_TotalPoints + _SUPERGOTCHA; 
				gi_SuperPoints ++;
			end
			if(gi_GreatsCounter >= _GOTCHAX2 * 2)
				gf_TotalPoints = gf_TotalPoints + _HIPERGOTCHA; 
				gi_SuperPoints ++;
			end
			if(gi_GreatsCounter >= _GOTCHAX2 * 4)
				gf_TotalPoints = gf_TotalPoints + _MEGAGOTCHA; 
				gi_SuperPoints ++;
			end
			if(gi_GreatsCounter >= _GOTCHAX2 * 6)
				gf_TotalPoints = gf_TotalPoints + _ULTRAGOTCHA; 
				gi_SuperPoints ++;
			end
			frame;
		end
		case _GOOD:
			say("es good " + gotchaPosition);
			gi_GoodPoints++;
			gi_GreatsCounter = 0;
			gf_TotalPoints = gf_TotalPoints + _GOODGOTCHA;
			gi_PowerPoints += gi_PointValue;
			SIGNAL(gi_PROC_PowerBar, S_WAKEUP);
			frame;
		end
		case _POOR:
			say("es pobre " + gotchaPosition);
			gi_PoorPoints++;
			gi_GreatsCounter = 0;
			gf_TotalPoints = gf_TotalPoints + _POORGOTCHA;
			gi_PowerPoints += (gi_PointValue - 0.2);
			SIGNAL(gi_PROC_PowerBar, S_WAKEUP);
			frame;
		end
		case _BAD:
			gi_BadPoints++;
			gi_GreatsCounter = 0;
			SIGNAL(gi_PROC_PowerBar, S_WAKEUP);
			//gi_PowerPoints += (gi_PointValue - 0.5);
			//gi_PowerPoints = gi_PowerPoints - gi_gotchaPercent;
			frame;
		end
	End
	
	SIGNAL(gi_PROC_PowerBar, S_FREEZE);
	
	frame;
	
End

