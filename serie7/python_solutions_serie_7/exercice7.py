tab = [1904, 200, 3006, 4710, -987, 12, 45, 764, -54, 0, 43012]
minimum = tab[0]
index = 1
while (index < len(tab)):
	if (tab[index] < minimum):
		minimum = tab[index]
	index = index + 1
print("Le plus petit nombre du tableau est: " + str(minimum))
