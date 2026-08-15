# Day 2 - Scripting Basics
## What I did
- Ryan's Bash Tutorial: Completed and all exercises done
- ShellCheck: Pasted scripts to catch bugs automatically
- Crontab Guru: Visualized cron expression builder
## What I learned
- A Bash script is a plain text file which contains a series of commands
- A process is runnig instance of a program
- Before running a script it must have the execute permission set as it's not set by default
- #!/bin/bash is referred to as the shebang.
- Always be mindful of formatting in the script, wrong spaces and indentations can cause errors.
- A variable is a temporary store for a piece of info, 2 actions performed for them: setting and reading the value for a variable.
- $ before the variable name for reading a variable, no $ when setting a variable.
- $0 = The name of the Bash script.
  $1 to $9 = The first 9 arguments to the Bash script.
  $# = How many arguments were passed to the Bash script.
  $@ = All the arguments supplied to the Bash script.
  $? = The exit status of the most recently run process.
  $$ = The process ID of the current script.
  $USER = The username of the user running the script.
  $HOSTNAME = The hostname of the machine the script is running on.
  $SECONDS = The number of seconds since the script was started.
  $RANDOM = Returns a different random number each time is it referred to.
  $LINENO = Returns the current line number in the Bash script.
- Setting a variable variable=value, no space
- Use quoutes to more complex values in a variable.
  Single quotes will treat every character literally.
  Double quotes will allow you to do substitution.
- Command substitution, myvar=$( ls/etc | wc -l )
- Variables are limited to the process they were created in 
- A script may run another script as one of its commands. If we want the variable to be available to the second script then we need to export the variable.
- use the 'export' command to export the varible.
- read var1 command asks the user for input.
- '-p' to specify a prompt,'-s' makes the input silent.
- We can create scripts that act as filter to modify data in specific ways for us, STDIN = /dev/stdin or /proc/self/fd/0; STDOUT = /dev/stdout or /proc/self/fd/1; STDERR = /dev/stderr or /proc/self/fd/2
- Example: "cat /dev/stdin | cut -d' ' -f 2,3 | sort"
- let allows us to do simple arithmetic. "let<arithmetic expression>"
- if we don't put quotes around the expression then it must be written with no spaces
- '\*' for multiply
- 'expr' similar to let except instead of saving the result it instead prints.
- don't need to enclose the expression in quotes, but there must be spaces.
- Common to use expr within command substitution to save the o/p to a var.
- 'expr item1 operator item2'
- use double parenthesis as '$((expression))'
- No need of spaces, or $ for variables, or / before multiplication.
- '${#variable}' for finding out the length of a variable.
- if statement structure:
  ```bash
  if [ <some test> ]
  then
  <commands>
  fi
  ```
- if else structure:
  ```bash
  if [ <some test> ]
  then
  <commands>
  else
  <other commands>
  fi
  ```
- If elif else Structure:
  ```bash
  if [ <some test> ]
  then
  <commands>
  elif [ <some test> ]
  then
  <different commands>
  else
  <other commands>
  fi
  ```
- and - && ,or - ||
- Case statements Structure:
  ```bash
  case <variable> in
  <pattern 1>)
  <commands>
  ;;
  <pattern 2>)
  <other commands>
  ;;
  esac
  ```
- While loops Structure
  ```bash
  while [ <some test> ]
  do
  <commands>
  done
  ```
- Until loop: is fairly similar to the while loop. The difference is that it  will execute the commands within it until the test becomes true.
  Structure:
  ```bash
  until [ <some test> ]
  do
  <commands>
  done
  ```
- For Loop Structure:
  ```bash
  for var in <list>
  do
  <commands>
  done
  ```
- The break statement tells Bash to leave the loop straight away.
- The continue statement tells Bash to stop running through this iteration 
  of the loop and begin the next iteration.
- The select mechanism allows you to create a simple menu system.
  Structure:
  ```bash
  select var in <list>
  do
  <commands>
  done
  ```
- Fucntions Structure:
  ```bash
  function_name () {
  <commands>
  }
  ``` 
-OR
  ```bash
  function function_name {
  <commands>
  }
  ```
- Scope refers to which parts of a script can see which variables. By default a variable is global. This means that it is visible everywhere in the script. We may also create a variable as a local variable. When we create a local variable within a function, it is only visible within that function.
- 'local var_name=<var_value>' to set the scope of the variable.
- It is possible to name a function as the same name as a command you would normally use on the command line. This allows us to create a wrapper.
- it is good to put ancillary tasks within functions too so that they are logically separate from the main part of the script. A common example is validating input.
- A function is most reuseable when it performs a single task and a single task only. Instead of having a large function, consider breaking it up into several functions and breaking the task up.
- need to find the right balance however. If the functions are too large and take on too much processing then you don't get the full benefit. If you divide up into too many functions then your code can easily grow and become silly.
- tput: is a command which allows you to control the cursor on the terminal and the format of content that is printed.
- there are 3 ways in which you may supply data to a Bash script:
   As command line arguments
   Redirected in as STDIN
   Read interactively during script execution
- Indent your code and space it out well so that different sections are easily distinguished.
  Name variables and functions with descriptive names so it is clear what they represent and do.
  Use comments where appropriate to explain a bit of code who's operation is not immediately obvious.
# what surprised me 
- set -euo pipefall stops script on ANY error, python doesn't do this by default, much safer habbit.
- ShellCheck caught bugs I wouldn't have noticed.
# what i Struggled with 
- No f-string in Bash - string formatting feels clunky compared to python.

# Tomorrow
- Git Revision.
