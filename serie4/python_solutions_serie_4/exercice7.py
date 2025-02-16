def monstre():
	choix = input("Vous vous trouvez face à un monstre! Voulez-vous fuir ou combattre? ")
	if (choix == "fuir"):
		print("Vous prenez la fuite. Vous avez perdu.")
	elif (choix == "combattre"):
		print("Vous avez battu le monstre. Vous avez gagné!")


choix = input("Vous vous trouvez face à deux portes. Laquelle choisissez-vous ? Celle de gauche ou celle de droite? ")
if (choix == "gauche"):
	monstre()
elif (choix == "droite"):
	choix = input("Vous arrivez dans une salle avec quatre portes numérotées de 1 à 4. Laquelle choisissez-vous? ")
	if (choix == "2"):
		monstre()
	else:
		print("Vous tombez dans une fosse. Vous avez perdu.")