author: Scott Morgan
summary: The second part of the material focusses on repetition in programs and how to divide functionality into distinct units.
id: part-2
categories: btec-unit4
environments: Web
status: Draft
feedback link: https:#github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 2

## Recurring problems and patterns to solve them

### What you'll learn
* You recognize that certain sub-problems, such as reading input or calculations, recur in programs.
* You're aware of solution models to certain sub-problems.
* You practice combining solution patterns used on sub-problems to solve broader ones.

The same small problems, or "sub-problems", reappear in programs time after time: "Read input from the user", "Calculate the sum of values", and so forth.

Let's look at a few sub-problems and patterns for solving them.

### Reading User Input

The solution pattern for programming tasks involving reading user input is straightforward. If the program needs to calculate the square root of a function, we need to import some code which has been created for the task. We will use the library `numpy` for this, which is imported at the top of the example below.  Importing the tool makes it available for the program. Importing external libraries is an important part of programming, and allows us to not 'reinvent the wheel'.

```python
# Making the numpy library available in the program
import numpy as np

def sqrt():
    number = 9
    sqrt_number = np.sqrt(number)
    print(sqrt_number)

sqrt()
```

### Calculating

We quite often need to calculate something in a program, such as an average or a sum. The solution pattern to solve such problems is as follows.

1. Define the inputs required for the calculation and declare variables for them. Input refers to the values used in the calculation. You can typically identify the type of inputs from the problem description.
2. Identify the operation needed, and declare a variable for the result of the calculation. Perform the calculation using the inputs, and assign the result to the variable that was reserved for it. The type of the result can also usually be identified from the problem description.
3. Once the calculation is done, do something with its result. This can mean printing the result of a computation, or, for example, using it in calculating an average by dividing a sum of the inputs by their count.

For example, the solution pattern for the problem _Create a program to calculate the sum of two integers_ is the following.

```python
# Identifying the input values and declaring the variables for them
first = 1
second = 2

# Identifying the operation and declaring a variable for the result
sum = first + second

# printing the result of the calculation
print("The sum of " + str(first) + " and " + str(second) + " is " + str(sum))
```

A program that both reads and calculates combines both of these patterns. One that calculates the product of two integers provided by the user looks like this:

```python
def product():
    first = 1
    second = 2

    # Assigning the user input to the variables
    first = int(input())
    second = int(input())

    # Identifying the operation and declaring a variable for the result
    product = first * second

    # Printing the result of the operation
    print("The product of " + str(first) + " and " + str(second) + " is " + str(product))
```

In the example above, the program has been implemented so that the variables are declared first after which values are read into them. Variable declaration and the reading of values into them can also be combined into one.

Positive
: **Exercise - Squared** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-1-squared.git)

Positive
: **Exercise - Square Root of Sum** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-2-square-root-of-sum.git)

### Conditional Logic

Problems often contain some conditional logic. In these instances we use conditional statements. A conditional statement starts with an `if` command followed by an expression in parentheses. The expression evaluates to either true or false. If it evaluates true, the following block delimited by curly brackets gets executed.

```python
# if the value is greater than five
if (value > 5):
    # then...
```

A program that prints "ok" if the value of the variable is greater than `42`, and otherwise prints "not ok" looks like this:

```python
value = 15
if (value > 42):
    print("ok")
else:
    print("not ok")
```

You can also chain together multiple conditions. In such a case, the problem takes the form "if a, then b  elif c, then d  elif e, then f  otherwise g". The chain consists of an `if`-statement followed by `elif`-statements, each containing its own expression and a block.

```python
# if the value is greater than five
if (value > 5):
    # functionality when value is greater than five
elif (value < 0): #
    # functionality when value is less than zero
    # and the value IS NOT larger than five
else:  # otherwise
    # functionality otherwise
}
```

Conditional logic can be combined with other patterns used for problem solving. Let's look into a problem "Read two integers from the user. If the product of the integers is over 100, print `too much`. If the sum is less than 10, print `too little`. Otherwise, print `ok`. The program below combines reading, calculating and conditional functionality.

```python
def product():
    first = 1
    second = 2

    # Assigning the user input to the variables
    first = int(input())
    second = int(input())

    # Identifying the operation and declaring a variable for the result
    product = first * second

    # Printing the result of the operation
    if (product > 100):
        print('too much')
    elif (product < 10):
        print('too little')
    else:
        print('ok')
```

Positive
: **Exercise - Absolute Value** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-3-absolute-value.git)

Positive
: **Exercise - Comparing Numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-4-comparing-numbers.git)

## Repeating functionality

