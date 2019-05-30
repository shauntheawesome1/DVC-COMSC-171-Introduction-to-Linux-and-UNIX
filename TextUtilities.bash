head & tail ‐ first or last lines
head /etc/passwd   # first ten lines
head -n5 /etc/passwd   # first five lines
tail /etc/passwd   # last ten lines
tail -n5 /etc/passwd   # last five lines
fold – word wrap
head /etc/services | fold -w20   # wrap lines at width 20 columns
head /etc/services | fold -w20 -s   # wrap lines at width 20 columns, on spaces
pr – format for print
head /etc/services | fold -w20 -s | pr -t -2   # no headers/trailers, 2 columns
head /etc/services | fold -w20 -s | pr -t -3 -o4   # 3 columns, 4-space margins
head /etc/services | fold -w20 -s | pr -t -3 -n   # line numbers
head /etc/services | fold -w20 -s | pr -t -3 -d   # doublespace
cut – extract columns
tail -n25 /etc/passwd | cut -f1 -d:   # output 1st field, delimiter :
tail -n25 /etc/passwd | cut -f1,3-7 -d:   # output all except 2nd field
tail -n25 /etc/passwd | cut -c1-6   # output 1st through 6th characters
tail -n25 /etc/passwd | cut -c1-6 | uniq   # remove consecutive duplicate lines
tail -n25 /etc/passwd | cut -c1-6 | uniq -c   # count unique lines
tail -n25 /etc/passwd | cut -c1-6 | uniq -d   # show only duplicate lines
grep – extract lines which match a regular expression
head -n25 /etc/passwd | grep 'spool'   # output lines containing spool
head -n25 /etc/passwd | grep 'd-bus'   # nothing found
head -n25 /etc/passwd | grep -i 'd-bus'   # case insensitive
head -n25 /etc/passwd | grep -C 1 'spool'   # context (before & after) 1 line
head -n25 /etc/passwd | grep -B 2 'spool'   # context (before) 2 lines
head -n25 /etc/passwd | grep -A 2 'spool'   # context (after) 2 lines
head -n25 /etc/passwd | grep '[0-9][0-9]'   # two consecutive numerals
head -n25 /etc/passwd | grep '[0-9].*[0-9]'   # two numerals anywhere
head -n25 /etc/passwd | grep ':$'   # ending with :
head -n25 /etc/passwd | grep -v ':$'   # not ending with :
head -n25 /etc/passwd | grep '^s'   # (literal ^ and s) beginning with s
head -n25 /etc/passwd | grep '^[a-m]'   # beginning with a character in set
head -n25 /etc/passwd | grep '^[^a-m]'   # beginning with a character not in set
head -n25 /etc/passwd | grep '^[^:][^:][^:]:'   # first field three characters
head -n25 /etc/passwd | grep -E '^[^:]{3}:'   # extended regexp, multiplier
head -n25 /etc/passwd | grep -E '^([^:]*:){3}[0-9]{2}:'   # () group, 2-digit GID
head -n25 /etc/passwd | grep '[[:upper:]]'   # character class, only inside [ ]
sort
head /etc/passwd | sort   # output lines sorted in ASCII order
head /etc/passwd | sort -r   # reverse order
head /etc/passwd | sort -t: -k4   # sort from 4th field to end, delimiter :
                                  # default delimiter is space-to-nonspace transition
head /etc/passwd | sort -t: -k4n   # numeric (integer)
head /etc/passwd | sort -t: -k4g   # general numeric (also floating point)
head /etc/passwd | sort -t: -k4,4n -k1r   # 4th field only, then 1st field
head /etc/passwd | sort -k1.4   # from 4th char of line (1st and only field)
head /etc/passwd | sort -k1.4 -d   # dictionary order (ignores punctuation)
head -n20 /etc/passwd | sort -k5   # look for uppercase letters
head -n20 /etc/passwd | sort -k5f   # case insensitive (fold lower to upper)
tr – translate one set of characters to another
tail -n25 /etc/passwd | tr 0: 9,   # translate all 0 to 9 and all : to ,
tail -n25 /etc/passwd | tr '[:lower:]' '[:upper:]'   # character classes
tail -n25 /etc/passwd | tr -s :   # squeeze : (remove consecutive duplicates)
tail -n25 /etc/passwd | tr -d 9   # delete 9
tail -n25 /etc/passwd | tr -d '\r'   # delete CR (no visible change)
