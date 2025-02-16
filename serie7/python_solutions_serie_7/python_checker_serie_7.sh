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
prenoms=("Elisabeth" "Jeanne" "Yohan" "Rita" "Olivia" "Maïna" "Engjellushe" "Noée" "Tom" "Anastasia" "Axel" "Laksmiga" "Martim" "Serafyma" "Imane" "Eva" "Brian" "Erisa" "Nila" "Elouan" "Genita" "Roxy" "Rebekka" "Zina")
expected_output=""
for ((i = 0; i < ${#prenoms[@]}; i++)); do
	expected_output+="${prenoms[$i]}*"
done
check exercice1.py "" "${expected_output}"
validate_exercice exercice1.py

passed=true
prenoms=("Elisabeth" "Jeanne" "Yohan" "Rita" "Olivia" "Maïna" "Engjellushe" "Noée" "Tom" "Anastasia" "Axel" "Laksmiga" "Martim" "Serafyma" "Imane" "Eva" "Brian" "Erisa" "Nila" "Elouan" "Genita" "Roxy" "Rebekka" "Zina")
noms=("Anikouchine" "Bastide" "Bellino Mignone" "Campigotto" "Cline" "Durgnat" "Elezaj" "Faria" "Hartmann" "Kaltsa" "Levy" "Lingeswaran" "Marques De Oliveira" "Mykhaylyuk" "Paraiso" "Parmentier" "Pittier" "Rashani" "Robert-Nicoud" "Searty" "Shala" "Steiner" "Stocker" "Stoll")
expected_output=""
for ((i = 0; i < ${#prenoms[@]}; i++)); do
	expected_output+="${prenoms[$i]} ${noms[$i]}*"
done
check exercice2.py "" "${expected_output}"
validate_exercice exercice2.py

passed=true
tab=(5.2 8.3 12.0 15.1 16.3 22.0 28.3 30.05 23.4 14.2 10.3 7.6)
expected_output="Température au 1er mois : ${tab[0]}*"
for ((i = 1; i < ${#tab[@]}; i++)); do
	month=$((i+1))
	expected_output+="Température au ${month}e mois : ${tab[$i]}*"
done
check exercice3.py "" "${expected_output}"
validate_exercice exercice3.py

passed=true
check exercice4.py "" "Température moyenne annuelle : 16.0625"
validate_exercice exercice4.py

passed=true
expected_output=""
tab=(-987 4710 3006 200 1904)
for i in "${!tab[@]}"; do
	index=$((4-i))
	expected_output+="Contenu du tableau à l'index ${index} : ${tab[$i]}*"
done
check exercice5.py "" "${expected_output}"
validate_exercice exercice5.py


passed=true
tab = [5.2, 8.3, 12.0, 15.1, 16.3, 22.0, 28.3, 30.05, 23.4, 14.2, 10.3, 7.6]
check exercice6.py "0" "Vous devez donner un mois entre 1 et 12"
check exercice6.py "1" "La température au 1e mois est de 5.2"
check exercice6.py "12" "La température au 12e mois est de 7.6" "La température au 12e mois est de 10.3"
check exercice6.py "13" "Vous devez donner un mois entre 1 et 12"
check exercice6.py "20" "Vous devez donner un mois entre 1 et 12"
check exercice6.py "7" "La température au 7e mois est de 28.3" "La température au 7e mois est de 30.5"
check exercice6.py "4" "La température au 4e mois est de 15.1" "La température au 4e mois est de 16.3"
validate_exercice exercice6.py

passed=true
check exercice7.py "" "Le plus petit nombre du tableau est: -987"
validate_exercice exercice7.py

passed=true
check exercice8.py "" "Le plus grand nombre du tableau est: 43012"
validate_exercice exercice8.py

passed=true
check exercice9.py "5\n5\n5\n5" "Votre pire note est 5*Votre meilleure note est 5*Votre moyenne est 5"
check exercice9.py "2\n5\n6\n5" "Votre pire note est 2*Votre meilleure note est 6*Votre moyenne est 4.5"
check exercice9.py "2\n6\n1\n1" "Votre pire note est 1*Votre meilleure note est 6*Votre moyenne est 2.5"
validate_exercice exercice9.py

passed=true
check exercice10.py "1" "Le coffre contient maintenant:*1) un parchemin*2) une lampe de poche*Votre inventaire contient maintenant:*1) une clé"
check exercice10.py "2" "Le coffre contient maintenant:*1) une clé*2) une lampe de poche*Votre inventaire contient maintenant:*1) un parchemin"
check exercice10.py "3" "Le coffre contient maintenant:*1) une clé*2) un parchemin*Votre inventaire contient maintenant:*1) une lampe de poche"
validate_exercice exercice10.py

passed=true
check exercice11.py "" "La porte s'ouvre.*La porte s'ouvre.*La porte s'ouvre.*Vous n'avez aucun objet pour ouvrir la porte."
validate_exercice exercice11.py