### What you'll learn
* You are familiar with loops and know how to create a program that contains one.
* You know how to use the `break` command to end a loop's execution and move onto its next statement.
* You know how to use `continue` command to return to the beginning of a loop.
* You are able to create a program that reads inputs from a user until a specific input is given. For example, the number 0 or the string "end", after which the program prints something about the provided inputs (e.g., the input count, and in the case of numbers their sum and average).

A computer's processor, which specializes in executing commands, is capable of executing -- in a modern computer -- over a billion (machine code) commands in a second.

 In this section, we'll get used to writing often-repeated program code with the help of loops.

Let's motivate ourselves to use loops. Below you'll find an example of a program that asks the user for five numbers and calculates their sum.

```python
sum = 0

print("Input a number: ")
sum = sum + int(input())

print("Input a number: ")
sum = sum + int(input())

print("Input a number: ")
sum = sum + int(input())

print("Input a number: ")
sum = sum + int(input())

print("Input a number: ")
sum = sum + int(input())

print("The sum of the numbers is " + str(sum))
```

It does the job, but not elegantly. What if the program had to read a hundred, or perhaps a thousand numbers and print their sum? What if the program had to read three numbers only?

The problem can be solved with a loop which keeps track of both the sum and the number of times input has been read. The program that prints the sum of five numbers now looks as follows

```python
numbersRead = 0
sum = 0

while (True):
    if (numbersRead == 5):
        break

    sum = sum + int(input("Input number"))
    numbersRead = numbersRead + 1

print("The sum of the numbers is " + str(sum))
```

Next off we will get familiar with loops.

## Loops and Infinite Loops

A loop consists of a statement that determines whether or not the code within the loop should be repeated, along with a block containing the source code to be repeated. A loop takes the following form.

```python
while (_statement_):
    # The content of the block
    # The block can have an unlimited amount of content
```

We'll use the value `True` as the loop's statement for now. This way, the loop's execution is always continued when the program arrives at the point that decides whether it should be repeated or not. This happens when the execution of the program first arrives at the loop statement for the first time, and also when it reaches the end of the loop's block.

The loop execution proceeds line-by-line. The following program outputs _I can program_ an infinite number of times.

```python
while (True):
    print("I can program!")
}
```

A program that runs infinitely does not end on its own. In Python, it can usually be shut down by the Ctrl-C command.

### Ending a Loop

The loop statement can be broken out of with command 'break'. When a computer executes the command 'break', the program execution moves onto the next command following the loop block.

The example below is a program that prints numbers from one to five. Note how the variable that's used within the loop is defined before the loop. This way the variable can be incremented inside the loop and the change sticks between multiple iterations of the loop.

```python
number = 1

while (True):
    print(number)
    if (number >= 5):
        break

    number = number + 1

print("Ready!")
```

Negative
: 1<br> 2 <br> 3 <br> 4 <br> 5 <br> Ready!

Breaking out of the loop occurs when a user enters a specified input or whenever a calculation performed in the loop ends in the desired result. These kinds of programs contain both a loop used to define a section to be repeated and also a conditional statement used to check whether or not the condition to exit the loop has been fulfilled.

Users can also be asked for input within a loop. The variables that are commonly used in loops  are defined before the loop, whereas variables (such as the value read from the user) that are specific to the loop are defined within it.

In the example below, the program asks the user whether to exit the loop or not. If the user inputs the string "y", the execution of the program moves to the command following the loop block, after which the execution of the program ends.

```python
while (True):
    print("Exit? (y exits)")
    message = input()
    if (message == "y"):
        break

    print("Ok! Let's carry on!")

print("Ready!")
```

The program in the example works as follows. The user's inputs are marked with *User:*.

Negative
: Exit? (y exits) <br> *User: \<no\>* <br> Ok! Let's carry on! <br> Exit? (y exits) <br> *User: \<non\>* <br> Ok! Let's carry on! <br> Exit? (y exits) <br> *User: \<y\>* <br> Ready! <br>

Positive
: **Exercise - Carry on?** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-5-carry-on.git)

In the previous example, the program read inputs of type string from the user. The program can also be implemented with other types of variables. The program below asks numbers from the user until the user inputs a zero.

```python
while (True):
    command = int(input("Input a number, 0 to quit"))
    if (command == 0):
        break

    print("You input " + str(command))

print("Done, thank you!")
```

The output of the program can be as follows:

Negative
: Input a number, 0 to quit <br> *User: \<5\>* <br> You input 5 <br> Input a number, 0 to quit <br> *User: \<-2\>* <br> You input -2 <br> Input a number, 0 to quit <br> *User: \<y\>* <br> Done, thank you! <br>

Positive
: **Exercise - Are we there yet?** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-6-are-we-there-yet.git)

## Returning to the Start of the Loop

When the execution reaches the end of the loop, the execution starts again from the start of the loop. This means that all the commands in the loop have been executed. You can also return to the beginning from other places besides the end with the command `continue`. When the computer executes the command `continue`, the execution of the program moves to the beginning of the loop.

