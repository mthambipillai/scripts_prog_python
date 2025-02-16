def prix_final(prix_initial, rabais):
	prix = prix_initial - prix_initial*(rabais/100)
	print("Le prix final de " + str(prix_initial) + " CHF avec " + str(rabais) + "% de rabais est: " + str(prix) + " CHF.")

prix_final(100, 10)
prix_final(100, 50)
prix_final(80, 25)
prix_final(120, 15)