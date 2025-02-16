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
check exercice1.py "" "1 2 3 4*98 99 100" "100 99 98*4 3 2 1"
validate_exercice exercice1.py

passed=true
check exercice2.py "" "100 99 98*4 3 2 1" "1 2 3 4*98 99 100"
validate_exercice exercice2.py

passed=true
check exercice3.py "" "Décollage dans 20 secondes...*Décollage dans 2 secondes... Décollage dans 1 seconde... Décollage !" "Décollage dans 1 secondes..."
validate_exercice exercice3.py

passed=true
check exercice4.py "" "2 4 6 8*96 98 100"
validate_exercice exercice4.py

passed=true
check exercice5.py "3" "3 6 9*96 99" "102"
check exercice5.py "7" "7 14 21*70 77" "140"
validate_exercice exercice5.py

passed=true
check exercice6.py "200" "1 2 3*100*199 200" "201"
check exercice6.py "7" "1 2 3 4 5 6 7" "8"
validate_exercice exercice6.py

passed=true
check exercice7.py "7\n100" "7 14 21 28 35 42 49*91 98" "105"
check exercice7.py "3\n10" "3 6 9" "0"
check exercice7.py "221\n1104" "221 442 663 884" "1105"
check exercice7.py "221\n1105" "221 442 663 884 1105" "1326"
validate_exercice exercice7.py

passed=true
check exercice8.py "10" "2 4 8" "16"
check exercice8.py "100" "2 4 8 16 32 64" "128"
check exercice8.py "127" "2 4 8 16 32 64" "128"
check exercice8.py "128" "2 4 8 16 32 64 128" "256"
check exercice8.py "2000" "2 4 8 16 32 64 128 256 512 1024" "2048"
validate_exercice exercice8.py

passed=true
check exercice9.py "" "5050" "5051"
validate_exercice exercice9.py

passed=true
check exercice10.py "9" "45" "55"
check exercice10.py "10" "55" "45"
check exercice10.py "11" "66" "45"
check exercice10.py "100" "5050" "45"
validate_exercice exercice10.py

passed=true
check exercice11.py "1\n9" "45" "55"
check exercice11.py "2\n9" "44" "45"
check exercice11.py "3\n11" "63" "66"
check exercice11.py "0\n10" "55" "45"
check exercice11.py "10\n100" "5005" "5050"
validate_exercice exercice11.py













