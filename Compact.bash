Longest=0  # length of longest input line

while IFS='' read Line ; do  # read input lines without processing
  (( ${#Line} > $Longest )) && Longest=${#Line}  # update longest line
  LineArr+=("${Line}")
done

for Elem in "${LineArr[@]}" ; do  # each line
  FieldArr=(${Elem})
  Fields=0  # count of numeric fields
  Sum=0  # sum of numeric fields
  for Field in ${FieldArr[@]:2} ; do  # 3rd field to end
    [[ ${Field} =~ ^[+-]?[0-9]+$ ]] && (( ++Fields )) && (( Sum+=Field ))  # int
  done  # next line checks for numbers, does arithmetic, and prints in columns
  (( Fields == 0 )) &&  echo "${Elem}" || \
  printf "%-${Longest}s%6d%4d\n" "${Elem}" ${Sum} $(( (Sum+Fields/2)/Fields ))
done  # each line loop
