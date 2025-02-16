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
check exercice2.py "" "Marc.Duchemin@eduvaud.ch Jean.Favre@eduvaud.ch Patricia.Renaud@eduvaud.ch"
validate_exercice exercice2.py

passed=true
check exercice3.py "x\ny" "x.y@eduvaud.ch"
check exercice3.py "blablabla\nabcd" "blablabla.abcd@eduvaud.ch"
validate_exercice exercice3.py

passed=true
check exercice4.py "4\n2" "16" "64"
check exercice4.py "10\n2" "100" "1000"
check exercice4.py "4\n3" "64" "16"
check exercice4.py "6\n3" "216" "36"
check exercice4.py "45\nasdfh" "Vous devez choisir 2 ou 3."
validate_exercice exercice4.py

passed=true
check exercice5.py "" "Le prix final de 100 CHF avec 10% de rabais est: 90.0 CHF.*Le prix final de 100 CHF avec 50% de rabais est: 50.0 CHF.*Le prix final de 80 CHF avec 25% de rabais est: 60.0 CHF.*Le prix final de 120 CHF avec 15% de rabais est: 102.0 CHF."
validate_exercice exercice5.py

passed=true
check exercice6.py "4\n2" "La surface est de 8 m2."
check exercice6.py "1\n1" "La surface est de 1 m2."
check exercice6.py "20\n4" "La surface est de 80 m2."
check exercice6.py "100\n35" "La surface est de 3500 m2."
validate_exercice exercice6.py

passed=true
check exercice7.py "gauche\nfuir" "Vous prenez la fuite. Vous avez perdu."
check exercice7.py "gauche\ncombattre" "Vous avez battu le monstre. Vous avez gagné!"
check exercice7.py "droite\n2\nfuir" "Vous prenez la fuite. Vous avez perdu."
check exercice7.py "droite\n2\ncombattre" "Vous avez battu le monstre. Vous avez gagné!"
check exercice7.py "droite\n1" "Vous tombez dans une fosse. Vous avez perdu."
check exercice7.py "droite\n3" "Vous tombez dans une fosse. Vous avez perdu."
check exercice7.py "droite\n4" "Vous tombez dans une fosse. Vous avez perdu."
validate_exercice exercice7.py




