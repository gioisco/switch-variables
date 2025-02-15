#!/usr/bin/env bash

FILE="$1"
VAR_ENV="$2"
PATTERN="$3"

check_parameters() {
	if [[ -z "$FILE" || -z "$VAR_ENV" || -z "$PATTERN" ]]; then
	  echo "Use: source ${BASH_SOURCE[0]} <file_to_looking_for> <env_variable> <pattern>"
	  return 1
	fi
	return 0
}

if ! check_parameters; then
  if (return 0 2>/dev/null); then
    return 1
  else
    exit 1
  fi
fi


text=$(cat "$FILE")

normalize_all() {
	sed "s/^[[:space:]]*export $1/export $1/" "$FILE"
	sed "s/^[[:space:]]*#[[:space:]]*export $1/#export $1/" "$FILE"
}


comment_all() {
	sed -i "s/^[[:space:]]*export $1/#export $1/" "$FILE"
}


decomment_if_matches() {
	local VAR_ENV=$1
	local PATTERN=$2
	#echo "VAR_ENV: $VAR_ENV" > /dev/tty
	#echo "PATTERN: $PATTERN" > /dev/tty
	matches=$(grep "^[[:space:]]*.*export ${VAR_ENV}=.*${PATTERN}" "$FILE")
	num_matches=$(echo -n "$matches" | grep -c '^')
	#echo "matches: $matches" > /dev/tty
	#echo "num_matches: $num_matches" > /dev/tty
	if [ $num_matches -eq 0 ]; then
		echo "No matches found with: $PATTERN" > /dev/tty
		return -1
	elif [ $num_matches -eq 1 ]; then
		comment_all $VAR_ENV
		sed -i "s/^[[:space:]]*#.*\(export $VAR_ENV=.*$PATTERN.*\)/\1/" "$FILE"
		now=$(grep "^[[:space:]]*.*export ${VAR_ENV}=.*${PATTERN}" "$FILE")
		was=$(grep "^[[:space:]]*export ${VAR_ENV}=.*" <<< "$text")
		if [ "$now" != "$matches" ]; then
			echo
			#echo "Now: $now" > /dev/tty
			echo "Was: $was" > /dev/tty
		fi
		source "$FILE"
	else
		echo "matches:" > /dev/tty
		echo "$matches" > /dev/tty
		echo
		echo "More then one results. Be more specific." > /dev/tty
		return -1
	fi
}

decomment_if_matches "$VAR_ENV" "$PATTERN"
