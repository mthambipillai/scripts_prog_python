age = int(input("quel est votre age ?"))
if (age < 18):
	autorisation = input("autorisation ?")
	if (autorisation == "oui" or autorisation=="Oui"):
		montant = int(input("combien d'argent ?"))
		if (montant < 30):
			print("Montant insuffisant: " + str(montant))
		else:
			print("Montant restant: " + str(montant - 30))
	else:
		print("Pas autorisé. Doit être majeur ou avoir une autorisation parentale.")
else:
	montant = int(input("combien d'argent ?"))
	if (montant < 30):
		print("Montant insuffisant: " + str(montant))
	else:
		print("Montant restant: " + str(montant - 30))