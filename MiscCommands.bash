System Info
hostname  # shows hostname
uname  # shows UNIX name
uname -a  # (all) shows more information
uptime  # shows how long system has been running and CPU load averages

quota  # shows disk quota (if any) on your account
df -h  # shows disk space free in each mounted filesystem, human readable
du -hs /etc  # shows disk space used in specified directory
             # error messages from insufficient permissions
du -ks /etc 2> /dev/null  # kilobytes, discards error messages

free  # shows memory use (Linux only)
vmstat  # shows virtual memory use
less /proc/meminfo  # detailed memory info
q  # quit less
less /proc/cpuinfo  # detailed CPU info
q  # quit less
ls /proc  # lots of interesting stuff
Dates
date  # shows time and date
date +%s  # seconds since epoch (Jan 1 1970), many other format options
cal  # shows calendar for current month
cal 10 2018  # shows calendar for Oct 2018
cal 2018 | less  # shows calendar for all of 2018 CE
q  # quit less
cal 10 | less  # shows calendar for all of 10 CE
q  # quit less
Non-Printing Characters
cat > test.bin  # type the following ten characters (without <Enter>)
^A^BXYZZY^G^I^J  # five control characters
^D
cat test.bin  # shows printing characters
od -t a test.bin  # shows non-printing character names
od -t c test.bin  # shows non-printing character codes
od -t d1 test.bin  # shows 1-byte characters as decimal numbers
od -t d2 test.bin  # shows 2-byte characters as decimal numbers
od -t x1 test.bin  # shows 1-byte characters as hexadecimal numbers

strings test.bin  # shows strings of 4 or more consecutive printing characters
strings -n6 test.bin  # 6 or more consecutive printing characters (none here)
User Info
users  # shows users logged in
who  # shows users logged in
w  # shows uptime, users logged in, and what they're doing
finger $USER  # this shows information about you
chfn  # (change full name) enter your password and full name when prompted
      # just press the <Enter> key after the other prompts
cat > .plan  # write a .plan file
# type a few lines of information about yourself
^D  # terminate cat command
finger $USER  # now shows the full name and .plan
finger  # this shows every user logged in
finger stuart  # this shows another user
whoami  # shows your login name
id  # shows UserID, GroupID, and groups
last | less  # shows recent logins
q  # quit less
File Utilities
tree /usr | less  # list in tree format
q  # quit less when done
tree -d /usr | less  # show directories only
q  # quit less when done
tree -L 1 /usr | less  # (numeral 1) show 1 level only
q  # quit less when done

wc /etc/passwd  # count lines, words, characters
wc -l /etc/passwd  # lines only
wc -w /etc/passwd  # words only
wc -c /etc/passwd  # chars only
wc -L /etc/passwd  # length of longest line

file /etc/fstab  # ASCII text
file /bin/gunzip  # shell script
file /bin/ls  # ELF 32-bit LSB executable (binary)
file /usr/man/man1/less.1.gz  # gzip compressed data (man page for less)

cat > foo-0  # create a file (original)
line 1
lime 2  # misspelled
^D
cat > foo-1  # create another file (new and improved)
line 1
line 2  # corrected
^D
diff foo-0 foo-1  # show differences between two files (line editor format)
diff foo-0 foo-1 | tee foo-0-1.diff  # create update file
# tee shows output and also saves it to a file
patch foo-0 foo-0-1.diff  # update original file
cat foo-0  # shows update
rm foo* test.bin  # clean up