The example below demonstrates the use of the `continue` command. The program asks the user to input positive numbers. If the user inputs a negative number or a zero, the program prints the message "Invalid number! Try again", after which the execution returns to the beginning of the loop. In the previous example, the program read inputs of type string from the user. Similar programs with different input types are also possible. In the example below, the user is asked for numbers until they input a zero.

```python
while (True):
    number = int(input("Insert positive integers"))

    if (number <= 0):
        print("Invalid number! Try again.")
        continue

    print("Your input was " + str(number))
```

The program in the example above is repeated infinitely since the `break` command used for exiting the loop is not used. To exit the loop, the `break` command must be added to it.

In the example below, the program is modified in such a way that the user is asked to input positive numbers. If the user inputs a negative number, the program informs them that the number was invalid and returns to the beginning of the loop. If the number was zero, the program exits the loop.

```python
while (True):
    number = int(input("Insert positive integers"))

    if (number == 0):
        break

    if (number <= 0):
        print("Invalid number! Try again.")
        continue

    print("Your input was " + str(number))
```

Positive
: **Exercise - Only positives** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-6-only-positives.git)

In the previous exercise, you made a program that asks the user for numbers. If the user entered a negative number, the program would inform them that the number was invalid, and if the user entered a zero, the program would exit. A possible solution to the exercise is the following.

```python
while (True):
    number = int(input("Input a number"))

    if (number == 0):
        break

    if (number <= 0):
        print("Invalid number! Try again.")
        continue

    print(number * number)
```

The program could be made by modifying the if-statement to another form. In the example below, the conditionals have been combined to replace separate if-statements.

```python
while (True):
    number = int(input("Input a number"))

    if (number == 0):
        break
    elif (number < 0):
        print("Invalid number")
        continue

    print(number * number)
```

Which of the previous examples was more clear?

Let's examine the clarity of the previous programs through an example. Below, the program asks the user for a number. If the number is negative, the user is informed that the number is invalid and the execution of the program goes to the beginning of the loop. If the number is zero, the program exits the loop. In other cases the program prints the square of the number, i.e., the number times itself.

```python
while (True):
    number = int(input("Input a number"))

    if (number < 0):
        print("Invalid number")
        continue
    }

    if (number == 0):
        break
    }

    print(number * number)
}
```

This program can also be done by combining the if-statements. In that case, the implementations would be the following.

```python
Scanner scanner = new Scanner(System.in)

while (True):
    number = int(input("Input a number"))

    if (number < 0):
        print("Invalid number")
    elif (number == 0):
        break
    else:
        print(number * number)
    }
}
```

Let's examine the previous programs with comments. Before each command, there's a comment that aims to explain what's happening in the program. Below is a program that's written with separate if-statements.

```python
# The task is to repeat the block until the block is exited
while (True):
    # The task is to ask the user for an input and read a number from the user
    number = int(input("Input a number"))

    # The task is to guard and prevent invalid numbers
    # for further processing
    if (number < 0):
        print("Invalid number")
        continue

    # The task is to check if the loop should be exited
    if (number == 0):
        break

    # The task is to print the square of the number
    print(number * number)
}
```

Note that every if-statement has a single, clear task.

When we comment on a program containing combined if-statements, the comments take the following form.

```python
# The task is to repeat the block until the block is exited
while (True):
    # The task is to ask the user for an input and read a number from the user
    number = int(input("Input a number"))

    # The purpose of the if-elif-else block?
    # The task is the processing of the number?
    if (number < 0):
        print("Invalid number")
    elif (number == 0):
        break
    else:
        print(number * number)
    }
}
```

We notice that it's difficult to define a single, clear task for `if-elif-else`-block. During the design and implementation of a program, it's desirable to aim for a situation in which every part of the program has a single, clear task. This theme repeats throughout the course.

## Calculation with Loops

Loops are used in computing many different things. For example, programs that process indefinite numbers of user-inputted values make use of loops. These kinds of programs typically print out some sort of statistics about the numbers that were read or other inputs after the end loop.

For the program to print out information from the loop execution after the loop, the information must be saved and modified during the loop.

If the variable used to store the data is introduced within the loop, the variable is only available within that loop and nowhere else.

Let's create a program to count and print out the number of ones entered by the user. Let's first create a non-working version and examine the action of the blocks.

```python
# The task is to read an input from the user
while (True):

    # The task is to keep count of number ones
    ones = 0

    # The task is to ask the user for an input and read a number from the user
    number = int(input("Input a number (0 exits)"))

    # The task is to exit the loop if the user
    # has inputted zero
    if (number == 0):
        break

    # The task is to increase the amount of ones
    # if the user inputs a number one
    if (number == 1):
        ones = ones + 1 #can also achieve the same thing by ones += 1

# The task is to print out the total of ones
# This doesn't work because the variable ones has been
# introduced within the loop
print("The total of ones: " + str(ones))
```

