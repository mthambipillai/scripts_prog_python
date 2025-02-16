nombre = int(input("Donnez un nombre entier: "))
i = 2
est_pas_premier = False
while (i < nombre and est_pas_premier == False):
	if (nombre % i == 0):
		print(str(nombre) + " n'est pas un nombre premier.")
		est_pas_premier = True
	i = i + 1

if (est_pas_premier == False):
	print(str(nombre) + " est un nombre premier.")