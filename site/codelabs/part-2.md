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

### Loops and Infinite Loops

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

### Returning to the Start of the Loop

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

    if (number == 0):
        break

    print(number * number)
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
```

We notice that it's difficult to define a single, clear task for `if-elif-else`-block. During the design and implementation of a program, it's desirable to aim for a situation in which every part of the program has a single, clear task. This theme repeats throughout the course.

### Calculation with Loops

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
    #

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
```

Positive
: **Exercise - Number and sum of numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-10-number-and-sum-of-numbers.git)

Positive
: **Exercise - Average of numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-11-average-of-numbers.git)

Positive
: **Exercise - Average of positive numbers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-12-average-of-positive-numbers.git)

## More loops

### What you'll learn
* You're familiar with the condition of the while loop.
* You know how to use the for loop.
* You recognize situations where a while loop should be used and those where a for loop is more appropriate.

The "while-true" loop we've been using is very handy when the program has to repeat a functionality until the user provides certain input.

Next, we'll come to know a few other ways to implement loops.

### While Loop with a Condition

So far we have been using a loop with the boolean `True` in its parenthesis, meaning the loop continues forever (or until the loop is ended with the `break` command ).

Actually, the parenthesis of a loop can contain a conditional expression, or a condition, just like the parenthesis of an `if` statement. The  `True` value can be replaced with an expression, which is evaluated as the program is executed. The expression is defined the same way as the condition of a conditional statement.

The following code prints the numbers 1,2,...,5. When the value of the variable `number` is more than 5, the `while`-condition evaluates to false and the execution of the loop ends for good.

```python
number = 1

while (number < 6):
    print(number)
    number+= 1
```

The code above can be read "As long as the value of the variable number is less than 6, print the value of the variable number and increase the value of the variable number by one".

Above, the value of the variable `number` is increased by one every time the loop body is executed.

### For Loop

Above, we learned how a `while` loop with a condition can be used to go through numbers in a certain interval.

The structure of this kind of loop is the following.

```python
i = 0
while (i < 10):
    print(i)
    i+= 1
```

The above loop can be split into three parts. First we introduce the variable `i`, used to count the number of times the loop has been executed so far, and set its value to 0: `i = 0 `. This is followed by the definition of the loop -- the loop's condition is `i < 10` so the loop is executed as long as the value of the variable `i` is less than 10. The loop body contains the functionality to be executed `print(i) `, which is followed by increasing the value of the variable `i+= 1`. The command `i+= 1` is shorthand for `i = i + 1`.

The same can be achieved with a `for` loop like so.

```python
for i in range(1,10):
    print(i)

```

A `for` loop contains three parts:
- introducing the index variable `i` for counting the number of executions
- the condition of the loop
- the functionality to be executed.

```python
for target_list "in" expression_list:
    # Functionality to be executed
```

We will continue practicing loops in the following exercises. You can use either a `while` loop with a condition, or a `for` loop.

Positive
: **Exercise - Counting** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-13-counting.git)

Positive
: **Exercise - Counting to a hundred** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-14-counting-to-hundred.git)

Positive
: **Exercise - From where to where?** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-15-from-where-to-where.git)

### On Stopping a Loop Execution

A loop does not stop executing immediately when its condition evaluates to true. A loop's condition is evaluated at the start of a loop, meaning when (1) the loop starts for the first time or (2) the execution of a previous iteration of the loop body has just finished.

Let's look at the following loop.

```python
number = 1

while (number != 2):
    print(number)
    number = 2
    print(number)
    number = 1
```

It prints the following:

Negative
: 1 <br> 2 <br> 1 <br> 2 <br> 1 <br> 2 <br> ...

Even though `number` equals 2 at one point, the loop runs forever.

**The condition of a loop is evaluated when the execution of a loop starts and when the execution of the loop body has reached the closing curly bracket.** If the condition evaluates to  `True`, execution continues from the top of the loop body. If the condition evaluates to `False`, execution continues from the first statement following the loop.

### Repeating Functionality

One common subproblem type is to "do something a certain amount of times".

What's common to all these programs is repetition. Some functionality is done repeatedly, and a counter variable is used to keep track of the repetitions.

