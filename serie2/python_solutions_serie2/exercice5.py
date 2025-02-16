nb_bytes_str = input("Donner un nombre de bytes à convertir en KB: ")
nb_bytes = int(nb_bytes_str)
nb_kb = nb_bytes / 1000.0
nb_kb_arrondi = nb_bytes // 1000
print(nb_bytes_str + " bytes = " + str(nb_kb) + " KB (valeur exacte)")
print(nb_bytes_str + " bytes = " + str(nb_kb_arrondi) + " KB (valeur arrondie)")