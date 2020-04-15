author: Scott Morgan
summary: Welcome to learning programming! The first part of the course focuses on taking the plunge with programming and getting familiar with all the required tools.
id: 1-starting-programming
categories: btec-unit4
environments: Web
status: Draft
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 1

## Getting Started with Programming

### What you'll learn
* Become familiar with the Atom development environment used in this course.
* How to download and submit programming exercises.

Modern programming is practically always done in an IDE (integrated development environment). An IDE contains a set of useful tools for the programmer. It does not create the program by itself, but it can give hints about common mistakes in the code, and help the programmer understand the structure of the program.

The IDE we use on this course is called Atom, and we use it with the atom-python-test plugin.

To start the course you will need:

1. A Github account
2. Python installed via Anaconda
3. Atom development environment

You can sign up for Github [here](https://github.com/). Installation instructions for Anaconda and Atom can be found here: [Anaconda and Atom installation guide](https://scott3142.uk/python-programming/installation).

Once you have created the user account and installed Anaconda and Atom, watch the video below. The video demonstrates what happens when Atom is opened for the first time. We log into Github and do the first programming exercise.

Positive
: Video to be added

Positive
: **Exercise - Sandbox** <br><br> This is the first programming exercise of this course. In this exercise, you'll familiarize yourself with the development environment. <br><br> 1. Clone the repo [sandbox](https://github.com/btec-diploma-unit4-programming-2020/sandbox.git) and open the file `sandbox.py`. You should see the code below.

#### [sandbox.py](https://github.com/btec-diploma-unit4-programming-2020/sandbox/blob/master/sandbox.py)
```
def sandbox():
  #Write your program here

sandbox()
```

Positive
: You should use this sandbox exercise to try out different things later on. When you encounter something new in the material, try it out in the sandbox first, and then solve the exercises on the topic.

### Programmers Write Source Code

Programming is designing and implementing software. The functionality is implemented based on the wishes and requirements of the users and the customers. Programs are typically implemented (i.e., written or "coded") in a programming language meant to be written and read by humans.

There are hundreds of programming languages out there, and this course focuses one of them. The language used in this course is [Python](https://www.python.org/), which is one of the most commonly-used programming languages in the world. Learning Python also makes it easy to pick up other programming languages.

Programming languages, such as Python, have many commands built-in that a programmer uses when developing software. This makes programming easier as you don't need to implement everything from scratch. For example, programming languages typically have built-in options available for different menus and views used for making graphical user interfaces. Indeed, a large part of programming is making use of available functions and tools in solving problems -- this, however, requires programming experience, which you only gain by programming.

The "code" you write is called **source code**. Source code consists of statements and expressions, which are read line by line from top to bottom, and from left to right. For example, to print "Hello world", you can use the pre-defined Python command `print()`, to which you need to provide the text inside the parentheses that you'd like to be printed:

```python
print("Hello World")
```

The above statement is pre-built into Python, and it's used for printing a string. The statement tells the computer to output the string that's been provided to it, placed between the quotation marks.

Most of the programs you'll see in this course require a certain frame around the code to work, the `def function():` syntax. Don't worry too much about this for now, it'll become very familiar over this course. Although you might not be able to make sense of the surrounding frame of code, you could probably guess what the following program does based on the print statement described above.

```python
def example():
  print("Welcome to the course - you will learn to program!")

example()
```

Negative
: **Note:** It is important to realise at this stage that _indentation_ is critical in Python which is slightly different to other languages. The code snippets below is not the same as the one above and would result in an error.

```python
def example():
print("Welcome to the course - you will learn to program!") #this indentation is wrong
example()
```

## Printing

### What you'll learn
* Learn to write a program that prints text.
* Become familiar with executing programs.
* Know what the term "parameter" means.

The print command `print("Hello world")` prints the text "Hello world".

```python
print("Hello world!")
```

Negative
: Hello world!

In this material, text boxes like the one above demonstrate an output produced by the example code. Accordingly, the above program would produce the print output "Hello World!". You can try any of these examples in the exercise template named "sandbox", which you will find in the Github repository you cloned in the first part.

You can print any text you want with the command, as long as the command `print("arbitrary text"). The command below will print the text "Hello there!".

```python
print("Hello there!")
```

Negative
: Hello there!

### Program Boilerplate

In Python, our programs will include some boilerplate code to function. This boilerplate, an example of which is shown below, for example tells the computer what your function is called. Below, the name of the function is `example`.

```python
def example():
  print("Text to be printed")

example()
```

Execution of the program starts from the line that says `example()`. This command *invokes* the function `example` and runs it. Commands are executed inside `example` one line at a time from the top. In the above example, `print("Text to be printed")` is the only command to be executed. Its output is:

Negative
: Text to be printed

<text-box variant="hint" name="Examples in the Material and Code Templates">

The examples in the material will not always show the template, but you can assume that your program file always needs one. As such, the examples might be as short as a single line, such as the example below that illustrates the print command.

```python
print("Hello world");
```

In reality, the above example, when written as a full Python program, looks like so:

```python
def hello_world():
  print("Hello world")

hello_world()
```

Here's the second programming exercise of this course. If you'd like, you can watch this video on how to solve the exercise first:

Positive
: Video to be added.

Positive
: **Exercise - Ada Lovelace** <br><br> The exercise template has the following boilerplate code:

#### [a1_1.py](https://github.com/btec-diploma-unit4-programming-2020/assignment-1-1-ada-lovelace/blob/master/a1_1.py)
```python
def ada():
  # Write your program here

ada()
```

Positive
: The line `# Write your program here` is a _line comment_, and the computer will ignore it when executing the program. Add a new line below the line comment that prints the string "Ada Lovelace" and run the program.<br><br> **The output of the program should be:**

Negative
: Ada Lovelace

Positive
: Once you've finished the exercise and see that it prints the correct string, return the exercise to Github. After that, you can read more about [Ada Lovelace](https://en.wikipedia.org/wiki/Ada_Lovelace), who was one of the first programmers.

You can run a program in Atom by the keyboard combination Ctrl+Shift+B, if you have the `script` package installed as in the first part.

Even though running the program is straightforward, a lot is happenings behind the scenes. When a program is run, the source code is first compiled into Python bytecode. This compilation process is done by the Python compiler, which itself is a program. Following that, the program gets executed, meaning the commands are executed one-by-one by a Python interpreter that is able to read Java bytecode.

### Printing Multiple Lines

Programs are constructed command-by-command, where each command is placed on a new line. In the example below, the command `print()` appears twice, which means that two print commands are being executed in the program.

```python
def new_example():
  print("Hello world!");
  print("... and the universe!");

new_example()
```

The program above will print:

Negative
: Hello world! <br> ... and the universe!

The programming exercises will be checked by Atom's tester, who is meticulous. The guidelines in the assignments regarding the print format are very precise. If the assignment expects you to print a parenthesis, you must print the parenthesis.

This preciseness with regard to the output is relevant in programming in a more general sense. Missing a single character may cause an error. Novice programmers often enter a comma instead of a dot, or write, for instance `prnt` instead of `print`, leave out apostrophes, or forget the semicolon after a command. Any one of these would cause an error and cause the program execution to fail.

Learning programming is, in fact, a path full of mistakes -- and every error message is a chance to learn. Keep a look out for any red signs in the IDE and try to read the test errors!

Positive
: **Exercise - Once Upon a Time** <br><br> The exercise comes ready with the following template:

#### [a1_2.py](https://github.com/btec-diploma-unit4-programming-2020/assignment-1-2-once-upon-a-time/blob/master/a1_2.py)
```python
def OnceUponATime():
  # Write your program here

OnceUponATime()
```

Positive
: Modify the program so that it will print the following text. Use three `print`-commands for printing.

Negative
: Once upon a time <br> there was <br> a program

Positive
: **Exercise - Dinosaur** <br><br> The exercise comes ready with the following template:

#### [a1_3.py](https://github.com/btec-diploma-unit4-programming-2020/assignment-1-3-dinosaur/blob/master/a1_3.py)
```python
def dinosaur():
  # Write your program here

dinosaur()
```

Positive
: Modify the program so that it will print the following text.

Negative
: Once upon a time <br> there was <br> a dinosaur

### Terminology and Code Comments

#### Command parameters

The information to be printed by the print command, i.e. its **parameters**, are passed to it by placing them inside the parentheses `()` that follow the command. For example, passing `Hi` as a parameter to the `print` command is done like this: `print("Hi")`.

### Semicolon Separates Commands

Commands can be separated with a semicolon `;` but this is not necessary or recommended in Python. We could, if we wanted to, write almost everything on a single line. However, that would be difficult to understand.

```python
print("Hello "); print("world"); print("!\n");
```

Negative
: Hello <br> world <br> !

Although the previous example works, it's important to be considerate of other programmers (and your future self!) and to use line breaks. That way, anyone reading the program knows that each line does only a single concrete thing. OTher languages (like Java) might require semicolons at the end of lines. We don't need to do this in Python.

#### Comments

Source code can be commented to clarify it or to add notes. Single-line comments are marked with two slashes `#`. Everything following them on the same line is interpreted as a comment. Python does not really have a syntax for multi line comments, so to add a multiline comment you could insert a # for each line.

Below is an example of a program where both are used.

```python
def comments():
  #Printing
  print("Text to print");
  print("More text to print!");
  # Next:
  # more on printing
  # more practice
  # variables
  # ...
  #
  print("Some other text to print");
  # print("Trying stuff out")

comments()
```

The last line of the example shows a particularly handy use-case for comments. Code that has been written does not need to be deleted to try out something else.
