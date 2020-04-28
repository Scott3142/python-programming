author: Scott Morgan
summary: Welcome to learning programming! Take the plunge and getting familiar with all the required tools.
id: part-1
categories: btec-unit4
environments: Web
status: Draft
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 1

## Getting Started with Programming
Duration: 01:00:00

### What you'll learn
* Become familiar with the Atom development environment used in this course.
* How to download and submit programming exercises.

Modern programming is practically always done in an IDE (integrated development environment). An IDE contains a set of useful tools for the programmer. It does not create the program by itself, but it can give hints about common mistakes in the code, and help the programmer understand the structure of the program.

There are many IDEs that can be used with Python, including [PyCharm](https://www.jetbrains.com/pycharm), [Idle](https://docs.python.org/3/library/idle.html) and [VS Code](https://code.visualstudio.com/). At the risk of sparking some heated debate ("I love vim", "nano 4eva" etc.), the text editor we recommend and support on this course is called Atom. Atom describes itself as a "hackable text editor for the 21st Century" and is built and maintained by [Github](https://github.com/), which we will also use extensively throughout this course.

Atom is not [technically](https://www.quora.com/Is-Atom-an-IDE-or-Text-Editor) an IDE, but comes with many useful plugins that can be used to mimic the functionality of an IDE. We will use the `script` and `atom-python-test` plugins predominantly on this course. 

To start the course you will need:

1. A Github account
2. Python installed via Anaconda
3. Atom development environment

You can sign up for Github [here](https://github.com/). Installation instructions for Anaconda and Atom can be found below:

- [Anaconda installation guide (Windows)](https://docs.anaconda.com/anaconda/install/windows/)
- [Atom installation guide (Windows)](https://flight-manual.atom.io/getting-started/sections/installing-atom/)

Once you have created the user account and installed Anaconda and Atom, watch the video below. The video demonstrates what happens when Atom is opened for the first time. We log into Github and do the first programming exercise.

Positive
: Video to be added

Positive
: **Exercise - Sandbox** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/sandbox.git)

### Programmers Write Source Code

Programming is designing and implementing software. The functionality is implemented based on the wishes and requirements of the users and the customers. Programs are typically implemented (i.e., written or "coded") in a programming language meant to be written and read by humans.

There are hundreds of programming languages out there, and this course focuses one of them. The language used in this course is [Python](https://www.python.org/), which is one of the most commonly-used programming languages in the world. Learning Python also makes it easy to pick up other programming languages.

Programming languages, such as Python, have many commands built-in that a programmer uses when developing software. This makes programming easier as you don't need to implement everything from scratch. For example, programming languages typically have built-in options available for different menus and views used for making graphical user interfaces. Indeed, a large part of programming is making use of available functions and tools in solving problems -- this, however, requires programming experience, which you only gain by programming.

The "code" you write is called **source code**. Source code consists of statements and expressions, which are read line by line from top to bottom, and from left to right. For example, to print "Hello world", you can use the pre-defined Python command `print()`, to which you need to provide the text inside the parentheses that you'd like to be printed:

```python
print("Hello World")
```

The above statement is pre-built into Python, and it's used for printing a string. The statement tells the computer to output the string that's been provided to it, placed between the quotation marks.

A lot of the programs you'll see in this course will have a certain frame around the code; the `def main():` syntax and the `if __name__ == '__main__':` block. Don't worry too much about this for now, it'll become very familiar over the course of the material. You don't technically need the framing around the `print` statement or the `if __name__ == '__main__':` block for the program to be able to run in Python, but it's useful to get into the habit now to make things easier later.

```python
def main():
    print("Welcome to the course - you will learn to program!")

if __name__ == '__main__':
    main()
```

Negative
: **Note:** It is important to realise at this stage that _indentation_ is critical in Python which is slightly different to other languages. The code snippet below is not the same as the one above and would result in an error.

```python
def main():
print("Welcome to the course - you will learn to program!") #this indentation is wrong
if __name__ == '__main__':
main()
```

## Printing
Duration: 01:00:00

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

You can print any text you want with the command, as long as you use the command `print("arbitrary text")`. The command below will print the text "Hello there!".

```python
print("Hello there!")
```

Negative
: Hello there!

### Program Boilerplate

In Python, our programs will include some boilerplate code to function. This boilerplate, an example of which is shown below, for example tells the computer what your function is called. Below, the name of the function is `main`.

```python
def main():
    print("Text to be printed")

if __name__ == '__main__':
    main()
```

Execution of the program starts from the line that says `main()`. This command *invokes* the function `main` and runs it. Commands are executed inside `main` one line at a time from the top. In the above example, `print("Text to be printed")` is the only command to be executed. Its output is:

Negative
: Text to be printed

The examples in the material will not always show the template, but you can assume that your program file has one. As such, the examples might be as short as a single line, such as the example below that illustrates the print command.

```python
print("Hello world")
```

In reality, the above example, when written as a full Python program, looks like so:

```python
def hello_world():
    print("Hello world")

if __name__ == '__main__':
    hello_world()
```

Here's the second programming exercise of this course. If you'd like, you can watch this video on how to solve the exercise first:

Positive
: Video to be added.

Positive
: **Exercise - Ada Lovelace** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-1-ada-lovelace.git)

You can run a program in Atom by the keyboard combination Ctrl+Shift+B, if you have the `script` package installed as in the first part.

Even though running the program is straightforward, a lot is happenings behind the scenes. When a program is run, the source code is first compiled into Python bytecode. This compilation process is done by the Python compiler, which itself is a program. Following that, the program gets executed, meaning the commands are executed one-by-one by a Python interpreter that is able to read Python bytecode.

### Printing Multiple Lines

Programs are constructed command-by-command, where each command is placed on a new line. In the example below, the command `print()` appears twice, which means that two print commands are being executed in the program.

```python
def new_main():
    print("Hello world!")
    print("... and the universe!")

if __name__ == '__main__':
    new_main()
```

The program above will print:

Negative
: Hello world! <br> ... and the universe!

The programming exercises will be checked by Atom's tester, which is meticulous. The guidelines in the assignments regarding the print format are very precise. If the assignment expects you to print a parenthesis, you must print the parenthesis.

This preciseness with regard to the output is relevant in programming in a more general sense. Missing a single character may cause an error. Novice programmers often enter a comma instead of a dot, or write, for instance `prnt` instead of `print`, leave out apostrophes, or forget a bracket after a command. Any one of these would cause an error and cause the program execution to fail.

Learning programming is, in fact, a path full of mistakes -- and every error message is a chance to learn. Keep a look out for any red signs in the IDE and try to read the test errors!

Positive
: **Exercise - Once Upon a Time** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-2-once-upon-a-time.git)

Positive
: **Exercise - Dinosaur**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-3-dinosaur.git)

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

Although the previous example works, it's important to be considerate of other programmers (and your future self!) and to use line breaks. That way, anyone reading the program knows that each line does only a single concrete thing. Other languages (like Java) might require semicolons at the end of lines. We don't need to do this in Python.

#### Comments

Source code can be commented to clarify it or to add notes. Single-line comments are marked with a hash `#`. Everything following them on the same line is interpreted as a comment. Python does not _really_ [see below] have a syntax for multi line comments, so to add a multiline comment you could insert a `#` for each line.

Below is an example of a program where both are used.

```python
def comments():
    #Printing
    print("Text to print")
    print("More text to print!")
    # Next:
    # more on printing
    # more practice
    # variables
    # ...
    #
    print("Some other text to print")
    # print("Trying stuff out")

if __name__ == '__main__':
    comments()
```

The last line of the example shows a particularly handy use-case for comments. Code that has been written does not need to be deleted to try out something else.

Positive
: **Docstrings** <br><br> In Python, there is the concept of a Python *Docstring*, which you will see later in the course. A docstring is a string literal that occurs as the first statement in a module, function, class, or method definition. Such a docstring becomes the `__doc__` special attribute of that object. All modules should normally have docstrings, and all functions and classes exported by a module should also have docstrings. We will revisit these concepts later.

## Reading input
Duration: 01:00:00

### What you'll learn
* Learn to write a program that reads text written by a user.
* Know what a "string" refers to in programming.
* Know how to join (i.e., "concatenate") strings together.

Input refers to text written by the user read by the program. Input is always read as a string. For reading input, we use the `input` tool that comes with Python. The tool can be used with the command `inputString = input('This text is printed to screen.')`

Below is an example of a program which asks for user input, reads the string entered by the user, and then prints it.

```python
def user_input():
    input_string = input('Write a message:')
    print(input_string)

if __name__ == '__main__':
    user_input()
```

More precisely, input is read and holds until the user writes something. When the user writes something and presses enter, the provided string is assigned to the string variable `input_string`. The program is then able to reference the variable message later on — in the example above, the variable message is referenced in the print command.

When the program is run, its output can look like the example below. In this example, the user has written the text "Hello world" — user input is marked in the sample examples.

Negative
: Write a message: <br> *User inputs message \<Hello World\>* <br> Hello World

Positive
: **Exercise - Message**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-4-message.git)

### Fundamentals of Strings

As you might have noticed, in programming we refer to "strings" rather than "text". The term "string" is shorthand for "string of characters" which describes how the computer sees text on a more fundamental level: as a sequence of individual characters.

We've so far used strings in two ways. When practicing the print command, we passed the string to be printed to the print command in quotation marks, and when practicing reading input, we saved the string we read to a variable.

In practice, variables are named containers that contain information of some specified type and have a name. Typically, and almost always in Python, a variable is also assigned a value during its declaration. You can assign a value by following the declaration with an equals sign followed by the value.

A string variable called `message` that is assigned the value "Hello world!" is declared like this:

```python
message = "Hello world!"
```

When a variable is created, a specific container is made available within the program, the contents of which can later be referenced. Variables are referenced by their name. For instance, creating and printing a string variable is done as shown below:

```python
message = "Hello world!"
print(message)
```

Negative
: Hello world!

A string enclosed in a programming language's quotation marks is called a "string literal", i.e., a string with a specified value. A common programming mistake is trying to put quotation marks around variable names. If there were quotation marks around the string variable `message`, the program would print the text "message" instead of the "Hello world!" text held by the `message` variable.

```python
message = "Hello world!"
print("message")
```

Negative
: message

#### Concatenation - Joining Strings Together

The string to be printed can be formed from multiple strings using the `+` operator. For example, the program below prints "Hello world!" on one line.

```python
def main():
    print("Hello " + "world!")

if __name__ == '__main__':
    main()
```

The same method can be used to join a string literal and the value of a string variable.

```python
def main():
    message = "Hello world!"
    print(message + "... and the universe!")

if __name__ == '__main__':
    main()
```

Negative
: Hello world! ... and the universe!

We can do the same with any number of strings.

```python
def main():
    start = "My name is "
    end = ", James Bond"
    print(start + "Bond" + end)

if __name__ == '__main__':
    main()
```

Negative
: My name is Bond, James Bond

Positive
: **Exercise - Hi Ada Lovelace!**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-5-hi-ada.git)

