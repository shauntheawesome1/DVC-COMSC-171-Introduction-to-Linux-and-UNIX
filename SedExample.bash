sed, awk, xargs
Single-line sed and awk scripts are useful for processing text from the command line.

sed – stream editor
A sed command consists of a range, the command name (a single letter), and arguments if apropriate. If the range is absent the command operates on all input lines. By default sed writes all input lines to STDOUT. All  sed commands should be quoted to prevent special characters from being interpreted by the shell.

A few sed options:

-e
edit (command follows)
-f
file (of edit commands, name follows)
-n
do not print
-r
use extended regular expressions
A few sed range specifiers:

/regexp/
command works on all lines matching regexp
/regexp1/,/regexp2/
command works on lines from the first matching regexp1 to the next matching regexp2
A few sed command forms:

s/regexp/string/
substitute string for the first occurrence of regexp on the input line
s/regexp/string/n
substitute string for the nth occurrence of regexp on the input line
s/regexp/string/g
substitute string for all occurrences of regexp on the input line (global)
d
delete the input line
head -n25 /etc/passwd | sed -e 's/shutdown//'   # delete 1st shutdown
head -n25 /etc/passwd | sed -e 's/shutdown/XX/'   # change 1st shutdown to XX
head -n25 /etc/passwd | sed -e 's/shutdown/XX/2'   # change 2nd shutdown
head -n25 /etc/passwd | sed -e 's/shutdown/XX/g'   # every shutdown
head -n25 /etc/passwd | sed -e 's/shutdown/XX/g' -e 's/:/#/g'   # two edits
head -n25 /etc/passwd | sed -e '/false$/s/:/#/g'   # only lines ending false
head -n25 /etc/passwd | sed -e '/false$/!s/:/#/g'   # lines not ending false
head -n25 /etc/passwd | sed -e '/^lp:/,/^ftp:/s/:/#/g'  # range of lines
head -n25 /etc/passwd | sed -e '/^lp:/,/^ftp:/d'   # delete range of lines
