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
Duration: 0:02:00

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

This is the first programming exercise of this course. In this exercise, you'll familiarize yourself with the development environment.

Clone the repo [sandbox](https://github.com/btec-diploma-unit4-programming-master/sandbox.git) and open the file `sandbox.py`. You should see the code below.

``` python
def sandbox():
  #Write your program here

sandbox()
```

You should use this sandbox exercise to try out different things later on. When you encounter something new in the material, try it out in the sandbox first, and then solve the exercises on the topic.

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
