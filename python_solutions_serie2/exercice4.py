nb_str = input("Donner un nombre de bits total pour stocker des valeurs: ")
nb = int(nb_str)
total_valeurs = 2 ** nb
print("On peut stocker " + str(total_valeurs) + " valeurs différentes sur " + nb_str + " bits.")