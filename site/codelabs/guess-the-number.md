author: Scott Morgan
summary: This codelab focusses on creating a simple guessing game in Python.
id: guess-the-number
categories: python-programming
environments: Web
status: Hidden
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Guess the number

## Guessing the computer's answer
Duration: 00:30:00

### What you'll learn
* Create a simple guessing game in Python.
* Get to grips with taking user input, loops and if statements.

In this short project, we'll be exploring how to create a *guess the random number* game. We'll start with guessing a number that the computer has chosen and then move on to having the computer guess a number that the user has chosen. This example should give you some practise working with loops and conditional statements and revise how to take and process user input.

### Working out the algorithm

It's always useful when starting out creating a program or an app to write down or draw the *flow* of the program, sometimes in something called [pseudocode](https://en.wikipedia.org/wiki/Pseudocode). We won't worry too much about the finer points of psuedocode here but we'll just sketch out the flow of what we want the program to do below:

```plaintext
computer chooses random number

loop until we get it right
    computer asks us to guess

    if the guess is right
        computer says yes
    otherwise
        computer says try again
```

It looks like there are four key components to this program that we'll have to address in our code.

- We need to know how to *choose a random number*. (You may find [this link](https://pynative.com/python-random-randrange/) helpful.)
- We need to know how to *take and process user input*.
- We need to know how to *loop until a condition*.
- We need to know how to *test if a statement is true*.

You can find the relevant informtion for each of these points in [Part 1](https://scott3142.uk/python-programming/codelabs/part-1/) and [Part 2](https://scott3142.uk/python-programming/codelabs/part-2/) of the course material.

### Improving the program

There are two natural places where we could add improvements to this program to make life a little bit easier for the guesser. At the moment, there is no limit on the random number that the computer guesses and there is no way of knowing if we were close or not with our guess. We could end up guessing forever and not getting the answer right! This doesn't make the game much fun, so let's look at the code again and see how we can change it.

We can change the first line so that a range is specified for the random number choice. You could even implement a levelling system here so that the range gets larger as users guess correctly more and more times.

```plaintext
computer chooses random number between 1 and 10
```

We can edit the conditional statements in the loop to deal with the second problem by adding print statements which tell us if our guess was too high or too low. This way, we're always getting closer to the answer on every guess.

```plaintext
if the number is too low
    computer says higher
if the number is too high
    computer says lower
```

In the next exercise you will implement this program yourself in Python.  

Positive
: **Exercise - Guess the number** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Accept exercise on Github Classroom](https://classroom.github.com/a/_rKYt4oC)

## Computer guesses user's answer
Duration: 00:30:00

### What you'll learn
* Create a simple guessing game in Python.
* Develop algorithmic thinking and optimisation skills.

This time around we'll be thinking of the number as a user and asking the computer to try and guess it. We'll follow exactly the same rules as before, but there are some added complexities in this version that we'll see as we go through it.

Let's look at the structure of the program, simply adapted from the previous version:

```plaintext
user thinks of random number (no coding here!)

loop until the computer gets it right
    computer guesses random number

    if the guess is right
        user inputs yes
    otherwise
        if the number is too low
            user inputs higher
        if the number is too high
            user inputs lower
```

**There are some potential issues with this implementation.** When it was the human guessing, we can be pretty confident that we wouldn't guess the same incorrect number twice, and that we understand what the terms *higher* and *lower* mean. This is not necessarily true of the computer as this algorithm stands, so let's take a look at how we can change it.

We need to fix two things:

- Tell the computer what *higher* and *lower* means.
- Don't let the computer guess the same answer twice.

In the following exercise, you will implement this program in Python. Can you fix the two points described above?

*Hint: You may want to use a list to store the guesses.*

Positive
: As a human, we might work out that there are some tricks to this game that make winning much easier. For example, if our first guess is exactly halfway between the two endpoints, we have the best chance of getting it right in the least number of moves possible. Can you implement this functionality? <br><br> Can you program the functionality that tracks how many guesses the computer took to get the right answer and see if it beats a user on average?

Positive
: **Exercise - Computer guess the number** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Accept exercise on Github Classroom](https://classroom.github.com/a/DBA_EnCh)

## Wrapping it all up in a web app
Duration: 00:30:00

### What you'll learn
* Getting started with web apps in Python.
* How to dynamically update a web app given user input.

The final part of this exercise will explore how we can build the *guess a number* functionality into a web app using Python's Flask library. We won't worry about the mechanisms of creating the pages and we won't bother with any HTML, CSS or JavaScript. The exercise files will contain all the relevant files you need to get going and just implement the Python part.

### Getting started with Flask  

The most basic task we can achieve in Flask is the age-old "*Hello World!*" application. Here's how it looks:

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run()
```

This code outputs "Hello, World!" in a web browser on your computer's localhost port 5000 (i.e. at [http://localhost:5000](http://localhost:5000)) when run with the `python3 app.py` command and the Flask library installed.

Positive
: In order to do this on your own machine, you'll have to: <br><br> - [Have Python installed](https://scott3142.uk/python-programming/codelabs/getting-started/index.html) <br> - [Activate a virtual environment](https://scott3142.uk/python-programming/codelabs/getting-started/index.html?index=..%2F..index#3) <br> - [Install Flask inside your virtual environment using pip](https://scott3142.uk/python-programming/codelabs/getting-started/index.html?index=..%2F..index#2)

You can set up a virtual environment and install `flask` using the following commands in a terminal:

```plaintext
user@host:~$ virtualenv flask_env
user@host:~$ source flask_env/bin/activate
user@host:~$ pip install flask
user@host:~$ python3 app.py
```

Once you have done that, clone the exercise repo below and follow the instructions in the README.

Positive
: **Exercise - Guessing the number in a web app** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Accept exercise on Github Classroom](https://classroom.github.com/a/ku4AAUEN)
