inventaire1 = ["tournevis", "carte", "potion", "clé", "bâton"]
inventaire2 = ["carte", "potion", "clé"]
inventaire3 = ["tournevis", "bâton"]
inventaire4 = ["potion", "bâton"]

def ouverture_porte(inventaire):
	# le mot-clé 'in' permet de vérifier si une valeur est inclue ou non dans un tableau.
	if (("tournevis" in inventaire) or ("clé" in inventaire)):
		print("La porte s'ouvre.")
	else:
		print("Vous n'avez aucun objet pour ouvrir la porte.")

ouverture_porte(inventaire1)
ouverture_porte(inventaire2)
ouverture_porte(inventaire3)
ouverture_porte(inventaire4)