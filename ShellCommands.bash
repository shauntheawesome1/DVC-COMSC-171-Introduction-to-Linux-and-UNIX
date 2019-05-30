Variables
export   # shows global (exported) variables
set   # shows all variables
set | less   # pipe output of set to input of less
q   # quit less
export PAGER=/usr/bin/pg   # assign a value, mark as global
man man   # now paged with pg rather than less (different prompt)
q <Enter>   # quit the pg pager
Test1=foo   # assign a string value to a variable
echo $Test1   # substitute the value of the variable, show the result
Test2=$(whoami)   # substitute the output of a command
echo $Test2
set   # look for Test1 and Test2
unset Test1 Test2   # remove definitions
set   # look for Test1 and Test2
Substutution & Quoting
echo $PS1   # show your primary command prompt string
OLDPS1=$PS1   # save your existing command prompt
PS1=date$
PS1=$(date)$
PS1=$(date)$\    # IMPORTANT - put a space after the \
PS1="$(date)$ "
echo $PS1   # shows the string you assigned above (substitution done)
PS1='$(date)$ '
echo $PS1   # shows the string you assigned above (substitution not done)
PS1=$OLDPS1   # restore your original command prompt
Built-in Commands
type cd   # shows type of command (builtin)
type cat   # pathname of executable file
type ls   # alias (abbreviation)
which ls   # shows path to ls executable
ls -l $(which ls)   # details
time ls   # shows execution time (not time of day)
Alias
alias ll='ls -al'   # (lowercase LL) this creates an alias (abbreviation)
ll   # this should give you a long listing of all files
alias   # this shows all currently defined aliases
unalias ll   # remove the alias
ll   # error message
Options
set -o   # this will show your options
set -o ignoreeof   # prevents ^D from logging you out
^D   # this won't work now, but exit and logout will
set -o noclobber   # prevents redirected output from clobbering a file
cat > testfile   # create a file
original   # type this line
^D
cat testfile   # show the contents
cat > testfile   # this won't work now
cat testfile   # show the contents
cat >> testfile   # this is OK, appends rather than overwrites
appended   # type this line
^D
cat testfile
set +o noclobber   # unset the option
cat > testfile   # now you can clobber the file
clobbered   # type this line
^D
cat testfile
Redirect Input
mail -s 'test' $USER < testfile   # email a file by redirecting input
# read email with alpine
cat > testfile < /dev/null   # overwrite with nothing
cat testfile
Redirect Error
ll 2> err   # redirect error messages
cat err
ll 2> /dev/null   # discard
rm err   # clean up
Configuration
less /etc/profile   # system-wide defaults for Bourne shell family
q   # quit less when done
# Warning! Type the next lines exactly as written.
cat >> .profile   # file of commands for Bourne shell family to run at login
PATH=$PATH:/sbin:/usr/sbin   # list of directories to search for commands
^D
cp .profile .bashrc   # file of commands for bash subshells to run at startup
