author: Scott Morgan
summary: The main theme of the fourth part is object-oriented programming. You will learn to read data from files and to represent and handle information with the help of objects.
id: part-4
categories: python-programming
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 4

## Introduction to object-oriented programming
Duration: 01:00:00

### What you'll learn
* You're familiar with the concepts of class, object, constructor, object methods, and object variables.
* You understand that a class defines an object's methods and that the values of instance (object) variables are object-specific.
* You know how to create classes and objects, and know how to use objects in your programs.

We'll now begin our journey in to the world of object-oriented programming. We'll start with focusing on describing concepts and data using objects. From there on, we'll learn how to add functionality, i.e., methods to our program.

Object-oriented programming is concerned with isolating concepts of a problem domain into separate entities and then using those entities to solve problems. Concepts related to a problem can only be considered once they've been identified. In other words, we can form abstractions from problems that make those problem easier to approach.

Once concepts related to a given problem have been identified, we can also begin to build constructs that represent them them into programs. These constructs, and the individual instances that are formed from them, i.e., objects, are used in solving the problem. The statement "programs are built from small, clear, and cooperative objects" may not make much sense yet. However, it will appear more sensible as we progress through the course, perhaps even self-evident.

### Classes and Objects

We've already used some of the classes and objects provided by Python. A **class** defines the attributes of objects, i.e., the information related to them (instance variables), and their commands, i.e., their methods. The values of instance (i.e., object) variables define the internal state of an individual object, whereas methods define the functionality it offers.

A **method** is a piece of source code written inside a class that's been named and has the ability to be called. A method is always part of some class and is often used to modify the internal state of an object instantiated from a class.

An object is always instantiated by calling a method that created an object.

Positive
: **The Relationship Between a Class and an Object** <br><br> A class lays out a blueprint for any objects that are instantiated from it. Let's draw from an analogy from outside the world of computers. Detached houses are most likely familiar to most, and we can safely assume the existence of drawings somewhere that determine what exactly a detached house is to be like. A class is a blueprint. In other words, it specifies what kinds of objects can be instantiated from it. <br><br> Individual objects, detached houses in this case, are all created based on the same blueprints - they're instances of the same class. The states of individual objects, i.e., their attributes (such as the wall color, the building material of the roof, the color of its foundations, the doors' materials and color, ...) may all vary, however.

Positive
: **Exercise - Your first account** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-1-your-first-account.git)

Positive
: **Exercise - Your first bank transfer** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-2-your-first-bank-transfer.git)

### Creating Classes

A class specifies what the objects instantiated from it are like.

- The **object's variables (instance variables)** specify the internal state of the object
- The **object's methods** specify what the object does

We'll now familiarize ourselves with creating our own classes and defining the variable that belong to them.

A class is defined to represent some meaningful entity, where a "meaningful entity" often refers to a real-world object or concept. If a computer program had to process personal information, it would perhaps be meaningful to define a separate class `Person` consisting of methods and attributes related to an individual.

Let's begin. We'll assume that we have a project template that has an empty main program:

```python
def main():
    # some code
```

We will assume that this main program is located in a file called `main.py`. Let's create a class named `Person`. For this class, we create a separate file named `person.py`. Our program now consists of two separate files since the main program is also in its own file. The `person.py` file initially contains the class definition **class Person** and the block that confines the contents of the class.