The following program calculates the product 4*3 somewhat clumsily, i.e., as the sum 3 + 3 + 3 + 3:

```python
result = 0

i = 0
while (True):
    result += 3  # shorthand for result = result + 3
    i+= 1   # shorthand for i = i + 1

    if (i == 4):
        break

print(result)
```

The same functionality can be achieved with the following code.

```python
result = 0

i = 0
while (i < 4):
    result += 3  # shorthand for result = result + 3
    i+= 1   # shorthand for i = i + 1

print(result)
```

Or by using a for loop as seen in the following.

```python
result = 0

for i in range(4):
    result += 3

print(result)
```

Positive
: **Exercise - Sum of a sequence** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-16-sum-of-a-sequence.git)

Positive
: **Exercise - Sum of a sequence - the sequel** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-17-sum-of-a-sequence-2.git)

Positive
: **Exercise - Factorial** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-18-factorial.git)

### On the Structure of Programs Using Loops

In the previous examples, we have concentrated on cases where the loop is executed a predetermined number of times. The number of repetitions can be based on user input -- in these cases, the for loop is quite handy.

In programs where the loop body has to be executed until the user gives certain input, the for loop is not too great. In these cases, the while-true loop we practiced earlier works well.

Let's take a look at a somewhat more complex program that reads integers from the user. The program handles negative numbers as invalid, and zero stops the loop. When the user enters zero, the program prints the sum of valid numbers, the number of valid numbers and the number of invalid numbers.

A possible solution is detailed below. However, the style of the example is not ideal.

```python
print("Write numbers, negative numbers are invalid: ")
sum = 0
validNumbers = 0
invalidNumbers = 0

while (True):
    message = int(input())

    if (message == 0):
        print("Sum of valid numbers: " + str(sum))
        print("Valid numbers: " + str(validNumbers))
        print("Invalid numbers: " + str(invalidNumbers))
        break

    if (message < 0):
        invalidNumbers+= 1
        continue

    sum += message
    validNumbers+= 1
```

In the code above, the computation executed after the loop has ended has been implemented inside of the loop. This approach is not recommended as it can easily lead to very complex program structure. If something else -- for example, reading more input -- is to be done when the loop ends, it could also easily end up being placed inside of the loop. As more and more functionality is needed, the program becomes increasingly harder to read.

Let's stick to the following loop structure:

```python
# Create variables needed for the loop

while (True):
    # read input

    # end the loop -- break

    # check for invalid input -- continue

    # handle valid input

# functionality to execute after the loop ends
```

In other words, the program structure is cleaner if the things to be done after the loop ends are placed outside of it.

```python
Scanner reader = new Scanner(System.in)

print("Write numbers, negative numbers are invalid: ")
sum = 0
validNumbers = 0
invalidNumbers = 0

while (True):
    message = int(input())

    if (message == 0):
        break


    if (message < 0):
        invalidNumbers+= 1
        continue


    sum += message
    validNumbers+= 1

print("Sum of valid numbers: " + str(sum))
print("Valid numbers: " + str(validNumbers))
print("Invalid numbers: " + str(invalidNumbers))
```

Positive
: **Exercise - Repeating, breaking and remembering** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-19-repeating-breaking-and-remembering.git)

Positive
: **Implementing a program one small part at a time** <br><br> In the previous exercise, we used a series of exercises to practice implementing a program one piece at a time. <br><br> When you are writing a program, whether it's an exercise or a personal project, figure out the types of parts the program needs to function and proceed by implementing them one part at a time. Make sure to test the program right after implementing each part. <br><br> Never try solving the whole problem at once, because that makes running and testing the program in the middle of the problem-solving process difficult. Start with something easy that you know you can do. When one part works, you can move on to the next. <br><br> Some of the exercises are already split into parts. However, it's often the case in programming that these parts need to be split into even smaller parts. You should almost always run the program after every new line of code. This ensures that the solution is moving in the right direction. <br><br>

## Methods &amp; Classes

### What you'll learn
* You will be familiar with the concept of a class.
* You are familiar with the concepts of a method parameter, a method's return value, and a program's call stack.
* You can create parameterized and non-parameterized methods, and you can create methods that return a value.

So far, we've used various commands: value assignment, calculations, conditional statements, and loops.

