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