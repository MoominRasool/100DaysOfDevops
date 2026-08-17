# Day 4 - Python For Devops
## What I did
- Automate the Boring Stuff: chapter 8,9,10 completed.
- Real Python: YAML.
- Requests Docs: HTTP requests in Python.

## What I learned
- String Literals: String values that literally appear in our code
- Begin and end with a single and double quotation mark.
- Use Escape sequence(\) for using quotes inside quotes.
- Place an r before the beginning quotation mark of a string literal to make it a raw string literal. A raw string makes it easier to enter string values that have backslashes by ignoring all escape sequences.
- Example Print(r'This file is in c:\users\Moomin\Desktop')
- Multiline strings ''' this is a multiline string '''
- Multiline comments """This is a multiline comment """
- Strings use indexes and slices the same way lists do.
- If you specify an index, the starting index is included and the ending index is not.
- Slicing a string doesn't modify the original string.
- An expression with two strings joined using in or not in will evaluate to a Boolean true or False.
- f-strings: lets you place variable names or entire expressions within a string. Like the r prefix in raw strings, f-strings have an f prefix.
- f' My name is {name}. I am {age} years old.'
- f string only version 3.6. In older versions python will replace the first %s with the first value in the parentheses after the string, the second %s with the second value, and so on.
- .format also works in the same way. 'this is an {}.' .format(example)
- upper() and lower() string methods return a new string with all the leteers in the original converted to uppercaees or lowercase, respectively.
- Note that these methods don’t change the string itself, but return new string values. If you want to change the original string, you have to call upper() or lower() on the string and then assign the new string to the variable that stored the original. This is why you must use spam = spam.upper() to change the string in spam instead of simply writing spam.upper().
- Also used to make a case-insensitive comparison.
- The isupper() and islower() methods will return a Boolean True value if the string has at least one letter and all the letters are uppercase or lowercase, respectively. Otherwise, the method returns False.
- Checking string characteristics with isX():

  isalpha() Returns True if the string consists only of letters and isn’t blank

  isalnum() Returns True if the string consists only of letters and numbers (alphanumerics) and isn’t blank

  isdecimal() Returns True if the string consists only of numeric characters and isn’t blank

  isspace() Returns True if the string consists only of spaces, tabs, and newlines and isn’t blank

  istitle() Returns True if the string consists only of words that begin with an uppercase letter followed by only lowercase letters
- isX() string methods are helpful when you need to validate user input.
- The startswith() and endswith() methods return True if the string value on which they’re called begins or ends (respectively) with the string passed to the method; otherwise, they return False.
- The join() method is useful when you have a list of strings that need to be joined together into a single string value. We call the join() method on a string and pass it a list of strings, and it returns the concatenation of each string in the passed-in list.
- Works in opposite way of .split(). 
- The rjust() and ljust() string methods return a padded version of the string on which they’re called, with spaces inserted to justify the text. The first argument to both methods is an integer length for the justified string.
- The center() string method works like ljust() and rjust() but centers the text, rather than justifying it to the left or right.
- The strip() string method will return a new string without any whitespace characters at the beginning or end, while the lstrip() and rstrip() methods will remove whitespace characters from the left and right ends, respectively.
- ord('X') to find the code point of a one-character string, and the chr() function to get the one-character string of an integer code point.
- The pyperclip module has copy() and paste() functions that can send text to and receive text from your computer’s clipboard. Sending the output of your program to the clipboard will make it easy to paste it into an email, a word processor, or some other software.
- pyperclip module doesn't come with python, need to install it first.
- Regular expressions, called regexes for short, are a sort of mini language that describes a pattern of text. For example, the characters \d in a regex stand for a decimal numeral between 0 and 9.
- Regular expressions are split into two parts: the qualifiers that dictate what characters you are trying to match followed by the quantifiers that dictate how many characters you are trying to match.
- adding a numeral, such as 3, in curly brackets ({3}) after a pattern is like saying, “Match this pattern three times.
- Note that we often write regex strings as raw strings, with the r prefix. This is useful, as regex strings often have backslashes. Without using raw strings, we would have to enter expressions such as '\\d'.
- Four steps to use regex. Import re module, pass the regex string to re.compile() to get a pattern object, pass the text string to the pattern objects's search() method to get a match object, call the match object's group() method to get the string of the matched text.
- Add parentheses to create froups in the regex string.
- .groups() returns a tuple of multiple values, you can use the multiple-assignment trick to assign each value to a separate variable.
- Parentheses create groups in regular expressions and are not interpreted as part of the text pattern
- Although The \(and \) escaped parentheses will be interpreted as part of the pattern you are matching.
- Pattern objects have a findall() method. While search() will return a Match object of the first matched text in the searched string, the findall() method will return the strings of every match in the searched string.
- The method returns a list of strings as long as there are no groups in the regular expression.
- Can define a set of characters to match inside square brackets.
- By placing a caret character (^) just after the character class’s opening bracket, you can make a negative character class. A negative character class will match all the characters that are not in the character class.
- /d = numeric, /w = any letter, /s = any space. With their respective capital letters after the / for 'not' shorthand character.
- The . (or dot) character in a regular expression string matches any character except for a newline.
- If there is no quantifier, the qualifier must appear exactly once.
- The ? character flags the preceding qualifier as optional.
- The *  means “match zero or more.”
- + (or plus) means “match one or more.” Unlike the star, which does not require its qualifier to appear in the matched string, the plus requires the qualifier preceding it to appear at least once.
- greedy matching = longest possibe, non-greedy matching = shortest possible string, also called lazy like me.
- Use dot star to match everything, except new line.
- use re.DOTALL as the second arg to re.compile() to match all characters.
- You can use the caret symbol (^) at the start of a regex to indicate that a match must occur at the beginning of the searched text. Likewise, you can put a dollar sign ($) at the end of the regex to indicate that the string must end with this regex pattern. 
- To make your regex case-insensitive, you can pass re.IGNORECASE or re.I as a second argument to re.compile().
- Regular expressions don’t merely find text patterns; they can also substitute new text in place of those patterns. The sub() method for Pattern objects accepts two arguments. The first is a string that should replace any matches. The second is the string of the regular expression. The sub() method returns a string with the substitutions applied.
- Use verbose for complicated matching text pattern.
- Use pipe to combine ignorecase, dotall and verbose.
- windows use \ path seperator, mac and linux use /.The Path() function in the pathlib module handles all operating systems, so the best practice is to use forward slashes in your Python code. 
- / operator can be ued to combine path objects and strings.
- The only thing you need to keep in mind when using the / operator for joining paths is that one of the first two values in the expression must be a Path object. This is because these expressions evaluate from left to right, and the / operator can be used on two Path objects or on a Path object and a string, but not on two strings.
- You can get the current working directory as a string value with the Path.cwd() function and can change it using os.chdir().
- You can get a Path object of the home folder by calling Path.home().
- Your programs can create new folders with the os.makedirs() function
- To make a directory from a Path object, call the mkdir() method.
- Calling the is_absolute() method on a Path object will return True if it represents an absolute path or False if it represents a relative path.
- To get an absolute path from a relative path, you can put Path.cwd() / in front of the relative Path object.
- The stat() method returns a stat_result object with file size and timestamp information about a file.
- Where st_size is size of the file in bytes
  st_mtime is the last modified time 
  st_ctime is creation timestamp
  st_atime is last accessed timestamp.
