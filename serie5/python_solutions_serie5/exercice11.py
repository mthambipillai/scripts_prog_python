debut = int(input("Calculer la somme des nombres depuis: "))
limite = int(input("Calculer la somme des nombres jusqu'à: "))
nombre = debut
somme = 0
while (nombre <= limite):
	somme = somme + nombre
	nombre = nombre + 1
print(somme)