### Reading Strings

The `input` command reads the user's input and *returns* a string. If we then want to use the string in the program, it must be saved to a string variable. A value saved to a variable can be used repeatedly. In the example below, the user input is printed twice.

```python
def main():
    message = input('Write a message:')
    print(message)
    print(message)

if __name__ == '__main__':
    main()
```

Negative
: Write a message: <br> *User: \<This will be printed twice\>* <br> This will be printed twice <br> This will be printed twice

Positive
: **Exercise - Message Three Times**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-6-message-three-times.git)

### Input String as a Part of Output

We noticed in the "Hi Ava Lovelace!" exercise that string literals and string variables can be joined using the `+` -operator. The example below demonstrates a program that takes user input and prints it concatenated with a string literal.

```python
def main():
    message = input('Write a message:')
    print('You wrote: ' + message)

if __name__ == '__main__':
    main()
```

Negative
: Write a message: <br> *User: \<My message\>* <br> You wrote: My message

Positive
: **Exercise - Greeting**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-7-greeting.git)

### Program Execution Waits for Input

When the program's execution comes to a statement that attempts to read input from the user (the command `input()`), the execution stops and waits. The execution continues only after the user has written some input and pressed enter.

In the example below, the program prompts the user for three strings. First, the program prints `Write the first string: `, and then waits for user input. When the user writes some text, the program prints `Write the second string: `, and then waits for user input again. This continues for a third time, after which the program prints all three strings.

