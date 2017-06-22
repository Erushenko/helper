# bash

## view command line

	~ 		- home folder
	$ 		- not root
	# 		- root permission

## permissions

	logout		- exit from root

## file system

	df		-Show information about the file system on which each FILE resides,or all file systems by default.
		df -h
	du	-	Summarize disk usage of the set of FILEs, recursively for directories.
		du -h --max-depth=1
		du -hs -d1
	fdisk		-manipulate disk partition table
		fdisk -l
	mount		-mount a filesystem
		mount -t ext4 dev/group_name /name_value
## atribute, search file

### format disc
 

### view, list, print

	stat		-statistic folder/filename
	cat		-concatenate files and print on the standard output
		cat file_name.txt
	ls - list directory contents
		ls -la
		ls -lah bac*
	echo - display a line of text
		echo "test display" > test.txt
	#### options print
	more		-file perusal filter for crt viewing
		cat app.js | more
	less		-opposite of more
		cat app.js | less
	uniq		-Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT (or standard output).
	fmt		-simple optimal text formatter
	nl		-number lines of files
		cat app.js | more | nl
	cut		-remove sections from each line of files
		cut -d ';' -f1-3 test.text

### CREATE, EDIT, REMOVE, COPY

	touch		-change file timestamps. create new file
		touch new_file.txt
	cp	- copy files and directories
		cp -rf . ../data

### REDIRECTION

	>		-in new file
		cat test.txt > new_test.txt
	>>		-append into a file
		cat test.txt >> new_test.txt

### TOOLS

	man	-manual commands
		man du

### TAR

	tar — The GNU version of the tar archiving utility
		tar cvf backup.tar .
		tar tfv backup.tar
		tar cfz backup.tgz ./*		(tar + gzip)
		tar xfz ./backup.tgz		(extract in current folder)
	gzip, gunzip, zcat - compress or expand files
		gzip backup.tar

### LVM

	swaps		-cat proc/swaps	*list swaps*