tab = [1904, 200, 3006, 4710, -987, 12, 45, 764, -54, 0, 43012]
maximum = tab[0]
index = 1
while (index < len(tab)):
	if (tab[index] > maximum):
		maximum = tab[index]
	index = index + 1
print("Le plus grand nombre du tableau est: " + str(maximum))