- The * and ? characters can be used to match folder names and filenames in what are called glob patterns. Glob patterns are like a simplified regex language: the * character matches any text, and the ? character matches exactly one character.
- Calling p.exists(), true if path exists, Calling p.is_file(), true if path exists and is a file, Calling p.is_dir(), true if the path exists and is a directory.
- The pathlib module’s read_text() method returns the full contents of a text file as a string. Its write_text() method creates a new text file (or overwrites an existing one) with the string passed to it.
- To open a file with the open() function, pass it a string path indicating the file you want to open. This can be either an absolute path or a relative path. The open() function returns a File object.
- read() method: to read entire contents of a file.
- use readline to get a list of string values from the file, one for each line of text.
- example_file.write to write the text, but first need to example_file = open('file1.txt', 'w', encoding='UTF-8')
- Use with statement to use the context manager, saves you from close() on all the files.
- You can save variables in your Python programs to binary shelf files using the shelve module. This lets your program restore that data to the variables the next time it is run. You could use this technique to add Save and Open features to your program; for example, if you ran a program and entered some configuration settings, you could save those settings to a shelf file and then have the program load the settings the next time it is run.
- To read and write data using the shelve module, you first import shelve. Next, call shelve.open() and pass it a filename, then store the returned shelf value in a variable. You can make changes to the shelf value as if it were a dictionary. When you’re done, call close() on the shelf value.





- YAML: The Missing Battery in Python
- YAML is data serialization format.Emphasizes human readability with block indentation.
- Need to install PyYAML to read and write YAML docs in python.
- YAML is more focused towards data representation rather than document markup.
- Alternatives to PyYAML include ruamel.yaml and StrictYAML, which offer more features.
- YAML is a superset of JSON.
- Uses of YAML in Devops:
Ansible: Uses YAML to describe the desired state of the remote infrastructure, manage the configuration, and orchestrate IT processes
Docker Compose: Uses YAML to describe the microservices comprising your Dockerized application
Kubernetes: Uses YAML to define various objects in a computer cluster to orchestrate and manage
- The YAML specification forbids using tabs for indentation and considers their use a syntax error.
- Need to be careful declaring a string that the parser could misinterpret as the wrong data type. for example True without any quotation mark might be treated as a python Boolean.
- Three fundamental data structures in YAML are:
Scalars: Simple values like numbers, strings, or Booleans
Arrays: Sequences of scalars or other collections
Hashes: Associative arrays, also known as maps, dictionaries, objects, or records comprised of key-value pairs.
- Sequences in YAML are just like Python lists or JSON arrays.
- Example docker-compose.yaml
```
services:
  web:
    image: nginx
    ports:
      - "8080:80"
```
- Read yaml:
```
with open("docker-compose.yml", "r") as file:
    data = yaml.safe_load(file)
```
- YAML data becomes python dictionaries/list
- Access Values:
```
print(data["services"]["web"]["image"])
```
- Modifying config:
```
data["services"]["web"]["image"] = "nginx:latest"
```
- Write YAML:
```
with open("docker-compose.yml", "w") as file:
    yaml.safe_dump(data, file, sort_keys=False)
```
- Use yaml.safe.load() for trusted files or unsafe methods for untrusted files.

# what i Struggled with 
- YAML = preserving comments, spacing, and order during write-back. Need to dig into ruamel.yaml lib.
- health-check.py = had to look up how to check log status and response time.
# Tomorrow 
- finishing boto3 for AWS
