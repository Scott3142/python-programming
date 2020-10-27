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

If you would like to work inside a local development environment on your machine, you can [skip ahead](https://scott3142.uk/python-programming/codelabs/local-development-environment/index.html?index=..%2F..index#1) to the next section, but if you are having trouble installing Python or Atom, or you are on a Chromebook or device for which you don't have administrative rights then read on for a browser-based solution using the software [Repl.it](https://repl.it/~).

### The browser-based software Repl.it

There is an alternative method available for accessing the materials in this course, based around browser-based software [Repl.it](https://repl.it/~). This method will be useful if you don't particularly want or need to set up a local development environment, if you are having trouble installing Python or Atom, or you are on a Chromebook or device for which you don't have administrative rights. To begin this course, you will need to sign up for a [Github](https://github.com) account.

**Note:** This feature is currently (as of October 2020) in beta, so may not work as expected.

You can watch the video below to see the steps required to work on the exercises in Repl.it or read more about the process in the [Github documentation](https://classroom.github.com/help/student-experience-replit).

replace-with-replit-video

#### Testing your code in Repl.it

You can test your code to see if it is correct before submitting the exercises back to Github. You can invoke and run the `pytest` library with the following command, directly inside Repl.it.

```
python -m pytest
```

We will cover testing in greater detail later in the notes ([see here](https://scott3142.uk/python-programming/codelabs/part-6/index.html?index=..%2F..index#2)), but if you are interested you can view the automated tests that are run in the `tests/` directory of the exercise repos.

#### Known bugs and issues with Repl.it and Github integration

The Repl.it integration with the exercises from this course is still in beta, so some features are not as slick or as user-friendly as one might like. The notes below describe some of the known issues and propose some workarounds.

Repl's authorisation process is long winded and requires quite a bit of refreshing the page, exiting and coming back. Make sure you are signed into Repl.it with your Github account _before_ accepting the assignment.

Sometimes the 'Work in Repl.it' button doesn't show up in the Github repository after it is created. You can manually force the link to show by clicking _update_ in the page that appears after you 'Accept this exercise on Google Classroom'. If this doesn't work, you can 'Import' your repository into Repl.it directly from Github following the instructions [here](https://blog.repl.it/github#:~:text=Now%20you%20can%20instantly%20run,to%20README%20files%20near%20you.).

Positive
: You can run a program in Atom by the keyboard combination Ctrl+Shift+B, if you have the `script` package installed as in the first part. In order to _test_ the program in Atom, you will need an understanding of the file structure and use of your computer's terminal. This process is not explicitly covered in these notes, but you can find out more information [in these pages](https://realpython.com/pytest-python-testing/).

Even though running the program is straightforward, a lot is happenings behind the scenes. When a program is run, the source code is first compiled into Python bytecode. This compilation process is done by the Python compiler, which itself is a program. Following that, the program gets executed, meaning the commands are executed one-by-one by a Python interpreter that is able to read Python bytecode.

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
: **Note:** If you don't want or need to set up a local development environment at this stage, and you are happy working in Repl.it, you can safely [skip ahead](https://scott3142.uk/python-programming/codelabs/part-1/index.html?index=..%2F..index#0) to Part 1 of the notes. If you are just starting out with Python and you're not planning to do any serious software development yet, this is probably the recommended course of action. If you'd like to set up Python on your computer, gain an understanding of the command line and Git, carry on to the [next section](https://scott3142.uk/python-programming/codelabs/local-development-environment/index.html?index=..%2F..index#0).
