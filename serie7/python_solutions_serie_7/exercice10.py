def afficher_tableau(mon_tableau):
	index = 0
	while (index < len(mon_tableau)):
		print(str(index + 1) + ") " + mon_tableau[index])
		index = index + 1

inventaire = []
coffre1 = ["une clé", "un parchemin", "une lampe de poche"]
print("Vous trouvez un coffre qui contient:")
afficher_tableau(coffre1)

choix = int(input("Que voulez vous-prendre ?"))
index_choisi = choix - 1
objet = coffre1[index_choisi]
inventaire.append(objet) # permet d'ajouter un élément dans un tableau
del coffre1[index_choisi] # permet de supprimer un élément d'un tableau

print("\nLe coffre contient maintenant:")
afficher_tableau(coffre1)

print("\nVotre inventaire contient maintenant:")
afficher_tableau(inventaire)