nb_essais = 3
logged_in = False
while (logged_in == False and nb_essais > 0):
	username = input("Nom d'utilisateur: ")
	password = input("Mot de passe: ")
	if (username == "admin" and password == "1234"):
		logged_in = True
		print("Vous êtes connecté en tant qu'admin.")
	else:
		nb_essais = nb_essais - 1
		if (nb_essais > 0):
			print("Nom d'utilisateur ou mot de passe incorrect. Plus que " + str(nb_essais) + " essais.")
		else:
			print("Nom d'utilisateur ou mot de passe incorrect. Votre compte est bloqué.")