```python
class Person:

```
We call this file a **module**, which should follow the [PEP 8 styling guidelines](https://www.python.org/dev/peps/pep-0008/#package-and-module-names) on naming. Similarly to variables, methods and functions, module names should be snake_case, but as short as possible.

A class defines the attributes and behaviours of objects that are created from it. Let's decide that each person object has a name and an age. It's natural to represent the name as a string, and the age as an integer. We'll go ahead and add these to our blueprint:

```python
class Person:
    name = ""
    age = 0
```

We specify above that each object created from the `Person` class has a `name` and an `age`. Variables defined inside a class are called **instance variables**, or object fields or object attributes. Other names also seem to exist.

Instance variables are written on the lines following the class definition `class Person:`. Many programming languages such as Java have a concept of **encapsulation**, which allows **private** variables to be "hidden" inside the object. In Python, there is no existence of “private” instance variables so we do not discuss them further here. For the vast majority of the forthcoming examples, we will not define instance variables either, and will only declare variables inside the *constructor* method which we discuss below.

We have now defined a blueprint -- a class -- for the person object. Each new person object has the variables `name` and `age`, which are able to hold object-specific values. The "state" of a person consists of the values assigned to their name and age.

To access the `Person` class in the `main.py` program, we will need to import it. Let's see how this works below with an example and review the file and folder structure. We should have a folder structure as follows:

```
+-- project_folder
|   +-- main.py
|   +-- person.py
```

where each the contents of the file are as follows:

#### person.py
```python
class Person:
    name = ""
    age = 0
```

#### main.py
```python
from person import Person

def main():
    # some code here
```

The import statement at the top of the `main.py` file functions like so: `from module import method`. While these statements may be missing from subsequent code snippets throughout this course, you must always assume that the folder structures are appropriate for the import statements

Positive
: **Naming modules** <br><br> The filenames are important in Python and you shouldn't use a filename that is the same as a common Python command like `print`. If you call a module `print.py` and import it, you will override the built-in `print()` method and your program will not function as expected.

Positive
: **Exercise - Dog attributes** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-3-dog-attributes.git)

### Defining a Constructor

We want to set an initial state for an object that's created. It'd be convenient to pass values ​​to the variables of that object as it's being created. For example, when creating a new person object, it's useful to be able to provide it with a name:

```python
def main():
    ada = Person("Ada")
    # ...
```

This is achieved by defining the method that creates the object, i.e., its constructor. The constructor is defined after the instance variables. In the following example, a constructor is defined for the Person class, which can be used to create a new Person object. The constructor sets the age of the object being created to 0, and the string passed to the constructor as a parameter as its name:

```python
class Person:
    def __init__(self,initial_name):
        self.age = 0
        self.name = initial_name
```

The constructor is provided, as a parameter, to the name of the person object to be created. The parameter is enclosed in parentheses and follows the constructor's name. The parentheses that contain optional parameters are followed by curly brackets. In between these brackets is the source code that the program executes when the constructor is called (e.g., `Person ("Ada")`).

Objects are always created using a constructor.

A few things to note: the constructor contains the expression `self.age = 0`. This expression sets the instance variable `age` of the newly created object (i.e., "self" object's age) to 0. The second expression `self.name = initial_name` likewise assigns the string passed as a parameter to the instance variable `name` of the object created.

Positive
: **Exercise - Room** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-4-room.git)

Positive
: **Default Constructor** <br><br> If the programmer does not define a constructor for a class, Python automatically creates a default one for it. <br><br> A default constructor is a constructor that doesn't do anything apart from creating the object. <br><br> The object's variables remain uninitialized (generally, the value of any object references will be `None`, meaning that they do not point to anything).

### Defining Methods For an Object

We know how to create an object and initialize its variables. However, an object also needs methods to be able to do anything. As we've learned, a **method** is a named section of source code inside a class which can be invoked.

```python
class Person:
    def __init__(self,initial_name):
        self.age = 0
        self.name = initial_name

    def print_person(self):
        print(self.name + ", age " + str(self.age) + " years")
```

A method is written inside of the class beneath the constructor. The method name is preceded by `def`, just like a function. The only difference between a function and a method is that a method is tied to an object, as we've seen.

The method `print_person` contains one line of code that makes use of the instance variables `name` and `age`. Instance variables are referred to with the prefix `self`. All of the object's variables are visible and available from within the method.

Let's create three persons in the main program and request them to print themselves:

```python
from person import Person

def main():
    ada = Person("Ada")
    alan = Person("Alan")
    grace = Person("Grace")

    ada.print_person()
    alan.print_person()
    grace.print_person()

if __name__ == '__main__':
    main()
```

Prints:

Negative
: Ada, age 0 years <br> Alan, age 0 years <br> Grace, age 0 years

Positive
: **Exercise - Whistle** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-5-whistle.git)

Positive
: **Exercise - Door** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-6-door.git)

