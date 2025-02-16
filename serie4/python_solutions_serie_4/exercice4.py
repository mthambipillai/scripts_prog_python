def carré(n):
	r = n*n
	print("Votre résultat est: " + str(r))

def cube(n):
	r = n*n*n
	print("Votre résultat est: " + str(r))


nombre = int(input("Donne un nombre: "))
choix = input("carré ou cube? ")
if (choix == "2"):
	carré(nombre)
else:
	if (choix=="3"):
		cube(nombre)
	else:
		print("Vous devez choisir 2 ou 3.")