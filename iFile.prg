Function string getTrackFile(string fileName)
Begin
	
	Switch(os_id)
		case 0:
			if(FEXISTS("files/tracks/" + fileName))
				handle = FOPEN("files/tracks/" + fileName, O_READ); // opens the file in reading mode
			end
		end
		case 5:
			if(FEXISTS("/cd/files/tracks/" + fileName))
				handle = FOPEN("/cd/files/tracks/" + fileName, O_READ); // opens the file in reading mode
				if(handle > 0)
					say("FILE: handle correcto");
				end
			else
				say("FILE: El fichero NO existe");
			end
			//return getTrackStringByTrackName(fileName);
		end
	End
	
	if(handle == 0) return ""; end
	
	switch(os_id)
		case 5:
			fread(handle, strOut);
			say("FILE: Lectura realizada");
			//strOut = fgets(handle);
		end
		case 0:
			// reads from the file and puts the data in druppels
			fread(handle, strOut);
		end
	end
            
    
	fclose(handle);                // zipping up after business is done
	
	return TRIM(strOut);
End

Function string getTrackStringByTrackName(string fileName)
Begin
	Switch(fileName)
		case "trk1.btt":
			indices = 13;
			return itoa(indices) + 
				",7.440:75" +
				",9.280:75" +
				",11.127:75" +
				",12.972:75" +
				",14.805:75" +
				",16.634:75" +
				",18.510:75" +
				",20.357:75" +
				",22.178:75" +
				",24.008:75" +
				",24.488:75" +
				",25.170:75" +
				",25.397:75";
		end
	End
End

/*Function string StringFormat(string sVal,  aArgs)
	Dim i
	For i=0 To UBound(aArgs)
		sVal = Replace(sVal,"{" & CStr(i) & "}",aArgs(i))
	Next
	StringFormat = sVal
End Function*/