tab = [5.2, 8.3, 12.0, 15.1, 16.3, 22.0, 28.3, 30.05, 23.4, 14.2, 10.3, 7.6]
index_mois = int(input("Donnez le numéro du mois dont vous voulez connaitre la température: "))
if (index_mois < 1 or index_mois > 12):
	print("Vous devez donner un mois entre 1 et 12")
else:
	temp = tab[index_mois - 1]
	print("La température au " + str(index_mois) + "e mois est de " + str(temp))