Positive
: **Exercise - Product** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-7-product.git)

### Changing an Instance Variable's Value in a Method

Let's add a method to the previously created person class that increments the age of the person by a year.

```python
class Person:
    def __init__(self,initial_name):
        self.age = 0
        self.name = initial_name

    def print_person(self):
        print(self.name + ", age " + str(self.age) + " years")

    def grow_older(self):
        self.age = self.age + 1
```

The method is written inside the `Person` class just as the `print_person` method was. The method increments the value of the instance variable `age` by one.

Let's call the method and see what happens:

```python
from person import Person

def main():
    ada = Person("Ada")
    alan = Person("Alan")
    grace = Person("Grace")

    ada.print_person()
    alan.print_person()
    grace.print_person()

    ada.grow_older()
    alan.grow_older()

    ada.print_person()
    alan.print_person()

if __name__ == '__main__':
    main()
```

Prints:

Negative
:  Ada, age 0 years <br> Alan, age 0 years <br> Grace, age 0 years <br> Ada, age 1 years <br> Alan, age 1 years <br>

That is to say that when the two objects are "born" they're both zero-years old (`self.age = 0 ` is executed in the constructor). The `ada` object's `grow_older` method is called twice. As the print output demonstrates, the age of Ada is 2 years after growing older. Calling the method on an object corresponding to Ada has no impact on the age of the other person object since each object instantiated form a class has its own instance variables.

The method can also contain conditional statements and loops. The grow_older method below limits aging to 30 years.

```python
class Person:
    def __init__(self,initial_name):
        self.age = 0
        self.name = initial_name

    def print_person(self):
        print(self.name + ", age " + str(self.age) + " years")

    def grow_older(self):
        if (self.age < 30):
            self.age = self.age + 1
```

Positive
: **Exercise - Decreasing Counter** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-8-decreasing-counter.git)

Positive
: **Exercise - Debt** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-9-debt.git)

### Returning a Value From a Method

A method can return a value. The methods we've created in our objects haven't so far returned anything. This has been marked by the lac of a `return` statement in the method body.

```python
class Door:
    def knock(self):
        # ...
        return #something
```

If we want the method to return a value, we need to insert a `return` keyword. In the following example, the Teacher class has a  method `grade` that always returns a variable (in this case, the value 10):

```python
class Teacher:
    def grade(self):
        return 10
```

The method above returns a variable of value 10 when called. For the return value to be used, it needs to be assigned. This happens the same way as regular variable assignment, i.e., by using the equals sign:

```python
from teacher import Teacher

def main():
    teacher = Teacher()

    grading = teacher.grade()

    print("The grade received is " + str(grading))
```

Negative
: The grade received is 10

The return value could also be used to form part of an expression.


```python
from teacher import Teacher

def main():
    first = Teacher()
    second = Teacher()
    third = Teacher()

    average = (first.grade() + second.grade() + third.grade()) / 3.0

    print("Grading average " + str(average))
```

Negative
: Grading average 10.0

Let's continue with the Person class and add a `return_age` method that returns the person's age.

```python
class Person:
    def __init__(self,initial_name):
        self.age = 0
        self.name = initial_name

    def print_person(self):
        print(self.name + ", age " + str(self.age) + " years")

    def grow_older(self):
        self.age = self.age + 1

    # the added method
    def return_age(self):
        return self.age
```

Let's illustrate how the method works:

```python
from person import Person

def main():
    grace = Person("Grace")
    alan = Person("Alan")

    grace.grow_older()
    grace.grow_older()

    alan.grow_older()

    print("Grace's age: " + str(grace.return_age()))
    print("Alan's age: " + str(alan.return_age()))
    combined = grace.return_age() + alan.return_age()

    print("Grace's and Alan's combined age: " + str(combined) + " years")
```

Negative
: Grace's age: 2 <br> Alan's age: 1 <br><br> Grace's and Alan's combined age: 3 years

Positive
: **Exercise - Song** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-10-song.git)

Positive
: **Exercise - Film** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-11-film.git)

As we came to notice, methods can contain source code in the same way as other parts of our program. Methods can have conditionals or loops, and other methods can also be called from them.

