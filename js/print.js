Prince.addScriptFunc("bengcounter", function(n) {
	var num2Beng = {0: "০",1: "১",2: "২",3: "৩",4: "৪",5: "৫",6: "৬",7: "৭",8: "৮",9: "৯"};
	for (var x in num2Beng) {
	   n = n.replace(
	      new RegExp(x, "g"),
	      num2Beng[x]
	   );
	}
   return n;
});

Prince.addScriptFunc("coptcounter", function(asciiNumberString) {

	
	const copticOnes = ['Ⲁ', 'Ⲃ', 'Ⲅ', 'Ⲇ', 'Ⲉ', 'Ⲋ', 'Ⲍ', 'Ⲏ', 'Ⲑ']

	n = asciiNumberString.length - 1;
	if( n % 2 == 0) {
		asciiNumberString = '0' + asciiNumberString;
		n++;
	}
	for(place = n; place >= 0; place--) {
		// initalize
		asciiOne = asciiTen = ethioOne = ethioTen = '';
		asciiTen = asciiNumberString[n - place];
		place--;
		asciiOne = asciiNumberString[n - place];

		if(asciiOne != '0') {
			ethioOne = asciiOne + ('' - '1')
		}

		if(asciiTen != '0') {
			ethioTen = asciiTen + ('' - '1')
		}

		pos = (place % 4) / 2 //

		sep = ( place != 0) 
				? (pos != 0)
					? ( (ethioOne != '') || ( ethioTen != ''))
						? '?'
						: ''
					: ''
				: ''
		
				if ( (ethioOne == '') && ( ethioTen == '') && ( n > 1 )) {
					if( (sep == '' || ( (place+1) == n)) ) {
						ethioOne = ''
					}
				}
		
			ethioNumberString += ethioOne + ethioOne + sep;
		
		return ethioNumberString;
	}


	var num2Beng = {0: "০",1: "১",2: "২",3: "৩",4: "৪",5: "৫",6: "৬",7: "৭",8: "৮",9: "৯"};
	for (var x in num2Beng) {
	   n = n.replace(
	      new RegExp(x, "g"),
	      num2Beng[x]
	   );
	}
   return n;
});