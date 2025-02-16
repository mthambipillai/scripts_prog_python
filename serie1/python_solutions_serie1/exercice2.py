mot1 = input("Entrez le premier mot: ")
mot2 = input("Entrez le deuxième mot: ")
mot3 = input("Entrez le troisième mot: ")
ordre123 = mot1 + mot2 + mot3
ordre132 = mot1 + mot3 + mot2
ordre213 = mot2 + mot1 + mot3
ordre231 = mot2 + mot3 + mot1
ordre312 = mot3 + mot1 + mot2
ordre321 = mot3 + mot2 + mot1
print("Les 6 combinaisons possibles sont: " + ordre123 + ", " + ordre132
 + ", " + ordre213 + ", " + ordre231 + ", " + ordre312 + ", " + ordre321 + ".")