Let's now write a method for the person that determines if the person is of legal age. The method returns a boolean - either `True` or `False`:

```python
class Person:

    def is_of_legal_age(self):
        if (self.age < 18):
            return False

        return True

    # The method could have been written more succintly in the following way:
    #
    # def is_of_legal_age():
    #    return self.age >= 18
```

And let's test it out:

```python
from person import Person

def main():
    grace = Person("Grace")
    alan = Person("Alan")

    i = 0
    while (i < 30):
        grace.grow_older()
        i = i + 1

    alan.grow_older()

    if (alan.is_of_legal_age()):
        print("of legal age: ")
        alan.print_person()
    else:
        print("underage: ")
        alan.print_person()

    if (grace.is_of_legal_age()):
        print("of legal age: ")
        grace.print_person()
    else:
        print("underage: ")
        grace.print_person()
```
Negative
: underage: <br> Alan, age 1 years <br> of legal age: <br> Grace, age 30 years

Let's fine-tune the solution a bit more. In its current form, a person can only be "printed" in a way that includes both the name and the age. Situations exist, however, where we may only want to know the name of an object. Let's write a separate method for this use case:

```python
class Person:
    # ...

    def get_name(self):
        return self.name
```

The `get_name` method returns the instance variable `name` to the caller. The name of this method is somewhat strange. It is the usual convention to name a method that returns an instance variable exactly this way, i.e., `getVariableName`. Such methods are often referred to as "getters".

Let's mould the main program to use the new "getter" method:

```python
from person import Person

def main():
    grace = Person("Grace")
    alan = Person("Alan")

    i = 0
    while (i < 30):
        grace.grow_older()
        i = i + 1

    alan.grow_older()

    if (alan.is_of_legal_age()):
         print(alan.get_name() + " is of legal age")
    else:
         print(alan.get_name() + " is underage")

    if (grace.is_of_legal_age()):
         print(grace.get_name() + " is of legal age")
    else:
         print(grace.get_name() + " is underage ")
```

The print output is starting to turn out quit neat:

Negative
: Alan is underage <br> Grace is of legal age

Positive
: **Exercise - Gauge** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-12-gauge.git)

### A string representation of an object and the __str__-method

We are guilty of programming in a somewhat poor style by creating a method for printing the object, i.e., the `print_person` method. A preferred way is to define a method for the object that returns a "string representation" of the object. We can call the method returning the string representation `__str__`. Let's define this method for the person in the following example:

The `__str__` functions as `print_person` does. However, it doesn't itself print anything but instead returns a string representation, which the calling method can execute for printing as needed.

The method is used in a somewhat surprising way:

```python
class Person:
    # ...

    def __str__(self):
        return self.name + ", age " + str(self.age) + " years"
```

```python
def main():
    grace = Person("Grace")
    alan = Person("Alan")

    i = 0
    while (i < 30):
        grace.grow_older()
        i = i + 1

    alan.grow_older()

    print(grace)
    print(alan)
```

In principle, the `print` method requests the object's string representation and prints it. The call to the `__str__` method returning the string representation does not have to be written explicitly, as Python adds it automatically.

Positive
: **Exercise - Agent** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-13-agent.git)

### Method parameters

Let's continue with the `Person` class once more. We've decided that we want to calculate people's body mass indexes. To do this, we write methods for the person to set both the height and the weight, and also a method to calculate the body mass index. The new and changed parts of the Person object are as follows:

```python
class Person:

    def __init__(self,initial_name):
        self.age = 0
        self.weight = 0
        self.height = 0
        self.name = initial_name

    def set_height(self,new_height):
        self.height = new_height

    def set_weight(self,new_weight):
        self.weight = new_weight

    def body_mass_index(self):
        height_per_hundred = self.height / 100.0
        return self.weight / (height_per_hundred * height_per_hundred)

    # ...
```

The instance variables `height` and `weight` were added to the person. Values for these can be set using the `set_height` and `set_weight` methods. Java's standard naming convention is used once again, that is, if the method's only purpose is to set a value to an instance variable, then it's named as `set_variable_name`. Value-setting methods are often called "setters". The new methods are put to use in the following case:

