emacs
emacs (Editor Macros) is a full-featured, programmable text editor written in a version of Lisp. The user interface is designed to work on character terminals, though a GUI is also supported.

jargon
buffer
memory area containing text being edited
point
cursor location in a buffer
mark
saved location in a buffer
region
characters between the mark and the point (can be operated on by many commands)
kill ring
multi-level structure which stores deleted, cut, or copied text longer than 1 character
screen
window
shows a portion of the text in a buffer
mode line at the bottom shows status information
minibuffer
last line, shows messages and provides space for typing commands
commands
Commands are entered using the <Ctrl> and <Esc> keys in 4 different ways:

<Ctrl> keys
<Esc> combinations
hit and release <Esc>, then hit the following key,
or hold the Meta key (<Alt> on a PC keyboard), then hit the following key
<Ctrl> combinations, commonly beginning with <Ctrl> x
hit and release the <Ctrl> key, then hit the following key(s)
<Esc> x command-name
for commands not mapped to keystrokes
configuration
cat > .emacs  # create configuration file (optional)
(define-key global-map "\C-H" 'backward-delete-char)   # override help
(setq make-backup-files nil)   # turn off auto backup
(setq column-number-mode t)   # show column numbers
(setq scroll-conservatively 1)   # scroll by line instead of by half screen
(setq inhibit-startup-screen t)   # no startup screen
(electric-indent-mode 0)   # disable new indentation feature
^D
startup
cp /etc/passwd pass1   # make a working copy you can write
cp /etc/group group1  # make a working copy of another file
cp /etc/fstab fstab1  # make a working copy of another file
emacs pass1   # start emacs and load pass1
cursor movement
^N   # next line
^F   # forward (right)
^P   # previous line
^B   # back (left)
^E   # end of line
^A   # beginning of line
<Esc> m   # first nonblank character on line
^V   # next screen
<Esc> f   # forward 1 word
<Esc> b   # back 1 word
<Esc> v   # previous screen
<Esc> >   # end of buffer
<Esc> <   # beginning of buffer
incremental search
<Esc> <   # move to top of buffer
^S   # search forward
1   # find next 1
0   # find next 10
^S   # find next 10 (repeat search)
0   # find next 100
<Enter>   # terminate search, leave cursor where it is
^R   # reverse search
1   # find previous 1
^R   # find previous 1 (repeat search)
0   # (zero) find previous 10
<Bksp>   # remove last character from search, return to last 1 found
1   # (one) find previous 11
^G   # abort search, or any uncompleted command
delete
^A
^D   # delete character at cursor
^E
<Bksp>   # delete character left
^N
^A
^K   # delete to end of line
^K   # delete blank line
<Esc> d   # delete word
<Esc> 3 ^F   # forward 3 spaces
^K   # delete to end of line
^K   # nonblank line not deleted, but line below joined
cut, copy, paste
^A
^K
<Esc> 5 ^N   # down 5 lines
^K
<Esc> 5 ^N
^Y   # yank (paste) last delete
^Y   # yank same delete again
<Esc> y   # yank previous delete
<Esc> 20 ^F   # right 20 spaces
^<Space>   # (or ^@) set mark
<Esc> 5 ^N   # down 5 lines
^W   # delete (cut) from mark to character left of cursor
<Esc> <
^Y   # yank last delete
<Esc> X set-mark
<Esc> 5 ^N
<Esc> w   # copy from mark to character left of cursor
^Y   # yank last copy
^A
<Esc> X set-mark
<Esc> 5 ^N
<Esc> 20 ^F
^X ^X   # exchange mark and point
^X ^X
^X r k   # kill rectangle defined by mark and character left of cursor
^X r y   # yank rectangle, replacing what you just killed
<Esc> 5 ^N
<Esc> 20 ^F
^X r y   # yank rectangle again
command repetition
<Esc> 2 ^N   # cursor down 2 lines
recenter
<Esc> 10 ^N
^L   # recenter (and redraw) screen
input
# type the following lines and hit <Enter> after each:
line one
line two
^A
<Insert>   # (insert key, or <Esc> x overwrite-mode) overwrite mode
foo   # type these characters
<Insert>   # (insert key, or <Esc> x overwrite-mode) back to insert mode
bar   # type these characters
undo
^X u   # undo
^X u   # undo again (multi-level)
replace
<Esc> <   # move to top of buffer
<Esc> x replace-string
: <Enter>   # search string
# <Enter>   # replacement string
<Esc> <   # move to top of buffer
<Esc> x replace-regexp
h$ <Enter>   # search regex
H <Enter>   # replacement string
macros
<Esc> <   # move to top of buffer
^X (   # start macro definition
^E   # end line
<Enter>   # (enter key) new line
^N   # next line
^X )   # end macro definition
^X e   # execute macro
buffers
^X ^F group1   # find file (opens new buffer)
<Esc> 5 ^K   # delete five lines
^X b pass1   # switch buffer
^Y   # paste
^X ^F fstab1
^X k   # kill buffer
windows
^X 2   # split screen top/bottom
^X b pass1   # switch buffer
^V   # next screen
^X o   # (lowercase O) other window
<Esc> v   # previous screen
^X 0   # (zero) delete window
^X 3   # split screen side-to-side
^X b group1   # switch buffer
^X o   # other window
^X 0   # (zero) delete window
files
^X i group1   # insert file
^X ^S   # save
^X ^W pass2   # write to pass2 (save as)
^X ^C   # save and exit

rm fstab1 group1 pass1 pass2   # clean up
