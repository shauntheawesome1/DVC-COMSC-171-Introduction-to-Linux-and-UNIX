Job Control
more /etc/passwd   # don't page through the file; stay on the first screen
^Z   # this will suspend more and return to the shell
less /etc/fstab   # again don't page through the file
^Z   # suspend less
pg /etc/inittab   # again don't page through the file
^Z   # suspend pg
ps   # shows your processes with Process IDs
jobs   # shows background jobs with status and job numbers
       # + indicates current job, - indicates previous job
fg   # this will bring the current job [3] to the foreground
^Z   # suspended it again
fg 2   # this will bring job [2] to the foreground (%2 also works)
^Z   # suspended it again
%1   # this will bring job [1] to the foreground
^Z   # suspended it again
%pg   # this will show the job named pg
<Enter>   # bring it to the foreground
^Z   # suspended it again
Processes & Signals
# in Windows [OS X] open another PuTTY [Terminal] window, connect, and login again
tty   # this will show the name of the tty (terminal) for this session
ps   # this will show your processes in the current session
ps ax   # shows all processes (BSD options without -)
ps U $USER   # shows all processes of a specified user (BSD)
ps u   # user listing format (BSD)
ps l   # long listing format (BSD)
ps -e   # shows every process (UNIX options with -)
ps -f   # full format (UNIX)
ps -u $USER  # shows all processes of a specified user (UNIX)
kill -l    # (lowercase L) list available signals
kill -9 PID   # !!! put the Process ID (number) of pg where it says PID
ps -u $USER   # shows you have killed a process in another session
jobs   # this will only show jobs in the current shell (none)
Background
# in Windows [OS X] click in the other PuTTY [Terminal] window
delay.tcl 120 &   # tcl script (not part of UNIX) which waits for 120 seconds
                  # the & will put delay.tcl in the background
jobs
fg
^C   # terminate delay.tcl
Other Terminal
tty
ps -u $USER   # remember the PID (number) of the other shell (on the other tty)
kill -9 PID  # put the PID (number) of bash where it says PID
             # this will send a kill signal and log you out of the other session
ps -u $USER
Nohup
nohup delay.tcl 300 &   # no hangup, runs in the background even after logout
ps -u $USER
logout   # gives error message if you have stopped jobs
logout   # repeating the command will log you out anyway
# login again
jobs   # the new shell has no background jobs
ps -u $USER   # shows delay.tcl still running
kill -9 PID  # put the PID (number) of delay.tcl where it says PID
ps -u $USER   # shows delay.tcl is gone
Related Commands
killall
sends signals to process names rather than to process IDs
pkill, pgrep
combine functions of ps, grep, kill to search for processes and send signals
screen, tmux
terminal multiplexers