```python
from person import Person

def main():
    grace = Person("Grace")
    ada = Person("Ada")

    grace.set_height(180)
    grace.set_weight(86)

    ada.set_height(175)
    ada.set_weight(64)

    print(grace.get_name() + ", body mass index is " + str(grace.body_mass_index()))
    print(ada.get_name() + ", body mass index is " + str(ada.body_mass_index()))
```

Prints:

Negative
: Grace, body mass index is 26.54320987654321 <br> Ada, body mass index is 20.897959183673468

### A parameter and instance variable having the same name

In the preceding example, the `set_height` method sets the value of the parameter `new_height` to the instance variable `height`:

```python
def set_height(self,new_height):
    self.height = new_height
```

The parameter's name could also be the same as the instance variable's, so the following would also work:

```python
def set_height(self,height):
    self.height = height
```

In this case, `height` in the method refers specifically to a parameter named _height_ and `self.height` to an instance variable of the same name. For example, the following example would not work as the code does not refer to the instance variable _height_ at all. What the code does in effect is set the `height` variable received as a parameter to the value it already contains:

```python
def set_height(self,height):
    # DON'T DO THIS!!!
    height = height
```

```python
def set_height(self,height):
    # DO THIS INSTEAD!!!
    self.height = height
```

Positive
: **Exercise - Multiplier** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-14-mutiplier.git)

### Calling an internal method

The object may also call its methods. For example, if we wanted the string representation returned by __str__ to also tell of a person's body mass index, the object's own `body_mass_index` method should be called in the `__str__` method:

```python
def __str__(self):
    return self.name + ", age " + str(self.age) + " years, my body mass index is " + str(self.body_mass_index())
```

So, when an object calls an internal method, the name of the method and this prefix suffice.

Positive
: **Exercise - Statistics** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-15-statistics.git)

Positive
: **Exercise - Payment Card** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-16-payment-card.git)

Positive
: **Rounding errors** <br><br> You probably noticed that some of the figures have rounding errors. In the previous exercise, for example, Grace's balance of 30.7 may be printed as `30.700000000000003`. This is because floating-point numbers, such as `float`, are actually stored in binary form. That is, in zeros and ones using only a limited number of numbers. <br><br> As the number of floating-point numbers is infinite -- (in case you're wondering "how infinite?", think how many floating-point or decimal values fit between the numbers 5 and 6 for instance). All of the floating-point numbers simply cannot be represented by a finite number of zeros and ones. Thus, the computer must place a limit on the accuracy of stored numbers. <br><br> Normally, account balances, for instance, are saved as integers such that, say, the value 1 represents one penny.

## Objects in a list
Duration: 01:00:00

### What you'll learn
* You can add objects to a list
* You can go through objects in a list

In the example below we first add strings to a list, after which the strings in the list are printed one by one.

```python
# initialise list
names = []

# string can first be stored in a variable
name = "Betty Jennings"
# then add it to the list
names.append(name)

# strings can also be directly added to the list:
names.append("Betty Snyder")
names.append("Frances Spence")
names.append("Kay McNulty")
names.append("Marlyn Wescoff")
names.append("Ruth Lichterman")

# several different repeat statements can be
# used to go through the list elements

# 1. while loop
index = 0
while (index < len(names)):
    print(names[index])
    index = index + 1

print()

# 2. for loop with index
for i in range(len(names)):
    print(names[i])

print()

# 3. for each loop (no index)
for name in names:
    print(name)
```

Negative
: Betty Jennings <br> Betty Snyder <br> Frances Spence <br> Kay McNulty <br> Marlyn Wescoff <br> Ruth Lichterman <br><br> Betty Jennings <br> Betty Snyder <br> Frances Spence <br> Kay McNulty <br> Marlyn Wescoff <br> Ruth Lichterman <br><br> Betty Jennings <br> Betty Snyder <br> Frances Spence <br> Kay McNulty <br> Marlyn Wescoff <br> Ruth Lichterman

### Adding object to a list

Strings are objects, so it should come as no surprise that other kinds of objects can also be found in lists. Next, let's examine the cooperation of lists and objects in more detail.

