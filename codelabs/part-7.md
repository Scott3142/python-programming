author: Scott Morgan
summary: In the seventh part of the course we'll focus on general programming paradigms and algorithms.
id: part-7
categories: btec-unit4
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 7

## Programming paradigms
Duration: 01:00:00

### What you'll learn
* You know the concept of a programming paradigm.
* You know what is meant by procedural and object-oriented programming.

A programming paradigm is a way of thinking about and structuring a program's functionality. Programming paradigms differ from one another, for example in how the program's execution and control are defined and what components the programs consist of.

Most programming languages ​​that are currently in use support multiple programming paradigms. Part of a programmer's growth involves the ability, through experience, to choose the appropriate programming language and paradigm  there currently is no single ubiquitous programming language and programming paradigm.

The most common programming paradigms today are object-oriented programming, procedural programming, and functional programming. The first two of these are briefly discussed in what follows.

### Object-Oriented Programming

In object-oriented programming, information is represented as classes that describe the concepts of the problem domain and the logic of the application. Classes define the methods that determine how information is handled. During program execution, classes are instantiated from objects that contain runtime information and that also have an effect on program execution: program execution typically proceeds through a series of method calls related to the objects. As mentioned a few weeks ago, "the program is built from small, clear, and cooperative entities."

The basic ideas of object-oriented programming, i.e., the representation of information and its processing methods with he help of classes and objects, first appeared in [Simula 67](https://en.wikipedia.org/wiki/Simula), which was designed for developing simulations and the [Smalltalk](https://en.wikipedia.org/wiki/Smalltalk) programming language. Its breakthrough came in the 1980s through the [C++](https://en.wikipedia.org/wiki/C%2B%2B) programming language and [Java](https://en.wikipedia.org/wiki/Java_(programming_language) has made it one of the most widely used programming paradigms in the world.

One of the major benefits of object-oriented programming is how problem-domain concepts are modelled through classes and objects, which makes programs easier to understand. In addition, structuring the problem domain into classes facilitates the construction and maintenance of programs. However, object-oriented programming is not inherently suited to all problems: for example, scientific computing and statistics applications typically make use of languages, such as [R](https://en.wikipedia.org/wiki/R_(programming_language)), [Matlab](https://en.wikipedia.org/wiki/MATLAB) or [Fortran](https://en.wikipedia.org/wiki/fortran).

### Procedural programming

Whereas in object-oriented programming, the structure of a program is formed by the data it processes, in procedural programming, the structure of the program is formed by functionality desired for the program: the program acts as a step-by-step guide for the functionality to be performed. The program is executed one step at a time, and subroutines (methods) are called whenever necessary.

In procedural programming, the state of the program is maintained in variables and tables, and any methods handle only the values provided to them as parameters. The program tells the computer what should happen. As an example, the code below demonstrates the swapping of values for two variables a and b

```python
a = 10
b = 15

# let's swap the values of variables a and b
c = b
b = a
a = c
```

When comparing object-oriented programming with procedural programming, a few essential differences emerge. In object-oriented programming, the state of an object can, in principle, change with any object method, and that change of state can also affect the working of the methods of other objects. As a consequence, other aspects of a program's execution may also be affected since objects can be used in multiple places within the program.

The difference between object-oriented programming and procedural programming are shown concretely in the clock example presented at the beginning of Part Five. The solution below depicts a procedural style where the printing of the time is transferred to a method.

```python
hours = 0
minutes = 0
seconds = 0

while True:
    # 1. printing the time
    print_out(hours, minutes, seconds)
    print()

    # 2. advancing the second hand
    seconds = seconds + 1

    # 3. advancing the other hands when necessary
    if (seconds > 59):
        minutes = minutes + 1
        seconds = 0

        if (minutes > 59):
            hours = hours + 1
            minutes = 0

            if (hours > 23):
                hours = 0
```

```python
def print_out(hours,minutes,seconds):
    print(hours)
    print(minutes)
    print(seconds)

def print_out(value):
    if (value < 10):
        print("0")

    print(value)
```

The same implemented in an object-oriented way:


```python
class Hand:
    def __init__(self,upper_bound):
        self.upper_bound = upper_bound
        self.value = 0

    def advance(self):
        self.value = self.value + 1

        if (self.value >= self.upper_bound):
            self.value = 0

    def value(self):
        return self.value

    def __str__(self):
        if (self.value < 10):
            return "0" + str(self.value)

        return "" + str(self.value)
```

```python
class Clock():

    def __init__(self):
        self.hours = Hand(24)
        self.minutes = Hand(60)
        self.hours = Hand(60)

    def advance(self):
        self.seconds.advance()

        if (self.seconds.value() == 0):
            self.minutes.advance()

            if (self.minutes.value() == 0):
                self.hours.advance()

    def __str__(self):
        return str(hours) + ":" + str(minutes) + ":" + str(seconds)
```

```python
clock = Clock()

while True:
    print(clock)
    clock.advance()
```

Positive
: **Exercise - Liquid containers** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-1-liquid-containers.git)

Positive
: **Exercise - Liquid containers 2.0** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-2-liquid-containers-2.git)

