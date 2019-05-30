mkdir gnu   # for download
ftp -p ftp.gnu.org   # -p is passive mode, required by some firewalls
# if prompted login as anonymous or ftp
# some anonymous sites request a password, usually an email address, null OK
# you should then see the ftp> prompt
navigation
ls   # remote list files
cd gnu   # remote change directory, Free Software Foundation files here
pwd   # remote print working directory
lcd gnu   # local change directory
ls   # too many files for one screen
ls =*   # specify files with a wildcard
ls . gnu-dir   # save directory listing to local file gnu-dir
ls . |less   # pipe directory listing to local command less (no space after |)
q   # (quit less with when done)
switches
binary   # image (not ASCII) file type
prompt   # turns off interactive prompting for multiple file transfers
system   # shows remote operating system type
download
get =README   # download remote file =README to local current directory
get =README README   # download to a different local filename
get  =README -   # download to local standard output
get ProgramIndex  |less   # download to local command less
q   # quit less when done
# recv is a synonym for get
# use put or send to upload
# use mget followed by a wildcard to download multiple files
# use mput followed by a wildcard to upload multiple files
escape
!ls   # run local command ls (no space after !)
download source code
cd hello   # directory for a simple application
dir   # synonym for ls
get hello-2.10.tar.gz   # download compressed archive (C programming example)
exit
quit   # or bye, exit ftp
uncompress and extract
cd gnu
ls -l
gunzip hello-2.10.tar.gz   # uncompress .gz file
                           # use bunzip2 for .bz2 files
                           # use unxz for .xz files
ls -l   # original .gz file gone
tar xf hello-2.10.tar   # extract files from .tar archive
                        # x is extract ( must be first option)
                        # f is file (must be last option)
                        # other options go between x and f
ls -l   # files were extracted to directory hello-2.10
rm hello-2.10.tar   # clean up
build and install application
cd hello-2.10
ls   # lots here
less src/hello.c   # look at the source code (if you're a C programmer)
q   # quit less when done
less INSTALL   # read the directions
q   # quit less when done
./configure --prefix=$PWD   # prepare a Makefile which suits your system
                            # --prefix specifies directory for install
make   # build application
make install   # install application
ls bin/   # the executable is here
ls doc/   # documentation is here (newer Gnu software doesn't use man pages)
run application
./bin/hello   # execute hello
echo $LANG   # LANG defines the language as language_country
LANG=fr_FR   # fr_FR is French language, as spoken in France
./bin/hello   # output in French
./bin/hello -x   # error messages also in French
LANG=en_US   # reset to US English
info -f doc/hello.info   # -f (file) option for non-standard location
# use arrow keys to scroll up and down
q   # quit info
cd
other download tools
sftp
uses ssh connection and ftp commands for secure file transfer
curl, wget
non-interactive UNIX tools which can download files from web servers using HTTP or HTTPS
rsync
copies files to/from remote hosts, can copy only differences for better speed
example (single line):
  rsync -av --delete-after mirrors.kernel.org::
  slackware/slackware64-14.2/patches/packages/ ~/
uses :: for rsync daemon, : for SSH daemon
