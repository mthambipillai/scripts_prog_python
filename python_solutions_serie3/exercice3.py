reponse = input("Quel encodage de texte est le plus courant de nos jours? ")

if (reponse == "UTF8" or reponse == "UTF-8" or reponse == "utf8" or reponse == "utf-8"):
	print("Juste!")
else:
	print("Faux.")