```python
def main():
    first = input('Write the first string:')
    second = input('Write the second string:')
    third = input('Write the third string:')

    print('You wrote: ')
    print(first)
    print(second)
    print(third)

if __name__ == '__main__':
    main()
```

Negative
: Write the first string: <br> *User: \<String number one\>* <br> Write the second string: <br> *User: \<String number two\>* <br> Write the third string: <br> *User: \<String number three\>* <br><br> You wrote: <br> String number one <br> String number two <br> String number three

Positive
: **Exercise - Conversation**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-8-conversation.git)

In the previous example, we saved the user input to three different string variables. This can be done as long as the variables all have different names (in the example, the names are `first`, `second` and `third`).

```python
def main():
    first = input('Write the first string:')
    second = input('Write the second string:')
    third = input('Write the third string:')

    print('You wrote: ')
    print(first)
    print(second)
    print(third)

if __name__ == '__main__':
    main()
```

We can form more complicated texts whose content changes depending on the user's input by using more strings. In the example below, the user is told a bit more about the texts they wrote -- notice that the order in which the strings are printed can be changed. In the example below, the third input string is printed first.

```python
def main():
    first = input('Write the first string:')
    second = input('Write the second string:')
    third = input('Write the third string:')

    print('You wrote: ')
    print("Last string you wrote was " + third + ", which ")
    print("was preceded by " + second+ ".")
    print("The first string was" + first + ".")

    print("All together: " + first + second + third)

if __name__ == '__main__':
    main()
```

Negative
: Write the first string: <br> *User: \<one\>* <br> Write the second string: <br> *User: \<two\>* <br> Write the third string: <br> *User: \<three\>* <br><br> Last string you wrote was three, which <br> was preceded by two. <br> The first string was one. <br> All together: onetwothree

Positive
: **Exercise - Story**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-9-story.git)

## Variables
Duration: 01:00:00

### What you'll learn
* Understand the concept of a variable. You know what variable types, names, and values are.
* Know how to create and use string, integer, floating-point, and boolean variables.

We've already familiarized ourselves with strings to a degree while dealing with user inputs. Let's turn our attention to learning about other variable *types* commonly used in Python.

A variable can be thought of as a container in which information of a given type can be stored. Examples of these different types include text (`string`), whole numbers (`int`), floating-point numbers (`float`), and whether something is true or false (`boolean`). A value is assigned to a variable using the equals sign (`=`).

```python
months = 12
```

In the statement above, the value of 12 is assigned to a variable called months. The statement could be read as: "the variable months is assigned the value 12". Note that type declaration is implicit in Python, and you don't necessarily have to declare the type in the assignment.

A variable's value can be joined to a string using the + sign, as seen in the following example.

```python
text = "contains text"
whole_number = 123
floating_point = 3.141592653
true_or_false = True

print("Text variable: " + text)
print("Integer variable: " + str(whole_number))
print("Floating-point variable: " + str(floating_point))
print("Boolean: " + str(true_or_false))
```

Negative
: Text variable: contains text <br> Integer variable: 123 <br> Floating-point variable: 3.141592653 <br> Booolean: true

Note that any variable types that aren't originally declared as strings, must be converted into a string with the `str()` command either before or during printing.

Positive
: **Exercise - Various Variables**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-10-various-variables.git)

### Changing a Value Assigned to a Variable

A variable exists from the moment of its declaration, and its initial value is preserved until another value is assigned to it. You can change a variable's value using a statement that comprises the variable name, an equals sign, and the new value to be assigned. Remember to keep in mind that the variable type is only stated during the initial variable declaration.

```python
number = 123
print("The value of the variable is " + str(number))

number = 42
print("The value of the variable is " + str(number))
```
Negative
: The value of the variable is 123 <br> The value of the variable is 42

Let's look at the preceding program's execution step-by-step. When a variable appears in the program for the first time, the computer creates a 'named container' for the variable and assigns it a type. Then, the value on the right side of the equals sign is copied into this named container. You can read more about how Python defines a variable's type [here](https://www.tutorialspoint.com/python/python_variable_types.htm).

Whenever a variable is referenced by its name in a program -- here, we want to print the string "The value of the variable is " followed by the value of the `number` variable -- its value is retrieved from a container that has the corresponding name.

The variable is then referenced again by its name in the program -- we again want to print the string "The value of the variable is " followed by the value of the `number` variable. We proceed as normal, retrieving the value of `number` from a container having its name.

 At the end of the program, you'll notice that the original value of the variable has vanished. A variable can hold only one value at a time.

### Variable Types

If you are used to certain other programming languages such as Java, you may have seen explicit declaration of type, such as:

```java
boolean myBool = false;
int value = 10;
```

This is not necessary in Python and Python variables do not need explicit declaration to reserve memory space. The declaration happens automatically when you assign a value to a variable.

Python is smart enough to understand the operations you are trying to achieve and will operate accordingly. For example, the program below:

```python
number1 = 1
number2 = 2
print(number1/number2)
```

will output:

Negative
: 0.5

whereas the similar Java code

```java
int number1 = 1;
int number2 = 2;
System.out.println(number1/number2);
```

would output:

Negative
: 0

since both types are integers. We will not go too much further into the mechanisms of type declaration in Python here, but you can find more about it through a Google search for "Type declarations in Python".

