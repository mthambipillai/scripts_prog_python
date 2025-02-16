RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

path=${1%/}
path=${path:-"."}
mode=${2:-"fail_fast"}
passed=false

function check() {
	script_name="$path/$1"
	input_value=$2
	expected_output=$3
	expected_output2=$4
	echo "Test de $script_name avec '${input_value//\\n/ , }'..."
	result=$(printf "$input_value" | python3 "$script_name")
	if [[ "$result" != *"$expected_output"* ]]; then
		echo "${RED}ERREUR: le résultat attendu doit contenir '$expected_output'.${NC}"
	  	fail
	fi
	if [ ! -z "$expected_output2" ]; then
		if [[ "$result" != *"$expected_output2"* ]]; then
			echo "${RED}ERREUR: le résultat doit contenir '$expected_output2'.${NC}"
		  	fail
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
check exercice1.py "200\n199" "True"
check exercice1.py "50\n10" "True"
check exercice1.py "4\n10" "False"
check exercice1.py "8\n8" "True"
validate_exercice exercice1.py


passed=true
check exercice2.py 2008 "Juste!"
check exercice2.py 1950 "Faux."
validate_exercice exercice2.py


passed=true
check exercice3.py 1963 "Juste!"
check exercice3.py 1900 "Faux. Vous êtes à 63 années de la réponse correcte."
check exercice3.py 2000 "Faux. Vous êtes à 37 années de la réponse correcte."
validate_exercice exercice3.py


passed=true
for x in "utf8" "utf-8" "UTF8" "UTF-8";do
	check exercice4.py "$x" "Juste!" 
done
check exercice4.py "utf 8" "Faux."
validate_exercice exercice4.py


passed=true
check exercice5.py "admin\n9501" "Vous êtes connecté en tant qu'admin."
check exercice5.py "admin\n1234" "Nom d'utilisateur ou mot de passe incorrect."
check exercice5.py "user\n9501" "Nom d'utilisateur ou mot de passe incorrect."
check exercice5.py "abc\nxyz" "Nom d'utilisateur ou mot de passe incorrect."
validate_exercice exercice5.py

passed=true
check exercice6.py 14 "0 CHF"
check exercice6.py 15 "0.75 CHF"
check exercice6.py 40 "2.0 CHF"
check exercice6.py 60 "5 CHF"
check exercice6.py 119 "5 CHF"
check exercice6.py 120 "10 CHF"
check exercice6.py 180 "15 CHF"
validate_exercice exercice6.py


passed=true
check exercice7.py "18\n30" "Montant restant: 0"
check exercice7.py "21\n29" "Montant insuffisant: 29"
check exercice7.py "17\nOui\n40" "Montant restant: 10"
check exercice7.py "17\noui\n30" "Montant restant: 0"
check exercice7.py "17\noui\n0" "Montant insuffisant: 0"
check exercice7.py "12\nNon" "Pas autorisé. Doit être majeur ou avoir une autorisation parentale."
validate_exercice exercice7.py





