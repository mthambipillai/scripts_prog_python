def surface(longueur, largeur):
	s = longueur*largeur
	print("La surface est de " + str(s) + " m2.")

longueur = int(input("Donnez la longeur en mètres: "))
largeur = int(input("Donnez la largeur en mètres: "))
surface(longueur, largeur)