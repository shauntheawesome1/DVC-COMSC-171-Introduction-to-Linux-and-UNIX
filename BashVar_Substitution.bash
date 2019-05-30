x=foo   # assign a (string) value)
echo x   # write a literal x to STDOUT
echo $x   # write the value of the variable x to STDOUT
echo ${x}   # same as above, { } used to remove ambiguity

x='\s\t\u'
echo $x
echo -e $x   # enable escapes (\t is <Tab>)
echo -n $x   # no newline

read x   # read a line from STDIN, assign to a variable
foo bar   # type these characters, then <Enter>
echo $x

read x
   foo   bar   # type these characters (3 leading, 3 interior spaces), then <Enter>
echo $x
echo "$x"   # preserves interior spaces

IFS='' read x   # set internal field separator to null
   foo   bar   # type these characters (3 leading, 3 interior spaces), then <Enter>
echo "$x"   # preserves leading (and trailing) spaces

read y z   # two variables
foo   # type these characters (1 word), then <Enter>
echo $y   # 1st word of input
echo $z   # null

read y z
foo bar   # type these characters (2 words), then <Enter>
echo $y
echo $z

read y z
foo bar baz   # type this input (3 words), then <Enter>
echo $y   # 1st word of input
echo $z   # all remaining input

read x
a\b\c   # type these 5 characters, then <Enter>
echo $x   # \ characters interpreted as escapes
read -r x   # disable escapes
a\b\c   # type these 5 characters, then <Enter>
echo $x   # \ characters preserved
read -N2 x   # number of characters, then <Enter>
a\b\c   # type these 5 characters, read terminates after 2 characters
^C   # erase extra characters typed after read terminated
echo $x   # 2 characters
arithmetic substutution
typeset -i a=8 b=3   # set two integer variables
echo $(( a + b ))  # add, $ not required inside $((  ))
echo $(( $a - $b ))   # subtract
echo $(( $a * $b ))   # multiply
echo $(( $a / $b ))   # divide (integer)
echo $(( $a % $b ))   # modulus (remainder)
echo $(( $a ** $b ))   # power
echo $(( 1000 ** 3 ))   # OK
echo $(( 1000 ** 7 ))   # oops, integer overflow with no warning
echo $(( -a ))   # negation (no space after -)

(( ++a ))   # increment (no space after ++)
echo $a
(( --a ))   # decrement (no space after --)
echo $a
(( a += b ))   # same as (( a = a + b ))
echo $a
(( a -= b ))   # same as (( a = a - b ))
echo $a

echo $(( 1 + 2 * 3 ))   # precedence
echo $(( ( 1 + 2 ) * 3 ))   # grouping
arrays
A=(foo bar baz qux)   # define an array, assign 4 elements
echo ${A[0]}   # first element, {} required here, zero-based index
echo ${A[-1]}   # last element (-2 is next to last, etc)
echo ${A[*]}   # all elements (single value)
echo ${A[@]}   # all elements (separate values)
echo ${#A[@]}   # length (number of elements)
echo ${!A[@]}   # all indexes (useful for iterating over an array)
A[2]=zzz   # reassign third element
echo ${A[@]}
A+=(aaa)   # append element
echo ${A[@]}
n=0
echo ${A[n]}   # variable OK as index
echo ${A[n+1]}   # arithmetic expression OK as index
echo ${A[@]:1}   # :i gives from index i to last
echo ${A[@]:1:2}   # :i:j gives from index i count j
command substitution
cat /etc/passwd | wc -l   # count lines
z=$( cat /etc/passwd | wc -l )   # assign command output to a variable
echo $z
cat /etc/passwd | wc   # count lines, words, and characters
z=$( cat /etc/passwd | wc )
echo $z   # entire output is one value
z=($( cat /etc/passwd | wc ))   # array
echo ${z[2]}   # array element
execute a script
L=foo   # local variable
export G=bar   # global variable
cat > script1   # create a script (use an editor if you prefer)
#!/bin/bash
# the previous shebang line defines bash as the script interpreter
echo $L
echo $G
^D

cat script1
bash script1   # execute in a subshell, does not show local variable
source script1   # execute in current shell, does show local variable
. script1   # same as above
chmod u+x script1   # set execute permission
./script1   # execute directly in a subshell

rm script1   # clean up
