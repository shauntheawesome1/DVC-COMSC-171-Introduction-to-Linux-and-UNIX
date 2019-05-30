wk – programming language
An awk statement consists of a pattern followed by an action. If the pattern is present the action operates on all matching input lines. If the pattern is absent the action operates on all input lines. If the action is absent the default operation is write to STDOUT. All awk statements should be quoted to prevent special characters from being interpreted by the shell.

A few elements of awk syntax:

-F
followed by the input field separator character (default whitespace)
#
comment follows to end of line
BEGIN
selection, before any input lines are read
END
selection, after all input lines are read
/  /
enclose extended regular expression
{  }
enclose action
"  "
enclose string
;
separates commands
$ (followed by a number)
variable containing input field ($1 for 1st field, $2 for 2nd field, $0 for entire line)
~  !~
string pattern match operators
==  >  <  >=  <=  !=
numeric relational operators
&&  ||  !
logical operators AND, OR, NOT
=  +=  -=
assignment operators
FS
variable containing input field separator
OFS
variable containing output field separator
RS
variable containing input record separator
ORS
variable containing output record separator
NF
variable containing number of fields in current line
NR
variable containing number of records read
print
writes to STDOUT
length(string)
returns number of characters in string
substr(string,position)
returns part of string from position (1-based) to end
substr(string,position,count)
returns count characters of string starting from position (1-based)
gsub(regexp,string)
substitue string for all occurrences of rexexp in $0
gsub(regexp,string,var)
substitue string for all occurrences of rexexp in var
&
(in string argument of gsub)
characters which matched regexp argument
head -n25 /etc/passwd | awk -F: '{print $3, $1}'  # 2 fields, in order
head -n25 /etc/passwd | awk -F: '{OFS = ":"; print $3, $1}'  # : field separator
head -n25 /etc/passwd | awk -F: '{print $1, $(NF)}'  # first and last fields
head -n25 /etc/passwd | awk -F: '$1 ~ /^....$/ {print $3, $1}'  # 4-char name
head -n25 /etc/passwd | awk -F: '$1 ~ /^....$/ {print $3 + 1000, $1}'  # UID
head -n25 /etc/passwd | awk -F: '$4 == 100 {print $3 + 1000, $1}'  # GID=100
head -n25 /etc/passwd | awk -F: '$4 == 100 {$3 += 1000} {print $3, $1}'  # print all
head -n25 /etc/passwd | awk -F: '$3 < $4 {print $3, $4, $1}'  # UID < GID
head -n25 /etc/passwd | awk -F: '$3 < 10 {$4 = $3; print $0}'  # new GID

  cat /etc/passwd | awk -F: 'length($5) > 16 {print $0}'  # long full name

S=abcd1234  # input for following statements
echo $S | awk '{sub("d","X"); print $0}'  # substitute
echo $S | awk '{sub(/[a-z]/,"X"); print $0}'  # use regular expression
echo $S | awk '{gsub(/[a-z]/,"X"); print $0}'  # global
echo $S | awk '{gsub(/[a-z]/,"&X"); print $0}'  # & is what matched regex
echo $S | awk '{print substr($0,5)}'  # substring beginning with char 5
echo $S | awk '{print substr($0,5,2)}'  # beginning with char 5, 2 chars
