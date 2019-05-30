while
cat > script1
typeset -i x=$1     # initialize x to value of 1st arg
while (( $x < $2 ))   # loop while x is less than value of 2nd arg
  do echo $x   # beginning of loop code block (indenting improves readability)
  (( ++x ))   # increment x
done   # end of loop
^D
bash script1 1 10   # loops from 1 to 9
bash script1 1 0   # no output, $x begins with a value greater than 0
until
cat > script2
typeset -i x=$1
until (( $x > $2 ))   # loop until x is greater than value of 2nd arg
  do echo $x
  (( ++x ))
done   # end of loop
^D
bash script2 1 10   # loops from 1 to 10
bash script2 1 0   # no output, $x begins with a value greater than 0
break
cat > script3
typeset -i x=0
while (( $x < 10 ))
  do (( ++x ))
  if (( x == 6 ))   # test for x equal to 6
    then break   # jump out of loop, don't echo 6 through 9
  fi
  echo $x
done   # end of loop
^D
bash script3   # loops from 1 to 5
continue
cat > script4
typeset -i x=0
while (( $x < 10 ))
  do (( ++x ))
  if (( x == 6 ))
    then continue   # jump to end of this iteration, don't echo 6
  fi
  echo $x
done   # end of loop
^D
bash script4   # loops from 1 to 5, 7 to 9
for (with explicit list)
cat > script5
for arg in q w e r t y   # loop through list of values
  do echo $arg   # print values one at a time
done   # end of loop
^D
bash script5
for (with computed list)
cat > script6
count=0   # initialize
for arg in /usr/local/*   # list of values can be computed
  do ((++count))
  echo $count. $arg   # print numbers before the values
done   # end of loop
^D
bash script6
for (C-style)
cat > script7
for (( x=0 ; x<10 ; ++x ))
  do echo $x
done
^D
bash script7
clean up
rm script[1-7]
