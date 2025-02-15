### JAVA VERSIONS
#export JAVA_HOME='/c/Program Files/Java/jdk1.7.0_80/'
#export JAVA_HOME='/C/Users/Utente/.jdks/corretto-1.8.0_342/'
#export JAVA_HOME='/C/Users/Utente/.jdks/corretto-11.0.19/'
export JAVA_HOME='/C/Users/Utente/.jdks/corretto-17.0.7/'
#export JAVA_HOME='/C/Users/Utente/.jdks/corretto-21.0.2/'
export PATH=$JAVA_HOME/bin:$PATH

export OTHER='123'
#export OTHER='678'

switch_variable() {
	if [[ -z "$1" || -z "$2" ]]; then
		echo "Use: $FUNCNAME <variable> <pattern_to_find_out>"
		return 1
	fi

	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	BASHRC_FILE="${BASH_SOURCE[0]}"
	
	source ${SCRIPT_DIR}/switch_variables.sh "${BASHRC_FILE}" "$1" "$2" 
}


switch_java() {
	if [ -z "$1" ]; then
		echo "Use: $FUNCNAME <java_version>"
		return 1
	fi

	switch_variable "JAVA_HOME" "$1"
}