Printing to the screen has been done with the statement `print()`, and the reading of values with `input()`. `if` has been used in conditional statements, and `while` and `for` in loops. We notice that printing and reading operations somewhat differ from `if`, `while`, and `for` in that the print and read commands are followed by parentheses, which may include parameters passed to the command. The ones that "end in parentheses" are not actually commands, but methods.

Technically speaking, **a method** is a named set of statements. It's a piece of a program that can be called from elsewhere in the code by the name given to the method. For instance `print("I am a parameter given to the method!")` calls a methods that performs printing to the screen. The internal implementation of the method -- meaning the set of statements to be executed -- is hidden, and the programmer does not need to concern themselves with it when using the method.

So far all the methods we have used have been ready-made Python methods. Next we will learn to create our own methods.

### Custom Methods

**A method** means a named set consisting of statements that can be called from elsewhere in the program code by its name. Programming languages offer pre-made methods, but programmers can also write their own ones. It would, in fact, be quite exceptional if a program used no methods written by the programmer, because methods help in structuring the program. From this point onward nearly every program on the course will therefore contain custom-created methods.

We will also introduce the concept of a class here, which will become far clearer as we go through the course. A Class is like an object constructor, or a "blueprint" for creating objects.

To create a class, use the keyword `class`:

```python
class MyClass:
  x = 5
```

Now we can use the class named MyClass to create objects. Create an object named p1, and print the value of x:

```python
class MyClass:
  x = 5

p1 = MyClass()
print(p1.x)
```

Negative
: 5

The examples above are classes and objects in their simplest form, and are not really useful in real life applications.

To understand the meaning of classes we have to understand the built-in `__init__()` function.

All classes have a function called `__init__()`, which is always executed when the class is being initiated.

Use the `__init__()` function to assign values to object properties, or other operations that are necessary to do when the object is being created:

In the code boilerplate, methods are written outside of the function `__init__()`, yet inside out the "outermost" class block. They can be located above or below the `__init__()`.

```python
class Example:
    def __init__(self, *args):
        # program code

    # your own methods here
```

This can be confusing at first, but the concept of a class, including what the keywords `self` and `*args` mean will be clearer later in the course. For now, let's turn our attention back to methods an observe how to create a new method. We'll create the method `greet`.

```python
def greet():
    print("Greetings from the method world!")
```

Note the subtle difference between a *method* and a *function*. Until now, we have used functions such as

```python
def add():
  a = 2
  b = 3
  print(a+b)

add()
```

This can become a method when we insert it into a suitable place.

```python
class Example:
    def __init__(self, *args):
        # program code

    # your own methods here
    def greet():
        print("Greetings from the method world!")
```

The definition of the method consists of two parts. The first line of the definition includes the name of the method, i.e. `greet`.  Beneath the line containing the name of the method is a code block, inside of which is the code of the method -- the commands that are executed when the method is called. The only thing our method `greet` does is write a line of text on the screen.

Calling a custom method is simple: write the name of the methods followed by a set of parentheses. In the following snippet the main program (main) calls the greet method four times in total.

```python
class Example:
    def __init__(self, *args):
        # program code
        print("Let's try if we can travel to the method world:")
        greet()

        print("Looks like we can, let's try again:")
        greet()
        greet()
        greet()

    # your own methods here
    def greet():
        print("Greetings from the method world!")

def main():
    myClass = Example()

main()
```

The execution of the program produces the following output:

Negative
: Let's try if we can travel to the method world: <br> Greetings from the method world! <br> Looks like we can, let's try again: <br> Greetings from the method world! <br> Greetings from the method world! <br> Greetings from the method world! <br>

The order of execution is worth noticing. The execution of the program happens by executing the lines of the main function (`main`) in order from top to bottom, one at a time. When the encountered statement is a method call, the execution of the program moves inside the method in question. The statements of the method are executed one at a time from top to bottom. After this the execution returns to the place where the method call occured, and then proceeds to the next statement in the program.

When the program starts, the operating system calls `main`. The main function is the starting point for the program, since the execution begins from its first line. The execution of a program ends at the end of the main function.