### Naming Variables

Naming variables is a fundamental aspect of describing a program. Let's look at two examples.

```python
a = 3.14
b = 22.0
c = a * b * b

print(c)
```
Negative
: 1519.76

```python
pi = 3.14
radius = 22
surface_area = pi * radius * radius

print(surface_area)
```

Negative
: 1519.76

Both of the preceding examples function the same way and output the same result. One of them is, however, much more understandable. The objective here is to compute the surface area of a circle. The value of pi is defined in the first row, the circle's radius in the second, and the surface area calculated in the third.

Positive
: **Variables Express the Program and the Problem to Be Solved** <br><br> Programming is a problem-solving tool. The aim is to create solutions for any given problem, such as the automation of control in cars. As a problem is approached, the developer decides on the terms used to describe the problem domain. The terminology that is chosen, such as variable names, will serve to describe the problem for anyone who is to work with it in the future. <br><br> As you're wording the problem that you're solving, think about the concepts related to that problem and appropriate terms that could be used to describe them. If you find it hard to come up with relevant names, think of the ones that definitely do not describe it. After this, settle on some terminology that you're going to use -- the good thing is that you can usually improve on it later on.
s
Variable naming is limited by certain constraints.

Variable names cannot contain certain special symbols, such as exclamation marks (!). Spaces are also not allowed, since they're used to separate parts of commands. Instead of spaces, the convention in many programming languages is to either use a style known as [camelCase](https://en.wikipedia.org/wiki/Camel_case "Camel case – Wikipedia") or [snake_case](https://en.wikipedia.org/wiki/Snake_case) to delimit words. Python variable names are always written in snake_case.

**Note!** The first letter of a variable name is always lower-cased:

```python
camelCaseVariable = 7 # will work, but not convention in Python
snake_case_variable = 7 # this is the format recommended by Python
```

Python has community guidelines on how code should be formatted. You can [view the guide here](https://www.python.org/dev/peps/pep-0008/). We will follow these guidelines as much as practicable in this course.

Numbers can be used within a variable name as long as the name does not begin with a number. Also, a name cannot consists of numbers only.

```python
7variable = 4 # Not allowed!
variable7 = 4 # Allowed, but is not a descriptive variable name
```

### Reading Different Variable Types from User

In the text-based user interfaces that we've used in our programs, the user's input is always read as a string, since the user writes their input as text. Reading strings from the user has become familiar by this point - we do it using the `input` command.

```python
text = input("Write text and press enter ")
print("You wrote " + text)
```

Negative
: Write text and press enter <br> *User \<text\>* <br> You wrote text

Other input types, such as integers, floats, and booleans must be converted to the target variable's type with the help of the `int`, `float` or `bool` methods provided by Python.

### The Type of the Variable Informs of Possible Values
A variable's type can be specificed after reading user input data. For example, a variable containing the string "text" is declared when read with the `input` call, and an integer having the value 42 can be declared using `int(varableName)`.

A variable's type determines the types of values that can be assigned to it. String types hold text, int types whole numbers, float floating-point numbers, and boolean types are either true or false.

As such, the possible values of a given variable type are limited. For example, a string cannot contain an integer, nor can a float contain a boolean value.

| Type | Example | Accepted values |
| --------------- | ---------------| --------------- |
| Whole number, i.e., `int` | `value = 4` | An integer can contain whole numbers whose values lie between -2147483648 and 2147483647. |
| Floating-point number, i.e., `float` | `value = 4.2` | Floating-point numbers contain decimal numbers, with the greatest possible value being approximately 2^1023. When a decimal number is represented with a floating-point number, the value can be inaccurate as floating-points are incapable of representing all decimal numbers. |
| `String` | `value = "Hi!"`| A string can contain text. Strings are enclosed in quotation marks. |
| True or false value, i.e., `bool`  | `right = True`| A boolean contains either the value `True` or `False`. (Note the capitalisation.) |

### Reading Integers

The `int` command converts a string to an integer. It takes the string containing the value to be converted as a parameter.

```python
value_as_string = "42"
value = int(value_as_string)

print(value)
```
Negative
: 42

When using a the `input` call, the reading of the value is usually inserted directly into the type conversion. This happens like so:

```python
def main():
    value = int(input("Write a value "))
    print("You wrote " + str(value))
```

Negative
: Write a value <br> *User \<42\>* <br> You wrote 42

Note that we had to convert our variable back to a string in the `print` statement in order to be able to concatenate it with the string "You wrote ". An error would have been thrown if we had ommited the `str()`.

Positive
: **Exercise - Different types of input**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-11-different-inputs.git)

## Calculating with numbers
Duration: 01:00:00

### What you'll learn
* Learn to perform calculations with the help of variables.
* Know how to form printable statements including both calculations (expressions) and strings.   

The basic mathematical operations are both familiar and straightforward: addition `+`, subtraction `-`, multiplication `*`, and division `/`. The precedence is also familiar: operations are performed from left to right with the parentheses taken into account. Expressions involving `*` and `/` are calculated before those involving `+` and `-`, as is customary in elementary school mathematics.

```python
first = 2
print(first) # prints 2
second = 4
print(second) # prints 4

sum = first + second # The sum of the values of the variables first and second is assigned to the variable sum
print(sum) # prints 6
```

### Precedence and Parentheses

You can affect the order of operations by using parentheses. Operations within parentheses are performed before those outside them.

```python
calculation_with_parentheses = (1 + 1) + 3 * (2 + 5)
print(calculation_with_parentheses) # prints 23

calculation_without_parentheses = 1 + 1 + 3 * 2 + 5
print(calculation_without_parentheses) # prints 13

```

The example above can also be divided into steps.

```python
calculation_with_parentheses = (1 + 1)
print(calculation_with_parentheses) # prints 2
calculation_with_parentheses = calculation_with_parentheses + 3 * (2 + 5)
print(calculation_with_parentheses) # prints 23

calculation_without_parentheses = 1 + 1
calculation_without_parentheses = calculation_without_parentheses + 3 * 2
calculation_without_parentheses = calculation_without_parentheses + 5
print(calculation_without_parentheses) # prints 13
```

