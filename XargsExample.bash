xargs – extended arguments
The xargs command is is used to pass groups of arguments from STDIN to another command.

touch F1.old F2.old F3.old   # create three files
ls F[123].*
ls F[123].* | sed -e 's/\.old$/.new/'   # change extensions .old to .new
ls F[123].* | sed -e 'p' -e 's/\.old$/.new/'   # also print original names
# next line passes the list of arguments to mv, no more than 2 at a time
ls F[123].* | sed -e 'p' -e 's/\.old$/.new/' | xargs -n2 mv
ls F[123].*   # files are renamed
