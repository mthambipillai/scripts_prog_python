def carré(nombre):
	return nombre * nombre
def cube(nombre):
	return nombre ** 3

nombre = float(input("Donnez un nombre"))
choix = input("Voulez-vous calculer le carré (2) ou le cube (3) de votre nombre?")
if (choix == "2"):
	print("Votre résultat est : " + str(carré(nombre)))
else:
	if (choix == "3"):
		print("Votre résultat est : " + str(cube(nombre)))
	else:
		print("Vous devez choisir 2 ou 3.")