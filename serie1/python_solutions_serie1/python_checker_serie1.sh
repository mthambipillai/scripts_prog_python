RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

for name in john blablabla xxxxxxxxx aline12;do
	echo "Test de exercice1.py avec '$name'..."
	result=$(printf "$name" | python3 exercice1.py)
	if [ "$result" != "Quel est votre nom? Bonjour $name !" ]; then
		echo "${RED}ERREUR: le résultat attendu était 'Bonjour $name !'.${NC}"
	  	exit 1
	fi
done
echo "${GREEN}exercice1.py est correct !${NC}"

echo "Test de exercice2.py avec 'bateau + blabla + asdf'..."
result=$(printf "bateau\nblabla\nasdf" | python3 exercice2.py)
if [[ "$result" != *"Les 6 combinaisons possibles sont: "* ]]; then
	echo "${RED}ERREUR: l'affichage doit commencer exactement par 'Les 6 combinaisons possibles sont: '.${NC}"
	exit 1
fi
for combination in bateaublablaasdf \
bateauasdfblabla \
blablabateauasdf \
blablaasdfbateau \
asdfbateaublabla \
asdfblablabateau;
do
	if [[ "$result" != *"$combination"* ]]; then
	echo "${RED}ERREUR: le résultat ne contient pas toutes les possibilités.${NC}"
	exit 1
fi
done
echo "${GREEN}exercice2.py est correct !${NC}"