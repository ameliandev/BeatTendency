//Autor: 		Adrian Melian (KeiDash)
//Date:  		10/04/2018
//Description: 	Include que manipula la barra de power

Process DisplayPowerBar()
Private
	float pwvalue = 0.0;
	int currentPower = 90;
	byte power = 1;
	int xpos = 0;
	int ypos = 0;
	int mainXPosition = 70;
	int proc_SetPower	= 0;
Begin
	//&gi_PowerPoints
	
	Loop
		if(pwvalue != gi_PowerPoints)
		
			pwvalue = gi_PowerPoints;
			
			if(pwvalue >= (gb_totalTrackBeats * currentPower) / _TOTALPOW)
				Switch(power)
					case 1:
						ypos = 426;
					end
					case 2:
						ypos = 428;
					end
					case 3:
						ypos = 428;
					end
					case 4:
						ypos = 430;
					end
				end			
				
				proc_SetPower = setPower(currentPower, 640/2 - mainXPosition, ypos);
				
				if(EXISTS(proc_SetPower)) SIGNAL(proc_SetPower, S_FREEZE); end
				
				if(power == 4)
					power = 1;
					mainXPosition -= 8;
				else
					power++;
					mainXPosition--;
				end
				
				currentPower++;
				
			end
		end
		
		frame;
		
	End
	
End

Process setPower(GRAPH, X, Y)
Private
	//int i = 0;
Begin
	//ALPHA = 0;
	FILE = gameFpg.Identifier;
	
	/*
	Repeat
		if(isDivisible(i, 2)) ALPHA += 6; end
		i++;
		frame;
	Until(ALPHA == 100 ||i == 60)
	*/
	
	loop
		frame;
	end
End

/*
Process PowerBarDemo()
Private
	int i = 0;
	int power = 1;
	int xpos = 0;
	int ypos = 0;
	int mainXPosition = 70;
End
Begin
	
	for(i = 0; i < _TOTALPOW; i++)
	
		Switch(power)
			case 1:
				ypos = 426;
			end
			case 2:
				ypos = 428;
			end
			case 3:
				ypos = 428;
			end
			case 4:
				ypos = 430;
			end
		end
		
		setPower(i + 1, 640/2 - mainXPosition, ypos);
		
		if(power == 4)
			power = 1;
			mainXPosition -= 8;
		else
			power++;
			mainXPosition--;
		end
		
	end
	
	
	Loop
		//say("Porcentaje: " + gi_PowerPoints);
		frame;
	End
	
End
*/