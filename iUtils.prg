//Autor: 		Adrian Melian (KeiDash)
//Date:  		03/01/2018
//Description: 	Include que contempla todas las funciones y procesos que son genéricos a todo el código.

//Crea una animación del sprite A al sprite B, indicando posición, velocidad, posición z y si va de alante hacia atrás.
Process Animate(int fpgfile, int startgraph, int finalgraph, int velocity, int xpos, int ypos, int zpos, byte reverse, int wait)
Private
	int i = 0;
	int s = 0;
End
Begin

	If(wait > 0)
		for(i=0;i<=wait;i++)
			frame;
		end
	End
	
	FILE = fpgfile;
	GRAPH = startgraph;
	X = xpos;
	Y = ypos;
	Z = zpos;
	
	FROM s = startgraph TO finalgraph STEP 1;
	
		for(i=0;i<=velocity;i++)
			frame;
		end
		
		GRAPH = s;
		
		frame;
	END
	
	If(reverse)
		FROM s = finalgraph TO startgraph STEP 1;
	
			for(i=velocity;i>=0;i--)
				frame;
			end
			
			GRAPH = s;
			
			frame;
		END
	End
End

Function byte isDivisible(int nA, int nB)
Begin
	return (nA % nB) == 0 ? True : False;
End

Function WaitingFor(int sec)
Private
	int i = 0;
End
Begin
	For(i=0; i < sec; i++)
		frame;
	End
End

//Función para ver como funcionan los punteros
Function PunteroTest()
private
	int a = 0;
	int *puntero;
end
begin
	puntero = &a;
	//say("El valor de a es: " + a + ". El valor de *puntero es: " + *puntero + ".");
	//say("La direccion de memoria del *puntero es:" + puntero);
End

/*Function string Remove(string str, char ch)
Begin

	lenght = len(str) - 1;

	for(i = 0; i <= lenght; i++)
		if(str[i] == ch) continue; end
		newStr += str[i];
	end

	return newStr;
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