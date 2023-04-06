contacts_noms = []
contacts_numéros = []

def lister_contacts():
	index = 0
	print("----------------------------")
	while(index < len(contacts_noms)):
		print(contacts_noms[index] + " : " + contacts_numéros[index])
		index = index + 1
	print("----------------------------")

def ajouter_contact():
	nom = input("Nom du nouveau contact ")
	numéro = input("Numéro du nouveau contact ")
	contacts_noms.append(nom)
	contacts_numéros.append(numéro)
	print(nom + " : " + numéro + " ajouté.")

choix = ""
while (choix != "Q"):
	choix = input("L pour lister les contacts. A pour ajouter un contact. Q pour quitter.")
	if (choix == "L"):
		lister_contacts()
	if (choix == "A"):
		ajouter_contact()
print("Au revoir")