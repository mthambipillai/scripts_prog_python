logged_in = False
while (logged_in == False):
	username = input("Nom d'utilisateur: ")
	password = input("Mot de passe: ")
	if (username == "admin" and password == "1234"):
		logged_in = True
		print("Vous êtes connecté en tant qu'admin.")
	else:
		print("Nom d'utilisateur ou mot de passe incorrect")