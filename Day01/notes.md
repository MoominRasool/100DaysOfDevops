# Day 1 - Linux Basics
## What I did
-LinuxJourney: Grasshopper Section Compelete
-OverTheWire Bandit: Level 0-10 done

## Commands I learned
[Note: Commands in linux are case sensitive]
$ whoami = displays user
$ id = displays identity info
$ id -un = displays username
$ pwd or echo ~ = Present working directory or Home directory
$ ls = lists the contents of current directory
  ls ~ = - - - of home -
  ls -l  = provdies long format listing
  ls -a = Show hidden files
  ls -la = combining long and short form listing
  ls -l exampledir = specific directory listing
$ cd .,..,~,- = change directory(realtive and absoulute paths can be used)
$ touch = create an empty file
  touch -d "20206-01-01 12:30:00" = create a file with timestampt
$ echo "Hello linux" > example.txt = creates a file and stores the output
  echo "This is a hidden file" > .hiddenfile = create a hidden file and appending the o/p
$ mkdir example dir = creates a directory
  mkdir -p = for nested 
$ cp file1 file2 = copy 
  cp -r = copy recursive
  cp file1.txt /home/documents * = matches and copies any sequence of characters
                               ? = matches and copies any single character
                               [] = matches and copies any character b/w braces
  cp -i file /home = copies interactively i.e yes/no prompt
  cp -f file /home = force copy, without interaction
  cp -p file /home = Preserves time stamp as backup and copies
$ mv file1.txt newname.txt = renames a file
$ mv newname.txt testdir/ = moves a file to another directory
  mv testdir/newname.txt ./original-file1.txt = move and rename in one command
  mv -t /home file1 file2 = moves to a specific target directory
  mv -i = moves interactively 
  mv -b = moves but with a backup
  mv -v = verbose flag, will print what it is moving
$ rm f1 = remove a single file
  rm -i file1.txt = removes interactively, i.e Yes/no prompt
  rm -R = removes recursively
  rm -r = removes in reverse sort order
  rm -rf = removes itteratively
$ cat -n = display a specific line of a file
$ head -n 1 filename = prints first few lines
  head -c N filename = count, prints the first n bytes of the stream
$ tail -n 1 filename = prinsts last line
  tail -c N filenmae = last n bytes of the stream
  tail -f = follow, i.e keep the output running
$ Diff f1 f2 = Shows difference 
$ less = viewing files that are too long for the screen
  less search /example = unix less search
$ history = shows history of commands used
  history -c linux = cleans command history
  history -w linux = save existing commands
  history -d <offset> = specific entry 
$ find /home -name file1.txt = finds a file with a specific name, recursive in nature
  find /home -type d = directory
$ help command = provides manual about the commnad
  command --help = prints detailed uses and exits
  man command = finds detailed uses of a command in the documentation
  whatis command = one line discription of the command from the man page
$ alias command = 'another easy commnad' => customizing temp alias
  alias update = 'sudo apt update && sudo apt upgrade => to make alias permanent
$ source ~/.bashrc = relodes config file
$ unalias = removing an alias
$ exit or logout = quit the terminal
$ ls -la /etc | tee file3.txt | grep "config" = Pipe i.e combine multiple commands
$ export test = test => sets an environment variable test, non persistent
  *To make persistent
  vim ~/.bashrc or nano source ~./bashrc
  add: export test=test
  save and exit*
$ cut = cut a portion of file from the text
  cut -c n = cut nth character
  cut -f n = cut nth tab
  cut -f n -d ";" file1.txt = changes the delim from tab to ; and outputs the nth
$ paste -s file1.txt = combines all line with tab delim
  paste -d ' ' -s file1.txt = uses '' delim making more readable
$ expand file.txt = converts tabs to space and prints
  expand file.txt > result.txt = converts and saves
$ unexpand -a result.txt = converts spaces to tabs, used -a as unexpand applies to only one line
$ join file1.txt file2.txt = joins two files, must be common first field
  join -1 2 -2 1 file.txt & file2.txt = Joins 2nd column ist file, ist column 2nd file
$ split file1.txt = splits new files 1000 line limit
  split -l = line flag, specify line count
  split -b = size flag, specify file size
$ sort file1.txt = sort file alphabetically
  sort -r file1.txt = reverse sort
  sort -n file1.txt = sort numerically
$ tr = uppercase/lowercase conversion {echo 'file1.txt'| tr a-z A-Z
  tr -d = deletes characters specified after the flag
  tr -s = squeezes repeated characters specified after the flag
$ uniq file.txt = filters duplicate values
  uniq -c = filters and prints count as well
  uniq -u = only prints non duplicate values
  uniq -d = only prints duplicate values
  *uniq only filters adjacent values, to apply on non-adjacent values use*
   sort file1.txt | uniq
$ wc /etc/pwd = count content & number of line
  wc -l = no. of lines
  wc -w = no. of words
  wc -c = no. of bytes count
$ nl file.txt = no. of line in a file
$ grep word file1.txt = searches for patters in a file
  grep -e "-v" /home/documents = -e flag tells grep "-v" is a patern
  grep -i = case insensitive search
  grep -c = count matching lines too
  grep -o = show only matches
  grep -f pattern.txt file.txt = search for multiple patters.
$ sudo useradd Bob = adds a user 
$ sudo userdel Bob = deletes a uer
  sudo userdel -r Bob = to delete home directory and mail as well
$ passwd = change password
$ chmod = change file permission
  chmod u+x myfile = symbolic mode, u=user, g= group, o= other, a= all
  chmod 755 myfile = octal mode, 4= read, 2= write, 1= execute
$ sudo chown pat myfile = changes ownership 
$ sudo chgrp whales myfile = changes file ownership to whales group
$ sudo chown pat:whales myfile = changes file and group ownership in single command
$ unmask 021 = take away permissions
$ ps = displays currently running programs
  ps aux = a, displays all process for all user; u,detailed user oriented programs; x, includes processes not attached 
           to any terminal including daemons; unix/BSD style
  ps  
	-e : all processes
	-f : full-format listing (adds more fields)
	-l : longer format listing
	-a : processes for all users (except some system-related ones depending on OS)
	-u user : show processes for a user (e.g., ps -u alice)
	-p pid[,pid...] : show specific PID(s)
	-C cmdname : show processes by command name
  ps -o pid,ppid,comm,etime,pcpu,pmem = GNU style
$ top = real time dynamic view of the process
  htop = interactive, more user friendly replacement of top with color views
# what surprised me
- orphan process and zombie processes are seperate things
- Linux uses Round Robin process scheduling by default
# what i Struggled with 
- Bandit level 4 - had to look up the file command
# Tomorrow
- Start Bash Scripting