The previous program does not work because the variable `ones` is introduced within the loop, and an attempt is made to use it after the loop at the end of the program. The variable only exists inside the loop. If the print statement `print("The total of ones: " + ones) ` was inside the loop, the program would work, but not in the desired way. Let's examine this next.

```python
# The task is to read an input from the user
while (True):

    # The task is to keep count of number ones
    ones = 0

    # The task is to ask the user for an input and read a number from the user
    number = int(input("Input a number (0 exits)"))

    # The task is to exit the loop if the user
    # has inputted zero
    if (number == 0):
        break

    # The task is to increase the amount of ones
    # if the user inputs a number one
    if (number == 1):
        ones = ones + 1

    # The task is to print out the total of ones
    print("The total of ones: " + str(ones))
}
```

The example above works, but not in a way we hoped it would. Below the example output of the program

Negative
: Insert a number (0 exits) <br> *User: \<5\>* <br> The total of ones: 0 <br> Insert a number (0 exits) <br> *User: \<1\>* <br> The total of ones: 1 <br> Insert a number (0 exits) <br> *User: \<1\>* <br> The total of ones: 1 <br> Insert a number (0 exits) <br> *User: \<2\>* <br> The total of ones: 0 <br> Insert a number (0 exits) <br> *User: \<0\>*

If you wish to use a variable after a loop, it needs to be introduced before the loop.

In the example below, the program computes the total of number ones inputted. The inputs are read until the user inputs a zero after which the program prints the total count of number ones entered. The program uses variable `ones` to keep track of the number ones.

```python
# The task is to keep track of number ones
ones = 0

# The task is to read an input from the user
while (True):
    # The task is to ask the user for an input and read a number from the user
    number = int(input("Input a number (0 exits)"))

    # The task is to exit the loop if the user
    # has inputted zero
    if (number == 0):
        break

    # The task is to increase the amount of ones
    # if the user inputs a number one
    if (number == 1):
        ones = ones + 1

# The task is to print out the total of ones
print("The total of ones: " + str(ones))
```

Below is an example output of the program.

Negative
: Insert a number (0 exits) <br> *User: \<1\>* <br> Insert a number (0 exits) <br> *User: \<2\>* <br> Insert a number (0 exits) <br> *User: \<1\>* <br> Insert a number (0 exits) <br> *User: \<-1\>* <br> Insert a number (0 exits) <br> *User: \<0\>* <br> Total of ones: 2

Positive
: **Exercise - Number of Numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-7-number-of-numbers.git)

Positive
: **Exercise - Number of Negative Numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-8-number-of-negative-numbers.git)

The programs written in the previous exercises have read input from the user and kept track of the count of certain types of numbers. In the next exercise, the requested sum of numbers is not much different -- this time, rather than keeping track of the number of values entered, you add the number entered by the user to the sum.

Positive
: **Exercise - Sum of Numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-9-sum-of-numbers.git)

Sometimes you need to use multiple variables. The example below shows a program which reads numbers from the user until the user writes 0.
Then the program prints the number of positive and negative numbers given, and the percentage of positive numbers from all numbers given.

```python
# For saving number of numbers
numberOfPositives = 0
numberOfNegatives = 0

# For repeatedly asking for numbers
while (True):
    # The task is to ask the user for an input and read a number from the user
    numberFromUser = int(input("Input a number (0 exits)"))

    # For breaking the loop when user writes 0
    if (numberFromUser == 0):
        break

    # For increasing numberOfPositives by one
    # when user gives a positive number
    if (numberFromUser > 0):
        numberOfPositives = numberOfPositives + 1

    # For increasing numberOfNegatives by one
    # when user gives a negative number
    if (numberFromUser < 0):
        numberOfNegatives = numberOfNegatives + 1

    # Also could have used..
    # if (numberFromUser > 0):
    #     numberOfPositives = numberOfPositives + 1
    # else:
    #     numberOfNegatives = numberOfNegatives + 1
    # }

# For printing the number of positive numbers
print("Positive numbers: " + numberOfPositives)
# For printing the number of negative numbers
print("Negative numbers: " + numberOfNegative)

# For printing the percentage of positive numbers from all numbers
if (numberOfPositives + numberOfNegatives > 0):
    # Print only if user has given numbers
    # to avoid dividing by zero
    percentageOfPositives = 100.0 * numberOfPositives / (numberOfPositives + numberOfNegatives)
    print("Percentage of positive numbers: " + percentageOfPositives + "%")
}
```
