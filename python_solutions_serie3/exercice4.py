nb_minutes = int(input("Nombre de minutes de stationnement : "))

if (nb_minutes < 15):
	cout = 0
else:
	if (nb_minutes < 60):
		cout = nb_minutes * 0.05
	else:
		cout = (nb_minutes // 60) * 5

print(str(cout) + " CHF")