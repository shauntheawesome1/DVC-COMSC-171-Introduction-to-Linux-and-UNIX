vi
vi (Visual Interactive) is a screen editor based on the previous ex line editor. It was written in C for size and speed and is well suited to editing programs. The original code was copyrighted by AT&T so open source operating systems come with newer variants. A vi compatible editor is required for compliance with UNIX standards.

Slackware includes the variants vim and elvis. Slackware 14.2 links ex to vim and vi to elvis though vim seems to work better. Most other Linux distributions use vim.

screen
The screen shows a portion of the text in the buffer, plus a line at the bottom for information and for typing commands. Non-existent lines are indicated with a ~ character in the left column (these are not saved).

modes
vi operates in three different modes:

command
used to enter screen editor commands which execute immediately
vi starts in this mode
line
used to enter ex line editor commands which execute after <Enter>
input
used to input text
These keys change modes:

command to line
:  /  ?
line to command
<Enter>
command to input
a  A  i  I  o  O  R
input to command
<Esc>
configuration
cat > .vimrc  # create configuration file (classic vi uses .exrc)
set showmode  # shows an insert mode indicator
^D
startup
cp /etc/passwd pass3  # make a working copy you can write
cp /etc/group group3  # make a working copy of another file
cp /etc/fstab fstab3  # make a working copy of another file
vim pass3  # start vim and load pass3
cursor movement
j  # down l for right, k for up, h for left
e  # end of word
w  # word right
b  # word left
<Enter>  # next line
$  # end line
0  # (zero) begin line
^  # (caret) first nonblank character on line
^F  # next screen
^B  # previous screen
G  # last line (end of buffer)
1G  # 1st line (beginning of buffer)
command repetition
5w  # right 5 words
search
/00  # forward search
/  # repeat search forward
?  # repeat search backward
recenter
^L  # redraw screen
z.  # redraw, current line to center (z+ to top, z- to bottom)
input
a  # add text after cursor
foo  # type these characters
<Esc>
0  # (zero)
i  # insert text at cursor
bar  # type these characters
<Esc>
R  # replace (overwrite mode)
qux  # type these characters
<Esc>
delete
1G
5j
w
x  # delete character at cursor
X  # delete character left
dw  # delete word
d$  # delete to end line
dd  # delete entire line
4dd  # delete 4 lines (down)
J  # join the current line and the line below
cut, copy, paste
1G
yy  # copy entire line (no visible change)
10j
p  # paste last copy
1G
5j
20l  # (two, zero, lowercase L) right 20 spaces
ma  # set mark a (26 possible marks, a through z)
5j
5h
d`a  # (backquote, unshifted ~) delete to mark a
1G
p
1G
5j
20l  # (two, zero, lowercase L) right 20 spaces
ma
5j
5h
y`a  # (backquote, unshifted ~) copy to mark a
1G
p
undo
u  # single-level undo on classic vi, multi-level on vim
u  # undo previous undo on classic vi, undo second-previous command on vim
replace
1G
:s/:/#/g  # substitute (search and replace) current line
:%s/:/#/g  # all lines
macros
:map  # show macros
:map #1 o^V<Esc>j<Enter>  # maps macro to F1 key
<F1>  # (F1 key) execute macro
:unmap #1  # remove macro
buffers (vim)
g
dd
5j
dd  # cuts of 1 line or more are saved in buffers numbered 1 through 9
"2p  # paste 2nd most recent cut
g
"add  # cuts or copies may be saved to buffers named a through z
5j
dd
dd
"ap  # named buffers may be pasted at any time
:e group3  # edit file (opens new buffer)
5yy  # copy 5 lines
:b pass3  # switch buffer
p  # paste
:w  # write (save)
:e fstab3
:bd  # delete (current) buffer
variables
:set  # show only values different from default
:set all  # shows all values
:set ai  # autoindent (new line indents to same as previous line)
1G
o
   foo  # type these characters (3 leading spaces)
<Enter>
# the cursor will be under the first printing character
<Esc>  # command mode
:set nu  # number (shows line numbers)
:set nonu  # unset nu
:set nu?  # shows variable value
files
:r /etc/fstab  # read a file into the edit buffer (under current line)
:w pass4  # save as
ZZ  # (or :wq) save and exit

rm pass3 pass4  # clean up