Positive
: **Exercise - Seconds in a day**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-12-seconds-in-a-day.git)

Positive
: **Expression and Statement** <br><br> An *expression* is a combination of values that is turned into another value through a calculation or evaluation. <br><br> The evaluation of an expression is always performed before its value is assigned to a variable. As such, the calculation "1 + 1 + 3 * 2 + 5" in the example `value = 1 + 1 + 3 * 2 + 5` above is performed before the result is assigned to the variable.

An expression is evaluated where it occurs in the program's source code. As such, the evaluation can occur within a print statement, if the expression is used in calculating the value of the print statement's parameter.

```python
first = 2
second = 4

print(first + second)  # prints 6
print(2 + second - first - second)  # prints 0
```

An expression does not change the value stored in a variable unless the expression's result is assigned to a variable or used as a parameter, for instance, in printing.

```python
first = 2
second = 4

# the expression below does not even work, since
# the result is not assigned to any variable
# or given as a parameter to a print statement
first + second
```

### Calculating and Printing

The command `print` prints the value of a variable. The string literal to be printed, which is marked by quotation marks, can be appended with other content by using the operation `+`.

```python
length = 42
print("Length " + str(length))
```

Negative
: Length 42

```python
print("here is an integer --> " + str(2))
print(str(2) + " <-- here is an integer")
```

Negative
: here is an integer --> 2 <br> 2 <-- here is an integer

If one of the operands of the operation `+` is a string, the other operand must be changed into a string too during program execution. In the example below, the integer `2` is turned into the string "2", and a string has been appended to it.

The precedence introduced earlier also apply here:

```python
print("Four: " + str(2 + 2))
print("But! Twenty-two: " + str(2) + str(2))
```

Negative
: Four: 4 <br> But! Twenty-two: 22

Positive
: **Exercise - Sum of two numbers**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-13-sum-of-two-numbers.git)

Positive
: **Exercise - Sum of three numbers**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-14-sum-of-three-numbers.git)

Applying this knowledge, we can create an expression consisting of some text and a variable, which is evaluated in connection with the printing:

```python
x = 10

print("The value of the variable x is: " + str(x))

y = 5
z = 6

print("y is " + str(y) + " and z is " + str(z))
```

Negative
: The value of the variable x is: 10 <br> y is 5 and z is 6

Positive
: **Exercise - Addition formula**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-15-addition-formula.git)

Positive
: **Exercise - Multiplication formula**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-16-multiplication-formula.git)

Once you have completed the previous exercise, try finding out the greatest possible multiplication that you can calculate. The reason behind the phenomenon you'll observe is that the value of an integer value is capped at the maximum of 2^31-1 (i.e. 2147483647). This is because integer variables are represented with 32 bits in the computer's memory.

### Division

Division is accomplished in a similar way to addition and multiplication, but we have to be careful dividing by zero or something close to zero.

```python
result = 3 / 2
print(result)
```

Negative
: 1.5

Positive
: **Average** <br><br> The next exercises task you with calculating the average of the entered numbers. Let's briefly review the concept of *average*. <br><br> An average refers to the sum of numbers divided by their count. For instance, the average of the numbers 5 and 3 can be calculated with the formula (5+3)/2. Similarly, the average of the numbers 1, 2, and 4 is produced by the formula (1+2+4)/3. <br><br> In the context of programming, there are a few things to keep in mind. Firstly, dividing by zero is typically not permitted. This implies that calculating the average of zero numbers is impossible.

Positive
: **Exercise - Average of two numbers**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-17-average-of-two-numbers.git)

Positive
: **Exercise - Average of three numbers**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-18-average-of-three-numbers.git)

Positive
: **Exercise - Simple calculator**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-19-simple-calculator.git)

### Misunderstandings Related to the Value of a Variable

When a computer executes program code, it does it one command at a time, always advancing exactly as specified by the code. When a value is assigned to a variable, the same chain of events always occurs: the value on the right-hand side of the equality sign is copied and assigned to the variable on the left-hand side (i.e., copied to the location specified by that variable).

It's crucial for a programmer to understand that assigning a value to a variable always does the same thing.

Here's three common misunderstandings related to assigning a value to a variable:

* Viewing value assignment as a transfer instead of a copy operation: once `first = second` has been executed, it's often assumed that the value of the variable `second` has been moved to the value of the variable `first`, and that the variable `second` no longer holds a value, or that its value is 0, for instance. This is incorrect, as executing `first = second` means that the value in the position specified by `second` is merely copied to the place specified by the variable `first`. Hence, the variable `second` is not modified.

* Viewing value assignment as creating a dependency instead of being a copy operation: once `first = second` has been executed, it's often assumed that any change in the value of the variable `second` is automatically also reflected in the value of the variable `first`. This is incorrect; assignment -- i.e., copying -- is a one-off event. It only occurs when the program code `first = second` is executed.

* The third misunderstanding concerns the direction of copying: it's often thought that in executing `first = second` the value of the variable `first` is set as the value of the variable `second`. The confusion also manifests itself in situations where the programmer accidentally writes e.g. `42 = value` -- fortunately, IDEs provide support on this issue too.

Perhaps the best way to understand a program's execution flow is through the use of pen and paper. As you're reading the program, write down the names of any new variables, while making a note of how the values of the variables in the code change line by line. Let's demonstrate the execution with the following program code:

```python
line 1: first = (1 + 1)
line 2: second = first + 3 * (2 + 5)
line 3:
line 4: first = 5
line 5:
line 6: third = first + second
line 7: print(first)
line 8: print(second)
line 9: print(third)
```

The execution flow of the program above has been broken down below.