Positive
: **Methods vs Functions** <br><br> A method in python is somewhat similar to a function, except it is associated with object/classes. Methods in python are very similar to functions except for two major differences. <br><br> 1. The method is implicitly used for an object for which it is called. <br> 2. The method is accessible to data that is contained within the class. <br><br> You can read more [here](https://www.tutorialspoint.com/difference-between-method-and-function-in-python).

Positive
: **Exercise - In a hole in the ground** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-20-in-a-hole-in-the-ground.git)

Positive
: **Exercise - Reprint** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-21-reprint.git)

From here on out, when introducing methods, we will not explicitly mention that they must be located in the correct place. Methods cannot be defined e.g. inside other methods.

### On Naming Methods

According to the [PEP 8 guidelines](https://www.python.org/dev/peps/pep-0008/), the names of methods use the function naming rules and therefore should be entirely lowercase with words separated by underscores as necessary to improve readability.

In the code example below the method is poorly named. It begins with an upper-case letter and the words are incorrectly separated. The parentheses after the method name have a space between and indentation in the code block is incorrect.

```python
def Thismethod_says_woof ( ):  
  print("woof")
```

In contrast the method below is correctly named: The name is entirely lowercase with words separated by underscores as necessary to improve readability. The parentheses sit next to one another and the contents are correctly indented (the method has its own code block, so the indentation of the code is four characters).

```python
def this_method_says_woof():
    print("woof")
```

### Method Parameters

**Parameters** are values given to a method that can be used in its execution. The parameters of a method are defined on the uppermost line of the method within the parentheses following its name. The values of the parameters that the method can use are copied from the values given to the method when it is executed.

In the following example a parameterized method `greet` is defined. It has a parameter called `numOfTimes`.

```python
def greet(numOfTimes):
    i = 0
    while (i < numOfTimes):
        print("Greetings!")
        i+= 1
```

We will call the method `greet` with different values. The parameter `numOfTimes` is assigned the value `1`on the first call, and `3`on the second.

```python
def __init__(self):
    self.greet(1)
    print("")
    self.greet(3)
```

Negative
: Greetings! <br><br> Greetings! <br> Greetings! <br> Greetings!

Just like when calling the predefined method `print`, you can pass an expression as a parameter.

```python
def __init__(self):
    greet(1 + 2)
```

Negative
: Greetings! <br> Greetings! <br> Greetings!

If an expression is used as a parameter for a method, the expression is evaluated prior to the method call. Above, the expression evaluates to `3` and the final method call is of the form `greet(3) `.

Positive
: **Exercise - From one to parameter** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-22-from-one-to-parameter.git)

Positive
: **Exercise - From parameter to one** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-23-from-parameter-to-one.git)

### Multiple Parameters

A method can be defined with multiple parameters. When calling such a method, the parameters are passed in the same order.

```python
def sum(int first, int second):
    print("The sum of numbers " + str(first) + " and " + str(second) + " is " + str(first + second))
```

```python
sum(3, 5)

number1 = 2
number2 = 4

sum(number1, number2)
```

Negative
: The sum of numbers 3 and 5 is 8 <br> The sum of numbers 2 and 4 is 6

Positive
: **Exercise - Division** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-24-division.git)

### Parameter Values Are Copied in a Method Call

As a method is called **the values of its parameters are copied**. In practice, this means that both the main method and the method to be called can use variables with the same name. However, changing the value of the variables inside the method does not affect the value of the variable in the main method that has the same name. Let's examine this behavior with the following program.

```python
class Example:
    def __init__(self):
        min = 5
        max = 10

        self.printNumbers(min, max)
        print()

        min = 8

        self.printNumbers(min, max)

    def printNumbers(self,min, max):
        while (min < max):
            print(min)
            min += 1

def main():
    myClass = Example()

main()
```

The output of the program is:

Negative
: 5 <br> 6 <br> 7 <br> 8 <br> 9 <br><br> 8 <br> 9

 So, method parameters are distinct from the variables (or parameters) of other methods, even if they had the same name. As a variable is passed to a method during a method call, the value of that variable gets copied to be used as the value of the parameter variable declared in the method definition. Variables in two separate methods are independent of one another.

To further demonstrate this point, let's consider the following example. We define a variable called `number` in the main method. That variable is passed as a parameter to the method `incrementByThree`.


