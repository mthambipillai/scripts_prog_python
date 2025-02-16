correct = False
while (correct == False):
	answer = input("Quelle est l'unité de mesure de la fréquence d'échantillonage du son ? ")
	if (answer == "Hz" or answer == "Hertz"):
		correct = True
		print("Juste!")
	else:
		print("Faux!")