Negative
: line 1: initiate a variable first <br> line 1: copy the result of the calculation 1 + 1 as the value of the variable first <br> line 1: the value of the variable first is 2 <br> line 2: create the variable second <br> line 2: calculate 2 + 5, 2 + 5 -> 7 <br> line 2: calculate 3 * 7, 3 * 7 -> 21 <br> line 2: calculate first + 21 <br> line 2: copy the value of the variable first into the calculation, its value is 2 <br> line 2: calculate 2 + 21, 2 + 21 -> 23 <br> line 2: copy 23 to the value of the variable second <br> line 2: the value of the variable second is 23 <br> line 3: (empty, do nothing) <br> line 4: copy 5 to the value of the variable first <br> line 4: the value of the variable first is 5 <br> line 5: (empty, do nothing) <br> line 6: create variable third <br> line 6: calculate first + second <br> line 6: copy the value of the variable first into the calculation, its value is 5 <br> line 6: calculate 5 + second <br> line 6: copy the value of the variable second into the calculation, its value is 23 <br> line 6: calculate 5 + 23 -> 28 <br> line 6: copy 28 to the value of the variable third <br> line 6: the value of the variable third is 28 <br> line 7: print the variable first <br> line 7: copy the value of the variable first for the print operation, its value is 5 <br> line 7: print the value 5 <br> line 8: print the variable second <br> line 8: copy the value of the variable second for the print operation, its value is 23 <br> line 8: print the value 23 <br> line 9: print the variable third <br> line 9: copy the value of the variable third for the print operation, its value is 28 <br> line 9: we print the value 28 <br>

## Conditional statements and conditional operation
Duration: 01:00:00

### What you'll learn
* Become familiar with the idea of a conditional statement and know how to create a program containing optional operations through the use of conditional statements.
* Become familiar with comparison and logical operators commonly used in conditional statements.
* Know how to compare both numbers and strings, remembering the equals-command for strings.
* Become familiar with the order of execution for a conditional statement, and know that the parsing of a conditional statement stops at the first condition whose statement evaluates to true.

Our programs have so far been linear. In other words, the programs have executed from top to bottom without major surprises or conditional behaviour. However, we usually want to add conditional logic to our programs. By this we mean functionality that's in one way or another dependent on the state of the program's variables.

To branch the execution of a program based on user input, for example, we need to use something known as a **conditional statement**. The simplest conditional statement looks something like this.

```python
print("Hello, world!")
if True:
    print("This code is unavoidable!")
```

Negative
: Hello, world! <br> This code is unavoidable!

A conditional statement begins with the keyword `if` followed by a condition, which is evaluated when the conditional statement is reached. The result of the evaluation is a boolean value. No evaluation occurred above. Instead, a boolean value (`True`) was explicitly used in the conditional statement.

The condition is followed by a block, which is indented beneath. The source code inside the block is executed if the expression inside the parentheses evaluates to _true_.

Let's look at an example where we compare numbers in the conditional statement.

```python
number = 11
if (number > 10):
    print("The number was greater than 10")
```

If the expression in the conditional statement evaluates to true, the execution of the program progresses to the block defined by the conditional statement. In the example above, the conditional is "if the number in the variable is greater than 10". On the other hand, if the expression evaluates to false, the execution moves on to the statement after the closing curly bracket of the current conditional statement.

Positive
: **Exercise - Speeding ticket**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-20-speeding-ticket.git)

### Code Indentation and Block Statements

A code block refers to a section with a particular indentation level from the left hand-side.

Most of our programs have included a recurring snippet `def main():`, which begins a block, with the code inside the function indented below.

Blocks define a program's structure and its bounds. A conditional statement also marks the start of a new code block.

```python
# Look at the indentation below, which marks the blocks
def main(): #start block 1
    number = 10 #inside block 1
    if (number > 5): #start block 2
        print('This is greater than 5!') #inside block 2

if __name__ == '__main__':
    main() #outside block 1 and 2 but inside the if block
```

In addition to the defining program structure and functionality, block statements also have an effect on the readability of a program. Code living inside a block is indented. For example, any source code inside the block of a conditional statement is indented deeper than the `if` command that started the conditional statement. Indents can also be added by pressing the tab key (the key to the left of 'q'). When the block ends, the indentation also ends. Python has explicit style guidelines on how code should be indented in the [PEP 8](https://www.python.org/dev/peps/pep-0008) guidelines discussed previously. It boils down to:

- Use 4 spaces per indentation level.
- Use spaces instead of tabs.

The example below is incorrectly indented and will result in an error.

```python
if (number > 10):
number = 9
```

The example below is correctly indented.

```python
if (number > 10):
    number = 9
```

<text-box variant="hint" name="Automatic Code Indentation">

Positive
: Code in Python is indented by four spaces for each block. Use spaces for indentation, not tabs. The indentation might break in some cases if you use both spaces and tabs at the same time.

Our program code always needs to be indented correctly in the exercises as well. If the indentation is incorrect, the development environment will not accept the solution and will not run. You will see indentation errors in the test results.

### Comparison Operators

- `>` greater than
- `>=` greater than or equal to
- `<` less than
- `<=` less than or equal to
- `==` equal to
- `!=` not equal to

```python
number = 55

if (number != 0):
    print("The number is not equal to 0")

if (number >= 1000):
    print("The number is at least 1000")
```

Negative
: The number was not equal to 0

Positive
: **Exercise - Orwell**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-21-orwell.git)

Positive
: **Exercise - Ancient**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-22-ancient.git)

### Else

If the expression inside the parentheses of the conditional statement evaluates to false, then the execution of the code moves to the statement following the indentation block. This is not always desired, and usually we want to create an alternative option for when the conditional expression evaluates to false.

This can be done with the help of the `else` command, which is used together with the `if` command.

```python
number = 4

if (number > 5):
    print("Your number is greater than five!")
else:
    print("Your number is five or less!")
```

Negative
: Your number is five or less!

If an `else` branch has been specified for a conditional statement, the block defined by the else branch is run in the case that the condition of the conditional statement is false. The `else`-command is placed on the same line as the block defined by the `if`-command.

