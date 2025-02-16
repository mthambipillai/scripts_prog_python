tab = [5.2, 8.3, 12.0, 15.1, 16.3, 22.0, 28.3, 30.05, 23.4, 14.2, 10.3, 7.6]
print("Température au 1er mois : " + str(tab[0]))
index = 1
while (index < 12):
	print("Température au " + str(index + 1) + "e mois : " + str(tab[index]))
	index = index + 1