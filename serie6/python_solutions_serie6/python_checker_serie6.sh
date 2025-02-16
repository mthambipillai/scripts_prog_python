RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

function match() {
	pattern="$1"
	string_to_match="$2"
	IFS='*' read -ra regex_groups <<< "$pattern"
	regex="s/.*\("
	for i in "${regex_groups[@]}"; do
	  regex+="\($i\).*"
	done
	length=${#regex}
	regex=${regex::length-2}
	regex+="\).*/\1/p"
	echo "$(echo $string_to_match | sed -n "$regex")"
}

function check() {
	script_name=$1
	input_value=$2
	expected_output=$3
	unexpected_output=$4
	echo "Test de $script_name avec '${input_value//\\n/ , }'..."
	result=$(printf "$input_value" | python3 $script_name)
	match_result=$(match "$expected_output" "$result")
	if [ -z "$match_result" ]; then
		echo "${RED}ERREUR: le résultat doit contenir '$expected_output'.${NC}"
		exit 1
	fi
	if [ ! -z "$unexpected_output" ]; then
		match_result2=$(match "$unexpected_output" "$result")
		if [ ! -z "$match_result2" ]; then
			echo "${RED}ERREUR: le résultat ne doit PAS contenir '$unexpected_output'.${NC}"
			exit 1
		fi
	fi
}

check exercice1.py "Hz" "Juste!" "Faux!"
check exercice1.py "fadgafg\nHz" "Faux!*Juste!"
check exercice1.py "fadgafg\nHerz\nHertz" "Faux!*Faux!*Juste!"
echo "${GREEN}exercice1.py est correct !${NC}"

incorrect="Nom d'utilisateur ou mot de passe incorrect."
check exercice2.py "user1\nrandom\nuser2\nrandom\nuser1\nrandom2" "$incorrect"
check exercice2.py "user1\nrandom\nuser2\nrandom\nadmin\n1234" "$incorrect"
check exercice2.py "user1\nrandom\nadmin\n1234" "$incorrect"
check exercice2.py "admin\n1234" \
"Vous êtes connecté en tant qu'admin." "$incorrect"
echo "${GREEN}exercice2.py est correct !${NC}"


incorrect="Nom d'utilisateur ou mot de passe incorrect."
check exercice3.py "user1\nrandom\nuser2\nrandom\nuser1\nrandom2" \
"$incorrect Plus que 2 essais*$incorrect Plus que 1 essai*$incorrect Votre compte est bloqué."
check exercice3.py "user1\nrandom\nuser2\nrandom\nadmin\n1234" \
"$incorrect Plus que 2 essais*$incorrect Plus que 1 essai*Vous êtes connecté en tant qu'admin." "Votre compte est bloqué."
check exercice3.py "user1\nrandom\nadmin\n1234" \
"$incorrect Plus que 2 essais*Vous êtes connecté en tant qu'admin." "Votre compte est bloqué."
check exercice3.py "admin\n1234" \
"Vous êtes connecté en tant qu'admin." "$incorrect"
echo "${GREEN}exercice3.py est correct !${NC}"


check exercice4.py "7" "7 est un nombre premier" "n'est pas un nombre premier"
check exercice4.py "101" "101 est un nombre premier" "n'est pas un nombre premier"
check exercice4.py "7919" "7919 est un nombre premier" "n'est pas un nombre premier"
check exercice4.py "9" "9 n'est pas un nombre premier" "est un nombre premier"
check exercice4.py "81" "81 n'est pas un nombre premier" "est un nombre premier"
check exercice4.py "20472" "20472 n'est pas un nombre premier" "est un nombre premier"
echo "${GREEN}exercice4.py est correct !${NC}"









