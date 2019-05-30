if
cat > script1
if [[ $1 == *[A-Za-z]* ]]   # test if first parameter contains a letter
  then echo alpha   # if true print alpha (indenting improves readability)
fi   # end of if
^D
bash script1 xyx   # run it with an alpha argument
bash script1 123   # run it with a non-alpha argument cd
if – else
cat > script2
if [[ $1 == *[A-Za-z]* ]]   # test if first parameter contains a letter
  then echo alpha   # if so print alpha
else
  echo non-alpha   # if not print non-alpha
fi
^D
bash script2 xyz   # run it with an alpha argument
bash script2 123   # run it with a non-alpha argument
if – elif – else
cat > script3
if [[ $1 == *[A-Za-z]* ]]   # test if first parameter contains a letter
  then echo alpha   # if so print alpha
elif [[ $1 == *[0-9]* ]]   # if not, test if first parameter contains a numeral
  then echo numeric   # if so print numeric
else
  echo other   # if not print other
fi
^D
bash script3 abc   # run it with an alpha argument
bash script3 123   # run it with a numeric argument
bash script3 ...   # run it with some other argument
if (without conditional expression)
cat > script4
if cd $1   # successful command returns true, unsuccessful returns false
  then echo OK   # if true
else echo NG   # if false
fi
^D
bash script4 /etc   # should be OK
bash script4 /etc/foo   # error, directory doesn't exist
case
cat > script5
case ${0##*/} in   # this substitution strips directories from script name $0
  add)  op='+'  ;;   # each case begins with pattern) and ends with ;;
  sub)  op='-'  ;;
  mul)  op='*'  ;;
  div)  op='/'  ;;
  *)    echo Oops, I do only 4 functions   # print error message
        exit 1  ;;   # terminate script with non-zero return code
esac   # end of case
echo $(( $1 $op $2 ))   # print calculation result
^D

ln script5 add   # give this script more names
ln script5 sub
ln script5 mul
ln script5 div

bash add 10 2   # run the script using different names
bash sub 10 2
bash mul 10 2
bash div 10 2
bash script5 10 2   # error

rm script[1-5] add sub mul div   # clean up
