define
repeat() {  # define a function, no spaces between name and ( and )
  typeset -i count=0   # local variables (not known outside function)
  while (( $count < $2 ))
    do (( ++count ))
    echo $1
  done
}  # end of definition

function fact {  # another way to define a function, no ()
  (( $1 <= 1 )) && echo 1 && return  # logic works like if, return terminates
  echo $(( $1 * $( fact $(( $1 - 1 )) ) ))  # recursive, fact(n) = n*fact(n-1)
}
call
typeset  # shows your functions
repeat abc 3  # call by typing name and args like any other command
fact 6  # calculates 6 factorial
save
cat > functions   # put two functions in a file
double() {
  echo $1$1
}
triple() {
  echo $1$1$1
}
^D
use saved functions
source functions  # run in current environment
typeset  # shows your two functions
double x
triple x
typeset -fx double  # export one function
bash  # start another shell
typeset  # shows only your exported function
double x
triple x   # error, not here
exit  # quit second shell

rm functions  # clean up
