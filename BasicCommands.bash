# Typography & Comments
# Lines beginning with # are comments - don't type these lines.
# <Enter>  refers to the key labelled Enter
# ^C  refers to control-c (hold down <Ctrl>, then press unshifted C).
# All commands are case sensitive.
Control Keys
# the following commands show the effects of some control keys:
sleep 300   # does nothing for 5 minutes
^C   # interrupt sleep 300 and return shell prompt
echo hello ^J   # no <Enter>, ^J (newline) will execute the command
# Pager
less /etc/passwd   # display one screen at a time (like Windows MORE)
f   # forward to next screen (<Space> does the same)
b   # back to previous screen
/10   # search for 10 (numerals)
/   # find next occurrence of 10
G   # go to last screen
g   # go to first screen
h   # help
<Enter>   # next help screen
q   # quit help
q   # quit less
# Manual
man less   # online documentation for the less command, piped through less
# scroll down to read it
q   # quit less when done
man man   # online documentation for the man command, piped through less
q   # quit less when done
man mount   # administration command
q   # quit less when done
man fstab   # some files also have man pages
q   # quit less when done
man -k mail   # keyword, shows commands containing mail in the description
man -k mail | less   # page the output
q   # quit less when done
# Catenate
cat > test   # copy from the keyboard to a file (like Windows COPY CON)
line 1   # type this text
line 2   # type this text
^D   # end of input, this will terminate your input (like Windows ^Z)
cat test   # display the file contents (like Windows TYPE)
List
ls   # list files (like Windows DIR /W)
ls -a   # all - including names beginning with .
ls -l   # long - shows type, mode, links, user, group, size, modification date
ls -d   # lists directory itself, not directory contents
# Wildcards
ls -d /bin/z*   # * wildcard matches zero or more characters
ls -d /bin/??   # ? wildcard matches exactly one character
ls -d /bin/[xz]*   #  [] wildcard matches one of the enclosed characters
ls -d /bin/[x-z]*   # - inside [] matches one of a range of characters
ls -d /bin/*[^a-z]*   # ^ first char inside [] is logical NOT
Directories
mkdir scratch   # make directory (like Windows MD)
ls -al   # this will show your new directory
cd scratch   # change directory (like Windows CD)
pwd   # print working directory
cd   # defaults to home directory
pwd
cd -   # return to previous directory  
pwd
cd
# Copy
cp .bash_history hist   # copy to another file (like Windows COPY)
ls -al
cp .bash_history scratch   # copy to directory
cd scratch
ls -al
cp ~/test .   # copy test in home dir to current dir
ls -al
cp test TEST   # these are different names (UNIX is case sensitive)
ls -al
Move
mv TEST ..   # move (like Windows MOVE) to parent directory
ls -al
ls -al ..
mv test Test   # renames (like Windows REN)
ls -al
# Remove
rm Test   # remove (like Windows DEL)
ls -al
cd
pwd
rm scratch/*   # contents
ls -al scratch   # rm didn't remove files beginning with .
rm scratch/.*
ls -al scratch   # nothing here now
rmdir scratch   # removes empty directory
rm hist test TEST   # clean up
ls -al
