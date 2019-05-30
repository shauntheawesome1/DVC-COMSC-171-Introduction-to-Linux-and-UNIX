length
Str=/usr/local/bin/delay.tcl  # input for the following lines
echo ${#Str}  # length of scaler variable
escapes
echo foo$'\t'bar  # tab
echo "$foo$'\t'bar"  # literal inside " "
echo "$foo"$'\t'"bar"  # OK this way
echo foo$'\n'bar  # newline
substrings
echo ${Str:4}  # from 5th character (0 based) to end
echo ${Str:0:4}  # from 1st character, count 4 characters
echo ${Str: -9}  # (space required) from last character, count 9 characters
strip leading and trailing substrings
echo ${Str#/*/}  # strips shortest match from beginning
echo ${Str##/*/}  # strips longest match from beginning
echo ${Str%/*}  # strips shortest match from end
echo ${Str%%/*}  # strips longest match from end

Str=$(echo ${Str%/*}) ; echo $Str  # change a variable
Str=$(echo ${Str%/*}) ; echo $Str  # again
Str=$(echo ${Str%/*}) ; echo $Str  # again
search and replace
echo ${Str/l/L}  # search (shell wildcard) and replace first match
echo ${Str//l/L}  # search (shell wildcard) and replace all matches
formatted output
The printf command formats and prints data. It is available as a both a bash builtin and a standalone executable. The first argument is a format string, usually in double quotes. Characters in the format string are literal except C escapes beginning with \ and placeholders beginning with %. Placeholders contain a type, usually d for decimal or s for string. The type may be preceded by flags, like - for left justify, then minimum width. Each placeholder formats one argument.

Num1=11 ; Num2=22
Str1=foo ; Str2=foobar

printf "%d\n" $(( Num1+Num2 ))  # one decimal arg, newline
printf "Str1 is %s\n" $Str1  # text, one string arg, newline
printf "Str1 is %12s\n" $Str1  # width 12, right justified
printf "Str1 and Str2 are %12s%12s\n" $Str1 $Str2  # two args
printf "Str1 and Str2 are %12s%-12s\n" $Str1 $Str2  # 2nd arg left justified
external utilities
# use double quotes around variables to preserve spaces
# use single quotes around regular expressions

Str=/usr/local/bin/delay.tcl  # input for the following lines

basename "$Str"  # strips directories, leaves file name
basename "$Str" .tcl  # strips directories and ending string
dirname "$Str"  # strips file name, leaves directories

Regexp='.*bin/'  # regular expression
expr match "$Str" "$Regexp"  # returns length of Regexp beginning Str
                             # returns 0 if no match
Str2='abc'  # string of characters to match
expr index "$Str" "$Str2"  # returns index of first match of any char in Str2
                           # in Str (1 based)
                           # returns 0 if no match