```python
# main program
def __init__(self):
    number = 1
    print("The value of the variable 'number' in the main program: " + number)
    incrementByThree(number)
    print("The value of the variable 'number' in the main program: " + number)

# method
def incrementByThree(self, number):
    print("The value of the method parameter 'number': " + number)
    number = number + 3
    print("The value of the method parameter 'number': " + number)
```

The execution of the program produces the following output.

Negative
: The value of the variable 'number' in the main program: 1 <br> The value of the method parameter 'number': 1 <br> The value of the method parameter 'number': 4 <br> The value of the variable 'number' in the main program: 1

When the variable `number` is incremented inside the method, there's no issue. This, however, is not reflected in the `number` variable of the main program. The `number` variable living in the main program is different from the `number` variable of the method.
The parameter `number` is copied for the method's use, i.e., a new variable called `number` is created for `incrementByThree` method, to which the value of the variable`number` in the main program is copied during the method call. The variable `number` inside the method `incrementByThree` exists only for the duration of the method's execution and has no relation to the variable of the same name in the main program.

### Methods & Functions Can Return Values

To return a value, we use the command `return` followed by the value to be returned (or the name of the variable whose value is to be returned).

```python
def alwaysReturnsTen(self):
    return 10
```

The method defined above returns a value of `10` when called. For the return value to be used, it must be stored in a variable. This is done the same way as regular value assignment to a variable, by using an equals sign.

```python
def __init__(self):
    number = alwaysReturnsTen()

    print("the method returned the number " + str(number))
```

The return value can also be used in any other expression.


```python
number = 4 * alwaysReturnsTen() + (alwaysReturnsTen() / 2) - 8

print("the result of the calculation " + str(number))
```

Positive
: **Exercise - Numero uno** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-25-numero-uno.git)

When execution inside a method reaches the command `return`, the execution of that method ends and the value is returned to the calling method. Any lines of source code following the command `return` are never executed.

```python
def functioningMethod(self,parameter):
    if (parameter > 10):
        return 10

    print("The number received as parameter is ten or less.")

    return parameter

    print("This is never reached.")
```

If a method has the form `def nameOfMethod()` it is possible to return from it -- in other words, to stop its execution in that place -- with the `return` command that is not followed by a value. For instance:

```python
def division(self,numerator, denominator):
    if (denominator == 0):
        print("Can not divide by 0!")
        return

    print("" + str(numerator) + " / " + str(denominator) + " = " + str(1.0 * numerator / denominator))
```

### Defining Variables Inside Methods

Defining variables inside methods is done in the same manner as in the "main program". The following method calculates the average of the numbers it receives as parameters. Variables `sum` and `avg` are used to help in the calculation.

```python
def average(self,number1, number2, number3):
    sum = number1 + number2 + number3
    avg = sum / 3.0

    return avg
```

Variables defined in a method are only visible inside that method. In the example above, this means that the variables `sum` and `avg` defined inside the method `average` are not visible in the main program. A typical mistake while learning programming is to try and use a method in the following way.

```python
def __init__(self):
    first = 3
    second = 8
    third = 4

    average(self, first, second, third)

    # trying to use a method's internal variable, DOES NOT WORK!
    print("The average of the numbers: " + str(avg))
```

In the above example, an attempt is made to use the variable `avg` that has been defined inside the method `average` and print its value. However, the variable `avg` only exists inside the method `average`, and it cannot be accessed outside of it.

The following mistakes are also commonplace.

```python
def __init__(self):
    first = 3
    second = 8
    third = 4

    # trying to use the method name only, DOES NOT WORK!
    print("The average of the numbers: " + average)
```
Above, there is an attempt to use the name of the method `average` as if it were a variable. However, a method has to be called.

As well as placing the method result into a helper variable, another way that works is to execute the method call directly inside the print statement:

```python
def __init__(self):
    first = 3
    second = 8
    third = 4

    # calling the method inside the print statement, DOES WORK!
    print("The average of the numbers: " + str(average(self, first, second, third)))
```

Here, the method call occurs first returning the value 5.0, which is then printed with the help of the print statement.

### Calculating the Return Value Inside a Method

The return value does not need to be entirely pre-defined - it can also be calculated. The return command that returns a value from the method can also be given an expression that is evaluated before the value is returned.