Let's assume we have access to the class defined below, describing a person.


```python
class Person:
    def __init__(self,name):
        self.age = 0
        self.name = name
        self.weight = 0
        self.height = 0

    def get_name(self):
        return self.name

    def get_age(self):
        return self.age

    def grow_older(self):
        self.age = self.age + 1

    def is_of_legal_age(self):
        if (self.age < 18):
            return False

        return True

    def set_height(self,new_height):
        self.height = new_height

    def set_weight(self,new_weight):
        self.weight = new_weight

    def body_mass_index(self):
        height_per_hundred = self.height / 100.0
        return self.weight / (height_per_hundred * height_per_hundred)

    def __str__(self):
        return self.name + ", age " + str(self.age) + " years"

```

Handling objects in a list is not really different in any way from the previous experience we have with lists. The essential difference is only to define the type for the stored elements when you create the list.

In the example below we first create a list meant for storing Person type object, after which we add persons to it. Finally the person objects are printed one by one.

```python
# ... imports and function definitions

persons = []

# a person object can be created first
john = Person("John")

# and then added to the list
persons.append(john)

# person objects can also be created "in the same sentence" that they are added to the list
persons.append(Person("Matthew"))
persons.append(Person("Martin"))

for person in persons:
    print(person)
```

Negative
: John, age 0 years <br> Matthew, age 0 years <br> Martin, age 0 years

### Adding user-inputted objects to a list

The structure we used earlier for reading inputs is still very useful.

```python
# ... imports and function definitions

persons = []

# Read the names of persons from the user
while True:
    name = input("Enter a name, empty will stop: ")
    if not name: # nice way of checking if a list is empty
        break

    # Add to the list a new person
    # whose name is the previous user input
    persons.append(Person(name))

# Print the number of the entered persons, and their individual information
print()
print("Persons in total: " + str(len(persons)))
print("Persons: ")

for person in persons:
    print(person)
```

Negative
: Enter a name, empty will stop: <br> *User: \<Ada\>* <br> Enter a name, empty will stop: *User: \<Grace\>* <br> Enter a name, empty will stop: *User: \<Katherine\>* <br><br> Persons in total: 3 <br> Persons: <br> Ada, age 0 years <br> Grace, age 0 years <br> Katherine, age 0 years

Positive
: **Exercise - Items** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-17-items.git)

### Multiple constructor parameters

If the constructor demands more than one parameter, you can query the user for more information. Let's assume we have the following constructor for the class `Person`.

```python
class Person:
    def __init__(self,name,age):
        self.age = age
        self.name = name
        self.weight = 0
        self.height = 0

    # ...
```

In this case, an object is created by calling the two-parameter constructor.

If we want to query the user for this kind of object, they must be asked for each parameter separately. In the example below, name and age parameters are asked separately from the user. Entering an empty name will end the reading part.

The persons are printed after they have been read.

```python
# ... imports and function definitions

persons = []

# Read person information from the user
while True:
    name = input("Enter name, empty will end: ")
    if not name:
        break

    print("Enter the age of the person " + name + ": ")

    age = int(input("Enter the age of the person " + name + ": "))

    # We add a new person to the list.
    # The person's name and age were decided by the user
    persons.append(Person(name, age))

# We'll print the number of the inputted persons, and the persons themselves
print()
print("Total number of persons: " + str(len(persons)))
print("Persons: ")

for person in persons:
    print(person)
```

Negative
: Enter name, empty will end: <br> *User: \<Grace Hopper\>* <br> Enter the age of the person Grace Hopper: <br> *User: \<85\>* <br> Enter name, empty will end: <br><br> Total number of persons: 1 <br> Persons: <br> Grace Hopper, age 85 years

Positive
: **Exercise - Personal Information** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-18-personal-information.git)

### Reading input in a specific format

In the example and exercise below, the required information was entered line by line. By no means is it impossible to ask for input in a specific format, e.g. separated by a comma.

If the name and age were separated by a comma, the program could work in the following manner.

