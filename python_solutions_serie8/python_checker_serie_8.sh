RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

path=${1%/}
path=${path:-"."}
mode=${2:-"fail_fast"}
passed=false

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
	script_name="$path/$1"
	input_value=$2
	expected_output=$3
	unexpected_output=$4
	echo "Test de $script_name avec '${input_value//\\n/ , }'..."
	result=$(printf "$input_value" | python3 "$script_name")
	match_result=$(match "$expected_output" "$result")
	if [ -z "$match_result" ]; then
		echo "${result}"
		echo "${RED}ERREUR: le résultat attendu doit contenir '$expected_output'.${NC}"
	  	fail
	fi
	if [ ! -z "$unexpected_output" ]; then
		match_result2=$(match "$unexpected_output" "$result")
		if [ ! -z "$match_result2" ]; then
			echo "${RED}ERREUR: le résultat ne doit PAS contenir '$unexpected_output'.${NC}"
			exit 1
		fi
	fi
}

function fail() {
	passed=false
	if [ "$mode" == "fail_fast" ];then
		exit 1
	fi
}

function validate_exercice() {
	exercice_name=$1
	if [ $passed == true ]; then
		echo "${GREEN}$exercice_name est correct !${NC}"
	fi
}


passed=true
check exercice1.py "" "Bonjour Marc! Bonjour Jean! Bonjour Patricia! Bonjour Louise! Bonjour Audré!"
validate_exercice exercice1.py

passed=true
check exercice2.py "" "Bonjour Marc! Bonjour Jean! Bonjour Patricia! Bonjour Louise!*Bonjour Sophia!"
validate_exercice exercice2.py

passed=true
check exercice3.py "4\n2" "16" "64"
check exercice3.py "10\n2" "100" "1000"
check exercice3.py "4\n3" "64" "16"
check exercice3.py "6\n3" "216" "36"
check exercice3.py "45\nasdfh" "Vous devez choisir 2 ou 3."
validate_exercice exercice3.py

passed=true
check exercice4.py "2" "10816 40000 1296 220900 9409 529 324 5476 81 16"
check exercice4.py "3" "1124864 8000000 46656 103823000 -912673 12167 5832 405224 729 -64"
check exercice4.py "45" "Vous devez choisir 2 ou 3."
validate_exercice exercice4.py

passed=true
check exercice5.py "2" "[10816, 40000, 1296, 220900, 9409, 529, 324, 5476, 81, 16]"
check exercice5.py "3" "[1124864, 8000000, 46656, 103823000, -912673, 12167, 5832, 405224, 729, -64]"
check exercice5.py "45" "Vous devez choisir 2 ou 3."
validate_exercice exercice5.py

passed=true
check exercice6.py "2" "[10816, 40000, 1296, 220900, 9409, 529, 324, 5476, 81, 16]"
check exercice6.py "3" "[1124864, 8000000, 46656, 103823000, -912673, 12167, 5832, 405224, 729, -64]"
check exercice6.py "45" "Vous devez choisir 2 ou 3."
validate_exercice exercice6.py

passed=true
check exercice7.py "admin\n9876" "Bienvenue"
check exercice7.py "fauxnom\n9876\nadmin\n9876" "Nom ou mot de passe incorrect*Vous avez encore 1 essai*Bienvenue"
check exercice7.py "admin\nfauxmdp\nadmin\n9876" "Nom ou mot de passe incorrect*Vous avez encore 1 essai*Bienvenue"
check exercice7.py "admin\nfauxmdp\nfaux\nfaux" "Nom ou mot de passe incorrect*Vous avez encore 1 essai*Compte bloqué"
validate_exercice exercice7.py

passed=true
check exercice8.py "A\ntest\n123\nL\nQ" "test : 123*Au revoir"
check exercice8.py "L\nQ" "Au revoir" "test : 123"
check exercice8.py "A\ntest\n123\nA\njean\n9009\nL\nQ" "test : 123*jean : 9009*Au revoir"
validate_exercice exercice8.py

passed=true
check exercice9.py "A\ntest\n123\nL\nQ" "test : 123 ajouté*test : 123*Au revoir"
check exercice9.py "L\nQ" "Au revoir" "test : 123"
check exercice9.py "A\ntest\n123\nA\njean\n9009\nL\nQ" "test : 123*jean : 9009*Au revoir"
check exercice9.py "A\ntest\n123\nM\ntest2\nQ" "test : 123*Ce nom de contact n'existe pas."
check exercice9.py "A\ntest\n123\nM\ntest\n456\nQ" "test : 123 ajouté*test : 456 modifié" "Ce nom de contact n'existe pas."
validate_exercice exercice9.py




