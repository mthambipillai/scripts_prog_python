def bonjour(nom):
	print("Bonjour " + nom + "!")

prenoms = ["Marc", "Jean", "Patricia", "Louise", "Audré", "Marlène", "Victor", "Sophia"]
index = 0
while (index < len(prenoms)):
	bonjour(prenoms[index])
	index = index + 1