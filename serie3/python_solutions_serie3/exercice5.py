username = input("Nom d'utilisateur: ")
mot_de_passe = input("Mot de passe: ")

if (username == "admin" and mot_de_passe == "9501"):
	print("Vous êtes connecté en tant qu'admin.")
else:
	print("Nom d'utilisateur ou mot de passe incorrect.")