```python
# ... imports and function definitions

persons = []

# Read person information from the user
print("Enter the person details separated by a comma, e.g.: Randall,2")
while True:
    details = input("Enter the details, empty will stop: ")
    if not details:
        break

    parts = details.split(",")
    name = parts[0]
    age = int(parts[1])
    persons.append(Person(name, age))

# Print the number of the entered persons, and the persons themselves
print()
print("Total number of persons: " + str(len(persons)))
print("Persons: ")

for person in persons:
    print(person)
```

### Filtered printing from the list

You can also examine the objects on the list as you go through it. In the example below, we first ask the user for an age restriction, after which we print all the objects whose age is at least the number given by the user.

```python
# Assume we have a 'persons' list
# that consists of person objects

age_limit = int(input("What is the age limit? "))

for person in persons:
    if (person.get_age() >= age_limit):
        print(person)
```

Positive
: **Exercise - Television Programs** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-19-television-programs.git)

Positive
: **Exercise - Books** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-20-books.git)

## Files and reading data
Duration: 01:00:00

### What you'll learn
* You'll review reading keyboard input.
* You know what a file and a filesystem are, and are able to add an empty text file into the filesystem.
* You know how to create a write a program that reads data from a file.

A considerable amount of software is in one way or another based on handling data. Software created for playing music handles music files and those created for the purpose of image manipulation handle image files. Applications that run on the internet and mobile devices, such as Facebook, WhatsApp, and Telegram, handle user information that is stored in file-based databases. What these all have in common is that they read and manipulate data in one way or another. Also, the data being handled is ultimately stored in some format in one or more files.

### Reading From the Keyboard

We've been using the `input`-method since the beginning of this course to read user input. The block in which data is read has been a while-true loop where the reading ends at a specific input.

```python
while True:
    line = input()

    if (line == "end"):
        break

    # add the read line to a list for later
    # handling or handle the line immediately
```

In text-based user interfaces, the input of the user is directed into the input stream one line at a time, which means that the information is sent to be handled every time the user enters a new line.

Positive
: **Exercise - Number of strings** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-21-number-of-strings.git)

The user input is read in string form. If we wanted to handle the input as integers, for instance, we'd have to convert it to another form. An example program has been provided below - it reads input from the user until the user inputs "end". As long as the user input is not "end" the inputs are handled as integers -- in this case, the number is simply printed.

```python
while True:
    row = input()

    if (row == "end"):
        break

    number = int(row)
    print(row)
```

Positive
: **Exercise - Cubes** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-22-cubes.git)

### Files and the Filesystem

**Files** are collections of data that live in computers. These files can contain, among other things, text, images, music, or any combination of these. The file format determines the content of the file as well as the program required to read the file. For example, PDF files are read with a program suited for reading PDF files, and music files are read with a program suited for reading music files. Each of these programs is made by humans, and the creators of these programs -- i.e., programmers -- also specify the file format as part of the work.

Computers have several different programs for browsing files. These programs are specific to the operating system. All programs used for browsing files make use of the filesystem of the computer in one way or another.

Positive
: **The Concrete File Storage Format** <br><br> Files exist on the hard drive of a computer, which is, in reality, a large set of ones and zeros, i.e., bits. Information is made up of these bits, e.g., one variable of type int takes up 32 bits (i.e., 32 ones or zeros). Modern terabyte-sized hard drives hold about 8 trillion bits (written out the number is 8,000,000,000,000). On this scale, a single integer is very small. <br><br> Files can exist practically anywhere on a hard drive, even separated into multiple pieces. The computer's **filesystem** has the responsibility of keeping track of the locations of files on the hard drive as well as providing the ability to create new files and modify them. The filesystem's main responsibility is abstracting the true structure of the hard drive  a user or a program using a file doesn't need to care about the about how, or where, the file is actually stored.

### Reading From a File

**Reading a file** is done using the `open()` method. When we want to read a file, we give the path for the file we want to read as a parameter to the method call. The path to the file is a concept that will become clearer as the course progresses.

Once we have invoked `open()`, the file can be read using a `read()` method. The reading proceeds until all the lines of the file have been read, i.e., until the read command find no more lines to read. Reading a file may result in an error, and for this reason, many programming languages require separate blocks - one for the `try`, and another, called `except` in Python, to catch potential errors.

