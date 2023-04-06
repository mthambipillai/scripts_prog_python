def login(nom, mot_de_passe):
	if (nom == "admin" and mot_de_passe == "9876"):
		return 1
	else:
		return 0


nom = input("nom: ")
mdp = input("mot de passe: ")
if (login(nom, mdp) == 1):
	print("Bienvenue!")
else:
	print("Nom ou mot de passe incorrect. Vous avez encore 1 essai.")
	nom = input("nom: ")
	mdp = input("mot de passe: ")
	if (login(nom, mdp) == 1):
		print("Bienvenue!")
	else:
		print("Nom ou mot de passe incorrect. Compte bloqué.")