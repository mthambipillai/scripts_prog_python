answer = ""
while (answer != "Hz" and answer != "Hertz"):
	answer = input("Quelle est l'unité de mesure de la fréquence d'échantillonage du son ? ")
	if (answer == "Hz" or answer == "Hertz"):
		print("Juste!")
	else:
		print("Faux!")