## Algorithms
Duration: 01:00:00

### What you'll learn
* You understand the concept of algorithms and you are familiar with a few algorithms
* You can explain how selection sort works
* You can explain how the linear search and binary search algorithms work

Algorithms, precise instructions on how to to accomplish a specific task, are at the core of computer science. In the context of programming, algorithms are typically defined using source code.

The concept of *efficiency* is often associated with algorithms. A programs efficiency, i.e, the computation of required information fast enough, is an integral part of a programs usability. If it took two days for an algorithm designed for forecasting tomorrows weather run, the results wouldn't be very useful! Similarly, a user viewing a TVs program guide won't get any use out of it, if the tv-shows info only loads after the show already ended.

In a more general sense, retrieving and displaying information quickly is an integral part of any applications function. Next let's explore algorithms associated with retrieving and sorting information. While the following examples utilize arrays, the algorithms shown will also work with other data-structures meant for storing information, such as lists.

### Sorting information

If the information (data) giving to a computer, doesn't follow any rules and isn't in order, retrieving that information is taxing for the computer. We need order!

#### Selection sort

Every programmer should be familiar with at least one sorting algorithm (i.e a way to sort an array). Let's familiarize ourselves with one "classic" sorting algorithm, the selection sort. We'll do so with a programing exercise.

Positive
: **Exercise - Sorting** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-3-sorting.git)

###  Build-in sorting algorithms in Python

Python offers a significant amount of ready to use sorting algorithms. Arrays can be sorted (into their natural order) using the class method `sort` of the `List`-class.

```python
numbers = [8, 3, 7, 9, 1, 2, 4]
print(numbers)
numbers.sort()
print(numbers)
```

Negative
: [8, 3, 7, 9, 1, 2, 4] <br> [1, 2, 3, 4, 7, 8, 9]

```python
numbers = []
numbers.append(8)
numbers.append(3)
numbers.append(7)
print(numbers)
numbers.sort(reverse=True) # descending order
print(numbers)
```

Negative
: [8, 3, 7] <br> [8, 7, 3]

Python's build-in sorting algorithms work with value type variables and some of Python's build-in reference type variables, like String. In order for our own classes to be sorted, we need to provide Python with some tips on how to do that, because the classes themselves don't contain information on how objects created from them should be ordered. We'll get back to ordering objects created from classes we made ourselves in the advanced course in programming.

Positive
: **Exercise - Ready made sorting algorithms** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-4-ready-made-sorting-algorithms.git)

### Information retrieval

Next let's take a look at algorithms meant for information retrieval.

#### Linear search

Linear search is a search algorithm that searches for information in array by going through every value in the array one by one. When the value that was searched for is found, its index is immediately returned. If the requested value cannot be found, linear sort return the information that the value was not found -- typically this means returning `-1` instead of a valid index.

```python
def linear_search(array,searched):
        for index in range(len(array)):
            if (array[i] == searched):
                return i

        return -1
```

 In the worst case scenario, i.e when the value searched for isn't found, the algorithm has to do as many comparisons as there are values in the array. In an array containing, say, 10 million values, this means 10 comparisons. If we are doing more than one search, it makes sense to try and improve efficiency.

### Binary search (aka half-interval search or logarithmic search)

When the data searched is in order, searching can be implemented a lot more efficiently than in linear search.
The idea behind Binary Search is to start looking for the searched value in the middle index of the array (or list), compare the value found there to the searched value, and if needed (i.e, when the value isn't found there) eliminate half of the search area.

Positive
: **Exercise - Searching** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-5-searching.git)

## Larger exercises
Duration: 01:00:00

To conclude the seventh part, you'll do a few more extensive exercises. There is no predefined structure for these tasks -- think about the classes and objects that will help you complete the task while you're completing it.

Positive
: **Exercise - Grade statistics** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-6-grade-statistics.git)

Positive
: **Exercise - Recipe search** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-7-recipe-search.git)

Positive
: **Exercise - Big year** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-7-8-big-year.git)

## Conclusion
Duration: 00:10:00

During the first seven parts you've become familiar with the basics of programming and produced many functioning program.

You now know how to use variables, conditionals, loops and methods.

You know that the naming of variables and methods affects the understandability of your programs.

You've also dived deeper into the world of object-oriented programming, and to the wording of your programs through it.

In addition, you've become acquainted with one of the most important tools of a professional developer - the integrated development environment (IDE).

replace-with-summary-form-7
