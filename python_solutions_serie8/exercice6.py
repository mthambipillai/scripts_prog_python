def carré(nombre):
	return nombre * nombre
def cube(nombre):
	return nombre ** 3

def carré_tableau(tableau):
	index = 0
	while (index < len(tableau)):
		tableau[index] = carré(tableau[index])
		index = index + 1
	return tableau

def cube_tableau(tableau):
	index = 0
	while (index < len(tableau)):
		tableau[index] = cube(tableau[index])
		index = index + 1
	return tableau

choix = input("Voulez-vous calculer le carré (2) ou le cube (3) de vos nombres?")

tab = [104, 200, 36, 470, -97, 23, 18, 74, 9, -4]
index = 0

if (choix == "2"):
	tab = carré_tableau(tab)
else:
	if (choix == "3"):
		tab = cube_tableau(tab)
	else:
		print("Vous devez choisir 2 ou 3.")

print(tab)