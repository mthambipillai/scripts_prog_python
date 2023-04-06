def carré(nombre):
	return nombre * nombre
def cube(nombre):
	return nombre ** 3

choix = input("Voulez-vous calculer le carré (2) ou le cube (3) de vos nombres?")

tab = [104, 200, 36, 470, -97, 23, 18, 74, 9, -4]
index = 0

if (choix == "2"):
	while (index < len(tab)):
		tab[index] = carré(tab[index])
		index = index + 1
else:
	if (choix == "3"):
		while (index < len(tab)):
			tab[index] = cube(tab[index])
			index = index + 1
	else:
		print("Vous devez choisir 2 ou 3.")

print(tab)