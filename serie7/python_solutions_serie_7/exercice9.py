n1 = float(input("Donnez votre moyenne en français: "))
n2 = float(input("Donnez votre moyenne en maths: "))
n3 = float(input("Donnez votre moyenne en allemand: "))
n4 = float(input("Donnez votre moyenne en anglais: "))
notes = [n1, n2, n3, n4]
minimum = n1
maximum = n1
i = 0
somme = 0

while (i < len(notes)):
	note = notes[i]
	somme = somme + note
	if (note < minimum):
		minimum = note
	if (note > maximum):
		maximum = note
	i = i + 1

moyenne = somme / len(notes)

print("Votre pire note est " + str(minimum))
print("Votre meilleure note est " + str(maximum))
print("Votre moyenne est " + str(moyenne))