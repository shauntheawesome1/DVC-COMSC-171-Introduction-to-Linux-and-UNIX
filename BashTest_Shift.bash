return codes
ls
echo $?   # return code from previous command, zero if OK, non-zero if error
ls /foo   # error
echo $?
true
echo $?
false
echo $?
string conditional expressions
x=qwerty y=asdfgh   # set some variables for testing

[[ $x == q*y ]]   # string matches wildcard (!= does not match)
echo $?
[[ $x =~ q[ertw]{4}y ]]   # string matches extended regular expression
echo $?
[[ $x > $y ]]   # first string sorts after second (< sorts before)
echo $?
[[ -r /etc/passwd ]]   # file is readable (-w writable, -x executable)
echo $?
[[ -d /etc/passwd ]]   # file is directory (-f data file, -l symbolic link)
echo $?
[[ script1 -nt /etc/passwd ]]   # first file is newer than second (-ot older)
echo $?
[[ a == a && b == b ]]   # logical AND (|| logical OR)
echo $?
[[ ! a == a ]]   # logical NOT
echo $?
arithmetic conditional expressions
a=3 b=8   # set some variables for testing

(( a < b ))  # less than ( > greater than)
echo $?
(( a == b ))  # equal ( != not equal)
echo $?
(( a <= b ))  # less than or equal ( >= greater than or equal)
echo $?
(( a ))   # non-zero
echo $?
(( a - a ))   # zero
echo $?
scripts
You can simplify the edit/run cycle by using an editor to edit your script. To test the code, save your work and then suspend the editor with ^Z. Run the script at the command prompt. Bring back the editor with fg.

Another way is to open two terminal sessions. Run an editor in one and run your script in the other.

cat > script1
#!/bin/bash
echo $0   # script name
echo $1 $2 $3   # $1 is 1st argument, $2 is 2nd argument, etc.
echo $*   # all arguments ($@ does the same)
echo $#   # number of arguments
^D   # end of input
bash script1 first second third   # run with 3 arguments

cat > script2
#!/bin/bash
a=($*)   # assign arguments to an array
echo ${a[9]}
echo ${10}   # you can reference more than 9 arguments with ${}
^D
bash script2 0 1 2 3 4 5 6 7 8 9   # run with 10 arguments

cat > script3
#!/bin/bash
echo $1
shift  # moves 2nd arg to 1st position, 3rd arg to 2nd position, etc
echo $1
shift
echo $1
^D
bash script3 first second third   # run with 3 arguments

rm script[1-3]   # clean up
