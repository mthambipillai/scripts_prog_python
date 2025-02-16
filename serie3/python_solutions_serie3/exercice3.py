annee = int(input("En quelle année ASCII a été créé? "))

if (annee == 1963):
	print("Juste!")
else:
	diff = 1963 - annee
	if (diff < 0):
		diff = -1 * diff
	print("Faux. Vous êtes à " + str(diff) + " années de la réponse correcte.")