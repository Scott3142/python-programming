author: Scott Morgan
summary: Setting up git and virtual environments
id: getting-started
categories: python-programming
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Getting Started

## Using these notes
Duration: 00:20:00

### What you'll learn
* An introduction to Python, and how to get started with this course.

Modern programming is practically always done in an IDE (integrated development environment). An IDE contains a set of useful tools for the programmer. It does not create the program by itself, but it can give hints about common mistakes in the code, and help the programmer understand the structure of the program.

There are many IDEs that can be used with Python, including [PyCharm](https://www.jetbrains.com/pycharm), [Idle](https://docs.python.org/3/library/idle.html) and [VS Code](https://code.visualstudio.com/). At the risk of sparking some heated debate ("I love vim", "nano 4eva" etc.), the text editor we recommend and support on this course is called Atom. Atom describes itself as a "hackable text editor for the 21st Century" and is built and maintained by [Github](https://github.com/), which we will also use extensively throughout this course.

If you would like to work inside a local development environment on your machine, you can [skip ahead](https://scott3142.uk/python-programming/codelabs/local-development-environment/index.html?index=..%2F..index#0) to the next section, but if you are having trouble installing Python or Atom, or you are on a Chromebook or device for which you don't have administrative rights then read on for a browser-based solution using the software [Repl.it](https://repl.it/~).

### The browser-based software Repl.it

There is an alternative method available for accessing the materials in this course, based around browser-based software [Repl.it](https://repl.it/~). This method will be useful if you don't particularly want or need to set up a local development environment, if you are having trouble installing Python or Atom, or you are on a Chromebook or device for which you don't have administrative rights. To begin this course, you will need to sign up for a [Github](https://github.com) account.

You can test your code to see if it is correct before submitting the exercises back to Github. You can invoke and run the `pytest` library with the following command, directly inside Repl.it.

```
python -m pytest
```

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

Positive
: **Note:** If you don't want or need to set up a local development environment at this stage, and you are happy working in Repl.it, you can safely [skip ahead](https://scott3142.uk/python-programming/codelabs/part-1/index.html?index=..%2F..index#0) to Part 1 of the notes. <br><br> If you are just starting out with Python and you're not planning to do any serious software development yet, this is probably the recommended course of action. <br><br> If you'd like to set up Python on your computer, gain an understanding of the command line and Git, carry on to the [next section](https://scott3142.uk/python-programming/codelabs/local-development-environment/index.html?index=..%2F..index#0).
