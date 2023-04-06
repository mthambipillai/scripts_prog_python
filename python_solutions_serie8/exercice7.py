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


def index_du_contact(nom):
	index = 0
	while (index < len(contacts_noms)):
		if (contacts_noms[index] == nom):
			return index
		index = index + 1
	return -1

def modifier_contact():
	nom = input("Nom du contact à modifier ")
	index = index_du_contact(nom)
	if (index == -1):
		print("Ce nom de contact n'existe pas.")
	else:
		numéro = input("Nouveau numéro du contact ")
		contacts_numéros[index] = numéro
		print(nom + " : " + numéro + " modifié.")

choix = ""
while (choix != "Q"):
	choix = input("L pour lister les contacts. A pour ajouter un contact. M pour modifier un contact. Q pour quitter.")
	if (choix == "L"):
		lister_contacts()
	if (choix == "A"):
		ajouter_contact()
	if (choix == "M"):
		modifier_contact()
print("Au revoir")



