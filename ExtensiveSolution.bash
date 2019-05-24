hd() {  # arg string (delim 1 or more spaces)
        # returns string head (1st word) 
  local trimlead="${1#${1%%[^ ]*}}"  # inner expansion is all leading spaces
  echo "${trimlead%% *}"  # trim space after 1st word and subsequent chars
}

tl() {  # args string (delim 1 or more spaces); integer count (optional)
        # returns string tail (all but count words from beginning)
  local trimlead="${1#${1%%[^ ]*}}"  # inner expansion is all leading spaces
  [[ "${trimlead}" == "${trimlead#* }" ]] && return  # last word
  (( ${2:-1} < 2 )) && echo "${trimlead#* }" && return  # 2nd arg absent or 1
  tl "${trimlead#* }" $(( $2 - 1 ))  # recursive call with leading word trimmed
}

readlines() {  # args: integer longest; string (lines of input)
               # returns: integer longest; string (lines of input)
  typeset -i longest=$1
  if IFS="" read -r Line ; then
    (( ${#Line} > $longest )) && longest=${#Line}
    readlines ${longest} "$2"$'\n'"${Line}"  # recursive call
  else
    echo -n ${longest} "$2"
  fi
}

calc() {  # args: integer sum, count; string (words split on spaces)
          # returns: integer sum, count
  typeset -i Sum=$1 Count=$2
  [[ ! "$3" ]] && echo ${Sum} ${Count} && return  # done, no string arg
  local Word="$(hd "$3")"
  [[ "${Word}" =~ ^[+-]?[0-9]+$ ]] && (( Sum+=Word )) && (( ++Count ))  # int
  calc ${Sum} ${Count} "$(tl "$3")"  # recursive call with tail
}

printlines() {  # args: string (longest, lines of input)
                # returns: string (longest, lines of input)
  typeset -i Longest="${1%%$'\n'*}"  # head (trim 1st NL and subsequent chars)
  local InputStr="${1#*$'\n'}"  # tail (trim chars through 1st NL)
  [[ "$InputStr" != *$'\n'* ]] && return  # done, no NL
  local Line="${InputStr%%$'\n'*}"  # head
  local Numbers="$(tl "${Line}" 2)"  # after 2 text fields
  local Result="$(calc 0 0 "${Numbers}")"  # call with initial values
  local Sum=$(hd "${Result}") Count=$(tl "${Result}")
  if (( Count > 0 )) ; then  # avoid divide by zero
    printf "%-${Longest}s%6d%4d\n" "${Line}" ${Sum} $(( (Sum+Count/2)/Count ))
  else
    echo "$Line"  # no calculations
  fi
  printlines "${Longest}"$'\n'"${InputStr#*$'\n'}"  # recursive call with tail
}

printlines "$(readlines)"