In the following example, we'll define a method sum that adds the values of two variables and returns their sum. The values of the variables to be summed are received as method parameters.

```python
def sum(first, second):
    return first + second
```

When the execution of the method reaches the statement `return first + second `, the expression `first + second` is evaluated, and then its value is returned.

The method is called in the following way. Below, the method is used to add the numbers 2 and 7 together. The value resulting from the method call is placed into the variable `sumOfNumbers`.

```python
sumOfNumbers = sum(2, 7)
# sumOfNumbers is now 9
```

Let's expand the previous example so that the numbers are entered by a user.

```python
def __init__(self):
    first = int(input("Enter the first number: "))

    second = int(input("Enter the second number: "))

    print("The combined sum of the numbers is: " + str(sum(first, second)))

def sum(self,first, second):
    return first + second
```

In the example above, the method's return value is not stored in a variable but is instead directly used as part of the print operation. The print command's execution is done by the computer first evaluating the string `"The combined sum of the numbers is: "+ sum(first, second)`. The computer first looks for the variables `first` and `second` and copies their values as the values ​​of the method `sum`'s parameters. The method then adds the values of the parameters ​​together, after which it returns a value. This value takes the place of the `sum` method call, whereby the sum is appended to the string `"The combined sum of the numbers is: "`.

Since the values passed to a method are copied to its parameters, the names of the parameters and the names of the variables defined on the side of the caller have, in fact, nothing to do with each other. In the previous example, both the variables of the main program and the method parameters were named the same (`first` and `second`) "by accident". The code below will function in precisely the same manner even though the variables are named differently:

```python
def __init__(self):
    number1 = int(input("Enter the first number: "))

    number2 = int(input("Enter the second number: "))

    print("The total sum of the numbers is: " + sum(number1, number2))

def sum(self,first,second):
    return first + second
```

Now the value of the variable `number1` is copied as the value of the method parameter `first`, and the value of the variable `number2` is copied as the value of the parameter `second`.

Positive
: **Exercise - Summation** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-26-summation.git)

Positive
: **Exercise - Smallest** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-27-smallest.git)

Positive
: **Exercise - Greatest** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-28-greatest.git)
<programming-exercise name='Averaging' tmcname='part02-Part02_32.Averaging'>

Positive
: **Exercise - Averaging** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-2-29-averaging.git)

### Execution of Method Calls and the Call Stack

How does the computer remember where to return after the execution of a method?

The environment that executes Python source code keeps track of the method being executed in the call stack. **The call stack** contains frames, each of which includes information about a specific method's internal variables and their values. When a method is called, a new frame containing its variables is created in the call stack. When the execution of a method ends, the frame relating to a method is removed from the call stack, which leads to execution resuming at the previous method of the stack.

When a method is called, the execution of the calling method is left waiting for the execution of the called method to end. This can be visualized with the help of a call stack. The call stack refers to the stack formed by the method calls -- the method currently being executed is always on the top of the stack, and when that method has finished executing the execution moves on to the method that is next on the stack. Let's examine the following program:

```python
def __init__(self):
    print("Hello world!")
    printNumber()
    print("Bye bye world!")

def printNumber(self):
    print("Number")
```

The execution begins from the first line of the  `__init__` method when the program is run. The command on this line prints the text `"Hello world!"`. The call stack of the program looks as follows:

Negative
: \_\_init\_\_

Once the print command has been executed, we move on to the next command, which calls the method `printNumber`. Calling this method moves the execution of the program to the beginning of the method `printNumber`. Meanwhile, the `main` method will await for the execution of the method `printNumber` to end. While inside the method `printNumber`, the call stack looks like this:

Negative
: printNumber <br> \_\_init\_\_

Once the method `printNumber` completes, we return to the method that is immediately below the method `printNumber` in the call stack -- which in this case is the method `main`. `printNumber` is removed from the call stack, and the execution continues from the line after the `printNumber` method call in the `main` method. The state of the call stack is now the following:

Negative
: \_\_init\_\_

### Call Stack and Method Parameters

Let's examine the call stack in a situation where parameters have been defined for the method.