Positive
: **Exercise - Positivity**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-23-positivity.git)

Positive
: **Exercise - Adulthood**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-24-adulthood.git)

### More Conditionals: elif

In the case of multiple conditionals, we use the `elif`-command. The command `elif`, short for `else if`, is like `else`, but with an additional condition. `elif` follows the `if`-condition, and they may be multiple.

```python
number = 3

if (number == 1):
    print("The number is one")
elif (number == 2):
    print("The given number is two")
elif (number == 3):
    print("The number must be three!")
else:
    print("Something else!")
```

Negative
: The number must be three!

Let's read out the example above: 'If the number is one, then print "The number is one", else if the number is two, then print "The given number is two", else if the number is three, then print "The number must be three!". Otherwise, print "Something else!"'

Positive
: **Exercise - Larger Than or Equal To**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-25-larger-than-equal-to.git)

### Order of Execution for Comparisons

The comparisons are executed top down. When execution reaches a conditional statement whose condition is true, its block is executed and the comparison stops.

```python
number = 5

if (number == 0):
    print("The number is zero.")
elif (number > 0):
    print("The number is greater than zero.")
elif (number > 2):
    print("The number is greater than two.")
else:
    print("The number is less than zero.")

```

Negative
: The number is greater than zero.

The example above prints the string "The number is greater than zero." even if the condition `number > 2` is true. The comparison stops at the first condition that evaluates to true.

Positive
: **Exercise - Grades and Points**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-26-grades-and-points.git)

### Conditional Statement Expression and the Boolean Variable

The value that goes between the parentheses of the conditional statement should be of type boolean after the evaluation. `boolean` type variables are either _true_ or _false_.

```python
is_it_true = True
print("The value of the boolean variable is " + str(is_it_true))
```

Negative
: The value of the boolean variable is True

The conditional statement can also be done as follows:

```python
is_it_true = True
if (is_it_true):
    print("Pretty wild!")
```

Negative
: Pretty wild!

Comparison operators can also be used outside of conditionals. In those cases, the boolean value resulting from the comparison is stored in a boolean variable for later use.

```python
first = 1
second = 3
is_greater = first > second
```

In the example above, the boolean variable `isGreater` now contains the boolean value _false_. We can extend the previous example by adding a conditional statement to it.

```python
first = 1
second = 3
is_less_than = first < second

if (is_less_than):
    print("1 is less than 3!")
```

Negative
: 1 is less than 3!

The code above has been executed to the point where the program's variables have been created and assigned values. The variable `is_less_than` has `true` as its value. Next in the execution is the comparison `if (is_less_than)` -- the value for the variable `is_less_than` is found in its container, and the program finally prints:

Positive
: **Remainder**: <br><br> The modulo operator is a slightly less-used operator, which is, however, very handy when we want to check the divisibility of a number, for example. The symbol for the modulo operator is `%`.

```python
remainder = 7 % 2
print(remainder)  # prints 1
print(5 % 3)  # prints 2
print(7 % 4)  # prints 3
print(8 % 4)  # prints 0
print(1 % 2)  # prints 1
```

If we want to know whether the number given by the user is divisible by four hundred, we check if the remainder is zero after taking the modulo of the number and four hundred.

```python
number = int(input())
remainder = number % 400

if (remainder == 0):
    print("The number " + str(number) + " is divisible by four hundred.")
else:
    print("The number " + str(number) + " is not divisible by four hundred.")
```

Since the modulo is an operation just like other calculations, it can be a part of an expression in a conditional statement.

```python
number = int(input())

if (number % 400 == 0):
    print("The number " + str(number) + " is divisible by four hundred.")
else:
    print("The number " + str(number) + " is not divisible by four hundred.")
```

Positive
: **Exercise - Odd or Even**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-27-odd-or-even.git)

### Conditional Statements and Comparing Strings

We can compare integers, floating point numbers, and boolean values using two equals signs (`variable1 == variable2`). The same operator can be used to compare strings.

You can try this with the following program:

```python
first = input("Enter the first string")
second = input("Enter the second string")

if (first == second):
    print("The strings were the same!")
else:
    print("The strings were different!")
```

Negative
: Enter the first string <br> *User: \<same\>* <br> Enter the second string <br> *User: \<same\>* <br> The strings were the same!

Enter the first string <br> *User: \<same\>* <br> Enter the second string <br> *User: \<different\>* <br> The strings were different!

Positive
: **Exercise - Password**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-28-password.git)

Positive
: **Exercise - Same**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-29-same.git)

### Logical Operators

The expression of a conditional statement may consist of multiple parts, in which the logical operators **and** `and`, **or** `or`, and **not** `not` are used.

- An expression consisting of two expressions combined using the and-operator is true, if and only if both of the combined expressions evaluate to true.

- An expression consisting of two expressions combined using the or-operator is true if either one, or both, of the combined expressions evaluate to true.

- Logical operators are not used for changing the boolean value from true to false, or false to true.

In the next example we combine two individual conditions using `and`, i.e., the and-operator. The code is used to check if the number in the variable is greater than or equal to 5 and less than or equal to 10. In other words, whether it's within the range of 5-10:

```python
print("Is the number within the range 5-10: ")
number = 7

if (number >= 4 and number <= 10):
    print("It is! :)")
else:
    print("It is not :(")
```

Negative
: Is the number within the range 5-10: <br> It is! :)

In the next one we provide two conditions using `or`, i.e., the or-operator: is the number less than zero or greater than 100. The condition is fulfilled if the number fulfills either one of the two conditions:

```python
print("Is the number less than 0 or greater than 100")
number = 145

if (number < 0 or number > 100):
    print("It is! :)")
else:
    print("It is not :(")
```

Negative
: Is the number less than 0 or greater than 100 <br> It is! :)

In this example we flip the result of the expression `number > 4` using `not`, i.e., the not-operator. The not-operator is written in such a way that the expression to be flipped is wrapped in parentheses, and the not-operator is placed before the parentheses.

