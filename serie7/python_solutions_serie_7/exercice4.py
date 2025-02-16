tab = [5.2, 8.3, 12.0, 15.1, 16.3, 22.0, 28.3, 30.05, 23.4, 14.2, 10.3, 7.6]
somme = 0
index = 0
while (index < 12):
	somme = somme + tab[index]
	index = index + 1
moyenne = somme/12
print("Température moyenne annuelle : " + str(moyenne))