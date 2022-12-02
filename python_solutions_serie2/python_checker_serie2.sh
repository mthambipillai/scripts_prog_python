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
for x in 3 12 1000 47;do
	check exercice1.py $x "Le carré du nombre $x est: $(($x * $x))"
done
validate_exercice exercice1.py



passed=true
check exercice2.py "3\n6\n1" "Votre moyenne est: 3.3333333333"
check exercice2.py "5.2\n5.3\n5.2" "Votre moyenne est: 5.2333333"
check exercice2.py "4\n3\n2" "Votre moyenne est: 3.0"
validate_exercice exercice2.py



passed=true
check exercice3.py "3\n3" "Le nombre 3 à la puissance 3 est: 27"
check exercice3.py "52\n12" "Le nombre 52 à la puissance 12 est: 390877006486250192896"
validate_exercice exercice3.py




passed=true
for x in 3 6 10 12;do
	check exercice4.py $x "On peut stocker $((2 ** $x)) valeurs différentes sur $x bits."
done
validate_exercice exercice4.py



passed=true
check exercice5.py "13456" "13456 bytes = 13.456 KB (valeur exacte)" "13456 bytes = 13 KB (valeur arrondie)"
check exercice5.py "120056" "120056 bytes = 120.056 KB (valeur exacte)" "120056 bytes = 120 KB (valeur arrondie)"
validate_exercice exercice5.py