```python
number = 7

if (not (number > 4)):
    print("The number is not greater than 4.")
else:
    print("The number is greater than or equal to 4.")
```

Negative
: The number is greater than or equal to 4.

Positive
: **Exercise - Checking the age**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-30-checking-the-age.git)

### Execution Order of Conditional Statements

Let's familiarize ourselves with the execution order of conditional statements through a classic programming exercise.

_'Write a program that prompts the user for a number between one and one hundred, and prints that number. If the number is divisible by three, then print "Fizz" instead of the number. If the number is divisible by five, then print "Buzz" instead of the number. If the number is divisible by both three and five, then print "FizzBuzz" instead of the number.'_

The programmer begins solving the exercise by reading the exercise description and by writing code according to the description. The conditions for execution are presented in a given order by the description, and the initial structure for the program is formed based on that order. The structure is formed based on the following steps:

- Write a program that prompts the user for a number and prints that number.

- If the number is divisible by three, then print "Fizz" instead of the number.

- If the number is divisible by five, then print "Buzz" instead of the number.

- If the number is divisible by both three and five, then print "FizzBuzz" instead of the number.

If-type conditions are easy to implement using `if - elif - else` -conditional statements. The code below was written based on the steps above, but it does not work correctly, which we can see from the example.

```python
number = int(input())

if (number % 3 == 0):
    print("Fizz")
elif (number % 5 == 0):
    print("Buzz")
elif (number % 3 == 0 and number % 5 == 0):
    print("FizzBuzz")
else:
    print(number)
```

Negative
: *User: \<3\>* <br> Fizz

Negative
: *User: \<4\>* <br> 4

Negative
: *User: \<5\>* <br> Buzz

Negative
: *User: \<15\>* <br> Fizz

The problem with the previous approach is that **the parsing of conditional statements stops at the first condition that is true**. E.g., with the value 15 the string "Fizz" is printed, since the number is divisible by three (15 % 3 == 0).

One approach for developing this train of thought would be to first find the **most demanding condition**, and implement it. After that, we would implement the other conditions. In the example above, the condition "if the number is divisible by both three **and** five" requires two things to happen. Now the train of thought would be:

1. Write a program that reads input from the user.

2. If the number is divisible by both three and five, then print "FizzBuzz" instead of the number.

3. If the number is divisible by three, then print "Fizz" instead of the number.

4. If the number is divisible by five, then print "Buzz" instead of the number.

5. Otherwise the program prints the number given by the user.

Now the problem seems to get solved.

```python
number = int(input())

if (number % 3 == 0 and number % 5 == 0):
    print("FizzBuzz")
elif (number % 3 == 0):
    print("Fizz")
elif (number % 5 == 0):
    print("Buzz")
else:
    print(number)
```

Negative
: *User: \<3\>* <br> Fizz

Negative
: *User: \<4\>* <br> 4

Negative
: *User: \<5\>* <br> Buzz

Negative
: *User: \<15\>* <br> FizzBuzz

Positive
: **Exercise - Leap year**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-31-leap-year.git)

Positive
: **Exercise - Inheritance tax**  <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> If you are a student at Bridgend College, you will have received the exercise via email in your own repo. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-1-32-inheritance-tax.git)

## Programming in our society
Duration: 00:10:00

When you're just starting to learn programming, it's hard to realize how dependent our society actually is on the software produced by developers. Without software, everyday things such as communication, shopping, travel, and so on would all be more complicated. Mobile phones could not work -- or there would be very few of them, and we'd have no credit cards, let alone online banking. Travel reservations and the use of personal documents online would be impossible. Electronic health services such as e-prescriptions and the seamless transfer of patient data between wards and hospitals would be the stuff of dreams. There'd also be no Wikipedia or search engines, so any time you'd like to know something, you'd open a dictionary or an encyclopaedia.

As services become based on software, their inherent complexity becomes hidden from us. For instance, when you travel by air and check-in using an online form, the sending of the form sets off a series of communication between dozens of different systems. Information about your name, personal information, state of your passport, any possible visas, the state of your flight, and your previous flights are all checked. Your seat reservations pass through a seat-reservation management system, and your airline customer-loyalty status is reviewed. The amount of fuel the airplane needs to for refuelling will also need to be updated, and the list goes on. All of this happens as a result of you clicking the send button on the online form.

Software professionals are the architects of these kinds of digital services. It's the responsibility of those of us who study computer science and engineering to implement these systems in a way that ensures that they function as well as they can for their intended users -- and also for those not familiar with similar systems. At the same time, architects of digital services learn a lot about different business domains and the practicalities of everyday life. For instance, you already know more about inheritance taxation (the last part of the previous section) than most people do.

The end-users of a given system are seldom aware of those who produced it. For example, few have heard of [Margaret Hamilton](<https://en.wikipedia.org/wiki/Margaret_Hamilton_(scientist\)) who, with her team, wrote the program that took man to the moon.

Programming can be considered the artisanship of our time, and the ever-increasing demand for understanding software and digital systems is evident everywhere. Fundamentals of programming are already taught in elementary school; and various fields, including modern science, make use of software and its latest innovations in data analysis. Meteorologists, physicists and chemists also use software and many write code at work. Pedagogy and teacher training are also increasingly benefitting from the possibilities created by digitalization. It's now more difficult to list professions that are not impacted by software and digitalization than those that are.

You've now taken your first steps in the world of programming. During the course you will learn to write programs and understand how they work - you will categorize a program's sub-entities into small parts, and present the concepts that appear in the program as pieces working together in harmony. After the course, you may also begin to think about public services from a programmer's perspective and consider their functioning (or lack of it) in terms of the opportunities and limitations of software.

After this course, simple instructions, such as "_Buy two cartons of milk. If the shop has oranges, buy four of them._", will be viewed in a different way. Although this message may be clear to a human, a computer might end up buying four cartons of milk.

Great to have you on this journey!