```python
try:
    # open the file
    f = open("file.txt","r")

    # we read the file until all lines have been read
    print(f.read())

except:
    print("Something went wrong opening the file")

finally:
    f.close()
```

The final line closes the open file, which flushes any unwritten information and closes the file object, after which no more writing can be done. Python automatically closes a file when the reference object of a file is reassigned to another file but it is a good practice to always use the `close()` method to close a file.

In Python, we can simplify this code down to the use of a single `with` statement as follows:

```python
with open("file.txt",'r') as f:
    data = f.read().splitlines()
    # do something with data
```

This takes care of closing the file too, so there's no need to use a `close()` statement together with a `with` statement. The `splitlines()` method splits the file by **new lines** by default.

A file is read from the project root by default, i.e., the folder that contains the python file you are working from.

Positive
: **Read and write** <br><br> Note that we have a second parameter `r` passed to the `open()` method, which tells Python that we want to **read** the file. <br><br> If we wanted to write data to the file, we can pass `w` instead. It is important to make this distinction, to avoid accidentally overwriting files that you want to keep. If you overwrite something in Python in this way, there's no getting it back!

Positive
: **Exercise - Printing from a file** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-23-printing-from-a-file.git)

In the example below, we read all the lines of the file "file.txt", which are then added to a list. This implementation uses the Python `with` keyword.

```python
with open('demofile.txt','r') as f:
      lines = f.read().splitlines()

# we print the total number of lines
print("Total lines: " + str(len(lines)))
```

Positive
: **Exercise - Guest list from a file** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-24-guest-list-from-a-file.git)

Positive
: **Exercise - Is it in the file?** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-25-is-it-in-the-file.git)

Positive
: **Exercise - Numbers from a file?** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-26-numbers-from-a-file.git)

### Reading Data of a Specific Format From a File

The world is full of data that are related to other data -- these form collections. For example, personal information can include a name, date of birth and a phone number. Address information, on the other hand, can include a country, city, street address, postal number and so on.

Data is often stored in files using a specific format. One such format that's already familiar to us is comma-separated values (CSV) format, i.e., data separated by commas. Python has a special library for reading csv files, which can be *imported* using the `import` statement as follows.

```python
import csv

with open("data.csv") as f:
    reader = csv.reader(f,delimiter=',')

    for row in reader:
        print(row)
```

In the example above, each row becomes a Python list in its own right, and can be operated on accordingly. For example, with example data

Negative
: Marie Curie, 26 <br> Rosalind Franklin, 32 <br> Mary Anning, 45

we could read the names only like so:

```python
import csv

with open("data.csv") as f:
    reader = csv.reader(f,delimiter=',')

    for row in reader:
        print(row[0])
```

which prints

Negative
: Marie Curie <br> Rosalind Franklin <br> Mary Anning

Positive
: **Exercise - Records from a File** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-27-records-from-a-file.git)

### Reading Objects From a File

Creating objects from data that is read from a file is straightforward. Let's assume that we have a class called `Person` which looks like

```python
class Person:
    def __init__(self,name,age):
        self.age = age
        self.name = name

    # other methods ...
```

as well as the data from before.

Reading objects can be done like so:

```python
import csv
from person import Person

people = []
with open("records.csv") as f:
    reader = csv.reader(f,delimiter=',')

    for row in reader:
        people.append(Person(row[0],row[1]))

print("Total amount of people read: " + str(len(people)))
```

and the output would be:

Negative
: Total amount of people read: 3

Reading objects from a file is a clear responsibility in and of itself, and should for that reason be isolated into a method. This is what we'll be doing in the next exercise.

Positive
: **Exercise - Storing Records** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-28-storing-records.git)


Positive
: **Exercise - Sport Statistics** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-4-29-sporting-statistics.git)

## Summary
Duration: 00:10:00

In the fourth part of the course we learned to read data from files, and took our first steps towards object-oriented programming. We learned classes and objects to suit our programming needs. We defined constructors, methods, and object variables for the classes, and grew used to printing object-related information with their `__str__` method. We also practised handling objects on a list.

replace-with-summary-form-4
