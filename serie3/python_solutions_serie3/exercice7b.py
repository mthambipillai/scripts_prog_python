age = int(input("Âge? "))

if (age < 18):
	autorisation = input("Autorisation parentale? ")
	if (autorisation == "oui" or autorisation == "Oui"):
		valid = True
	else:
		valid = False
else:
	valid = True

if (valid):
	total = int(input("Combien d'argent avez-vous? "))
	if (total >= 30):
		print("Montant restant: " + str(total - 30))
	else:
		print("Montant insuffisant: " + str(total))
else:
	print("Pas autorisé. Doit être majeur ou avoir une autorisation parentale.")