```python
def __init__(self):
    beginning = 1
    end = 5

    printStars(beginning, end)

def printStars(beginning, end):
    while (beginning < end):
        print("*")
        beginning += 1  # same as beginning = beginning + 1
```


The execution of the program begins on the first line of the `main` method. The next two lines create the variables `beginning` and `end`, and also assign values to them. The state of the program prior to calling the method `printStarts`:

Negative
: \_\_init\_\_ <br> * beginning = 1 <br> * end = 5

When `printStars` is called, the `__init__` method enters a waiting state. The method call causes new variables `beginning` and `end` to be created for the method `printStars`, to which the values passed as parameters are assigned to. These values are copied from the variables `beginning` and `end` of the `__init__` method. The state of the program on the first line of the execution of the method `printStars` is illustrated below.

Negative
: printStars <br> * beginning = 1 <br> * end = 5 <br> \_\_init\_\_ <br> * beginning = 1 <br> * end = 5

When the command `beginning+= 1` is executed within the loop, the value of the variable `beginning` that belongs to the method currently being executed changes.

Negative
: printStars <br> * beginning = 2 <br> * end = 5 <br> \_\_init\_\_ <br> * beginning = 1 <br> * end = 5

As such, the values of the variables in the method `__init__` remain unchanged. The execution of the method `printStars` would continue for some time after this. When the execution of that method ends, the execution resumes inside the `__init__` method.

Negative
: \_\_init\_\_ <br> * beginning = 1 <br> * end = 5

### Call Stack and Returning a Value from a Method

Let's now study an example where the method returns a value. The `__init__` method of the program calls a separate `start` method, inside of which two variables are created, the `sum` method is called, and the the value returned by the `sum` method is printed.

```python
def __init__(self):
    start()

def start(self):
    first = 5
    second = 6

    sum = sum(first, second)

    print("Sum: " + str(sum))

def sum(self,number1, number2):
    return number1 + number2
```

At the beginning of the `start` method's execution the call stack looks as in the following illustration since it was called from the `main` method. The method `main` has no variables of its own in this example:

Negative
: start <br> \_\_init\_\_

When the variables `first` and `second` have been created in the `start` method (i.e., the first two rows of that method have been executed), the situation is the following:

Negative
: start <br> * first = 5 <br> * second = 6 <br> \_\_init\_\_

The command `sum = sum(first, second) ` creates the variable `sum` in the method `start` and calls the method `sum`. The method `start` enters a waiting state. Since the parameters `number1` and `number2` are defined in the method `sum`, they are created right at the beginning of the method's execution, after which the values of the variables given as parameters are copied into them.

Negative
: sum <br> * number1 = 5 <br> * number2 = 6 <br> start <br> * first = 5 <br> * second = 6 <br> * sum # no value <br> \_\_init\_\_

The execution of the method `sum` adds together the values of the variables `number1` and `number2`. The command `return` returns the sum of the numbers to the method that is one beneath it in the call stack - the method `start` in this case. The returned value is set as the value of the variable `sum`.

Negative
: start <br> * first = 5 <br> * second = 6 <br> * sum = 11 <br> \_\_init\_\_

After that, the print command is executed, and then we return to the `__init__` method. Once the execution reaches the end of the `__init__` method, the execution of the program ends.

### Method Calling Another Method

As we noticed earlier, other methods can be called from within methods. An additional example of this technique is given below. We'll create the method `multiplicationTable` that prints the multiplication table of the given number. The multiplication table prints the rows with the help of the `printMultiplicationTableRow` method.

```python
def multiplicationTable(max):
    number = 1

    while (number <= max):
        printMultiplicationTableRow(number, max)
        number+= 1

def printMultiplicationTableRow(self, number, coefficient):

    int printable = number
    while (printable <= number * coefficient):
        print("  " + printable)
        printable += number

    print("")
```

The output of the method call `multiplicationTable(3)`, for instance, looks like this.

Negative
: 1  2  3 <br> 2  4  6 <br> 3  6  9

## Summary

Programs grow in size as we add more functionality to them. When the program size increases, so does the complexity. This results in source code that is more difficult to understand. In this part, we took our first steps towards managing program complexity: loop structures can be used to execute program code time and again and custom methods allow for dividing a program into smaller, more manageable parts.
