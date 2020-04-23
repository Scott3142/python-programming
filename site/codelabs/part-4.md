author: Scott Morgan
summary: The main theme of the fourth part is object-oriented programming. You will learn to read data from files and to represent and handle information with the help of objects.
id: part-4
categories: btec-unit4
environments: Web
status: Draft
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 4

## Introduction to object-oriented programming

### What you'll learn
* You're familiar with the concepts of class, object, constructor, object methods, and object variables.
* You understand that a class defines an object's methods and that the values of instance (object) variables are object-specific.
* You know how to create classes and objects, and know how to use objects in your programs.

We'll now begin our journey in to the world of object-oriented programming. We'll start with focusing on describing concepts and data using objects. From there on, we'll learn how to add functionality, i.e., methods to our program.

Object-oriented programming is concerned with isolating concepts of a problem domain into separate entities and then using those entities to solve problems. Concepts related to a problem can only be considered once they've been identified. In other words, we can form abstractions from problems that make those problem easier to approach.

Once concepts related to a given problem have been identified, we can also begin to build constructs that represent them them into programs. These constructs, and the individual instances that are formed from them, i.e., objects, are used in solving the problem. The statement "programs are built from small, clear, and cooperative objects" may not make much sense yet. However, it will appear more sensible as we progress through the course, perhaps even self-evident.

## Classes and Objects

We've already used some of the classes and objects provided by Python. A **class** defines the attributes of objects, i.e., the information related to them (instance variables), and their commands, i.e., their methods. The values of instance (i.e., object) variables define the internal state of an individual object, whereas methods define the functionality it offers.

A **Method** is a piece of source code written inside a class that's been named and has the ability to be called. A method is always part of some class and is often used to modify the internal state of an object instantiated from a class.

An object is always instantiated by calling a method that created an object.

Positive
: **The Relationship Between a Class and an Object** <br>>br> A class lays out a blueprint for any objects that are instantiated from it. Let's draw from an analogy from outside the world of computers. Detached houses are most likely familiar to most, and we can safely assume the existence of drawings somewhere that determine what exactly a detached house is to be like. A class is a blueprint. In other words, it specifies what kinds of objects can be instantiated from it. <br><br> Individual objects, detached houses in this case, are all created based on the same blueprints - they're instances of the same class. The states of individual objects, i.e., their attributes (such as the wall color, the building material of the roof, the color of its foundations, the doors' materials and color, ...) may all vary, however.

Positive
: **Exercise - Your first account** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-1-your-first-account.git)

Positive
: **Exercise - Your first bank transfer** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-2-your-first-bank-transfer.git)

### Creating Classes

A class specifies what the objects instantiated from it are like.

- The **object's variables (instance variables)** specify the internal state of the object
- The **object's methods** specify what the object does

We'll now familiarize ourselves with creating our own classes and defining the variable that belong to them.

A class is defined to represent some meaningful entity, where a "meaningful entity" often refers to a real-world object or concept. If a computer program had to process personal information, it would perhaps be meaningful to define a separate class `Person` consisting of methods and attributes related to an individual.

Let's begin. We'll assume that we have a project template that has an empty main program:

```python
class Main:

    def __init__(self):
        # some code
```

Let's create a class named `Person`. For this class, we create a separate file named `Person.py`. Our program now consists of two separate files since the main program is also in its own file. The `Person.py` file initially contains the class definition **class Person** and the block that confines the contents of the class.

```python
class Person:

```
A class defines the attributes and behaviours of objects that are created from it. Let's decide that each person object has a name and an age. It's natural to represent the name as a string, and the age as an integer. We'll go ahead and add these to our blueprint:

```python
class Person:
    name = ""
    age = 0
```

We specify above that each object created from the `Person` class has a `name` and an `age`. Variables defined inside a class are called **instance variables**, or object fields or object attributes. Other names also seem to exist.

Instance variables are written on the lines following the class definition `class Person:`. Many programming languages such as Java has a concept of **encapsulation**, which allows **private** variables to be "hidden" inside the object. In Python, there is no existence of “Private” instance variables so we do not discuss them further here.

We have now defined a blueprint -- a class -- for the person object. Each new person object has the variables `name` and `age`, which are able to hold object-specific values. The "state" of a person consists of the values assigned to their name and age.

Positive
: **Exercise - Dog attributes** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-3-dog-attributes.git)

### Defining a Constructor

We want to set an initial state for an object that's created. It'd be convenient to pass values ​​to the variables of that object as it's being created. For example, when creating a new person object, it's useful to be able to provide it with a name:

```python
def main(Person):
    ada = Person("Ada")
    # ...
```

This is achieved by defining the method that creates the object, i.e., its constructor. The constructor is defined after the instance variables. In the following example, a constructor is defined for the Person class, which can be used to create a new Person object. The constructor sets the age of the object being created to 0, and the string passed to the constructor as a parameter as its name:

```python
class Person:
    name = ""
    age = 0

    def __init__(self,initialName):
        self.age = 0
        self.name = initialName
```

The constructor is provided, as a parameter, to the name of the person object to be created. The parameter is enclosed in parentheses and follows the constructor's name. The parentheses that contain optional parameters are followed by curly brackets. In between these brackets is the source code that the program executes when the constructor is called (e.g., `Person ("Ada")`).

Objects are always created using a constructor.

A few things to note: the constructor contains the expression `self.age = 0`. This expression sets the instance variable `age` of the newly created object (i.e., "self" object's age) to 0. The second expression `self.name = initialName` likewise assigns the string passed as a parameter to the instance variable `name` of the object created.

Positive
: **Exercise - Room** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-4-room.git)

Positive
: **Default Constructor** <br><br> If the programmer does not define a constructor for a class, Java automatically creates a default one for it. A default constructor is a constructor that doesn't do anything apart from creating the object. The object's variables remain uninitialized (generally, the value of any object references will be `null`, meaning that they do not point to anything, and the values of primitives will be `0`) <br><br>

### Defining Methods For an Object

We know how to create an object and initialize its variables. However, an object also needs methods to be able to do anything. As we've learned, a **method** is a named section of source code inside a class which can be invoked.

```python
class Person:
    name = ""
    age = 0

    def __init__(self,initialName):
        self.age = 0
        self.name = initialName

    def printPerson(self):
        print(self.name + ", age " + str(self.age) + " years")
```

A method is written inside of the class beneath the constructor. The method name is preceded by `def`, just like a function. The only difference between a function and a method is that a method is tied to an object, as we've seen.

The method `printPerson` contains one line of code that makes use of the instance variables `name` and `age`.. Instance variables are referred to with the prefix `this`. All of the object's variables are visible and available from within the method.

Let's create three persons in the main program and request them to print themselves:

```python
def main():
    ada = Person("Ada")
    alan = Person("Alan")
    grace = Person("Grace")

    ada.printPerson()
    alan.printPerson()
    grace.printPerson()

main()
```

Prints:

Negative
: Ada, age 0 years <br> Alan, age 0 years <br> Grace, age 0 years

Positive
: **Exercise - Whistle** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-5-whistle.git)

Positive
: **Exercise - Door** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-6-door.git)

Positive
: **Exercise - Product** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-7-product.git)

### Changing an Instance Variable's Value in a Method

Let's add a method to the previously created person class that increments the age of the person by a year.

```python
class Person:
    def __init__(self,initialName):
        self.age = 0
        self.name = initialName

    def printPerson(self):
        print(self.name + ", age " + str(self.age) + " years")

    def growOlder(self):
        self.age = self.age + 1
```

The method is written inside the `Person` class just as the `printPerson` method was. The method increments the value of the instance variable `age` by one.

Let's call the method and see what happens:

```python
def main():
    ada = Person("Ada")
    alan = Person("Alan")
    grace = Person("Grace")

    ada.printPerson()
    alan.printPerson()
    grace.printPerson()

    ada.growOlder()
    alan.growOlder()

    ada.printPerson()
    alan.printPerson()

main()
```

Prints:

Negative
:  Ada, age 0 years <br> Alan, age 0 years <br> Grace, age 0 years <br> Ada, age 1 years <br> Alan, age 1 years <br>

That is to say that when the two objects are "born" they're both zero-years old (`self.age = 0 ` is executed in the constructor). The `ada` object's `growOlder` method is called twice. As the print output demonstrates, the age of Ada is 2 years after growing older. Calling the method on an object corresponding to Ada has no impact on the age of the other person object since each object instantiated form a class has its own instance variables.

The method can also contain conditional statements and loops. The growOlder method below limits aging to 30 years.

```python
class Person:
    def __init__(self,initialName):
        self.age = 0
        self.name = initialName

    def printPerson(self):
        print(self.name + ", age " + str(self.age) + " years")

    def growOlder(self):
        if (self.age < 30):
            self.age = self.age + 1
```

Positive
: **Exercise - Decreasing Counter** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-8-decreasing-counter.git)

Positive
: **Exercise - Debt** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-9-debt.git)

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
def main():
    teacher = Teacher()

    grading = teacher.grade()

    print("The grade received is " + str(grading))
```

Negative
: The grade received is 10

The return value could also be used to form part of an expression.


```python
def main():
    first = Teacher()
    second = Teacher()
    third = Teacher()

    average = (first.grade() + second.grade() + third.grade()) / 3.0

    print("Grading average " + str(average))
```

Negative
: Grading average 10.0

Let's continue with the Person class and add a `returnAge` method that returns the person's age.

```python
class Person:
    def __init__(self,initialName):
        self.age = 0
        self.name = initialName

    def printPerson(self):
        print(self.name + ", age " + str(self.age) + " years")

    def growOlder(self):
        self.age = self.age + 1

    # the added method
    def returnAge(self):
        return self.age

```

Let's illustrate how the method works:

```python
def main():
    grace = Person("Grace")
    alan = Person("Alan")

    grace.growOlder()
    grace.growOlder()

    alan.growOlder()

    print("Grace's age: " + str(grace.returnAge()))
    print("Alan's age: " + str(alan.returnAge()))
    combined = grace.returnAge() + alan.returnAge()

    print("Grace's and Alan's combined age " + str(combined) + " years")
```

Negative
: Grace's age 2 <br> Alan's age 1 <br><br> Grace's and Alan's combined age 3 years

Positive
: **Exercise - Song** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-10-song.git)

Positive
: **Exercise - Film** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-11-film.git)

As we came to notice, methods can contain source code in the same way as other parts of our program. Methods can have conditionals or loops, and other methods can also be called from them.

Let's now write a method for the person that determines if the person is of legal age. The method returns a boolean - either `True` or `False`:

```python
class Person:

    def isOfLegalAge(self):
        if (self.age < 18):
            return False

        return True

    # The method could have been written more succintly in the following way:
    #
    # def isOfLegalAge():
    #    return self.age >= 18
```

And let's test it out:

```python
def main():
    grace = Person("Grace")
    alan = Person("Alan")

    i = 0
    while (i < 30):
        grace.growOlder()
        i = i + 1

    alan.growOlder()

    if (alan.isOfLegalAge()):
        print("of legal age: ")
        alan.printPerson()
    else:
        print("underage: ")
        alan.printPerson()

    if (grace.isOfLegalAge()):
        print("of legal age: ")
        grace.printPerson()
    else:
        print("underage: ")
        grace.printPerson()
```
Negative
: underage: Alan, age 1 years <br> of legal age: Grace, age 30 years

Let's fine-tune the solution a bit more. In its current form, a person can only be "printed" in a way that includes both the name and the age. Situations exist, however, where we may only want to know the name of an object. Let's write a separate method for this use case:

```python
class Person:
    # ...

    def getName(self):
        return self.name
```

The `getName` method returns the instance variable `name` to the caller. The name of this method is somewhat strange. It is the usual convention to name a method that returns an instance variable exactly this way, i.e., `getVariableName`. Such methods are often referred to as "getters".

Let's mould the main program to use the new "getter" method:

```python
def main():
    grace = Person("Grace")
    alan = Person("Alan")

    i = 0
    while (i < 30):
        grace.growOlder()
        i = i + 1

    alan.growOlder()

    if (alan.isOfLegalAge()):
         print(alan.getName() + " is of legal age")
    else:
         print(alan.getName() + " is underage")

    if (grace.isOfLegalAge()):
         print(grace.getName() + " is of legal age")
    else:
         print(grace.getName() + " is underage ")
```

The print output is starting to turn out quit neat:

Negative
: Alan is underage <br> Grace is of legal age

Positive
: **Exercise - Gauge** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-12-gauge.git)

### A string representation of an object and the toString-method

We are guilty of programming in a somewhat poor style by creating a method for printing the object, i.e., the `printPerson` method. A preferred way is to define a method for the object that returns a "string representation" of the object. We can call the method returning the string representation `toString`. Let's define this method for the person in the following example:

```python
class Person:
    # ...

    def toString(self):
        return self.name + ", age " + str(self.age) + " years"
```

The `toString` functions as `printPerson` does. However, it doesn't itself print anything but instead returns a string representation, which the calling method can execute for printing as needed.

```python
def main(String[] args):
    Person grace = new Person("Grace")
    Person alan = new Person("Alan")

    int i = 0
    while (i < 30):
        grace.growOlder()
        i = i + 1
    }

    alan.growOlder()

    print(grace.toString())
    print(alan.toString())
}
```

Positive
: **Exercise - Agent** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-13-agent.git)

### Method parameters

Let's continue with the `Person` class once more. We've decided that we want to calculate people's body mass indexes. To do this, we write methods for the person to set both the height and the weight, and also a method to calculate the body mass index. The new and changed parts of the Person object are as follows:

```python
class Person:

    def Person(self,initialName):
        self.age = 0
        self.weight = 0
        self.height = 0
        self.name = initialName

    def setHeight(self,newHeight):
        self.height = newHeight

    def setWeight(self,newWeight):
        self.weight = newWeight

    def bodyMassIndex(self):
        heigthPerHundred = self.height / 100.0
        return self.weight / (heigthPerHundred * heigthPerHundred)

    # ...
```

The instance variables `height` and `weight` were added to the person. Values for these can be set using the `setHeight` and `setWeight` methods. Java's standard naming convention is used once again, that is, if the method's only purpose is to set a value to an instance variable, then it's named as `setVariableName`. Value-setting methods are often called "setters". The new methods are put to use in the following case:

```python
def main():
    grace = Person("Grace")
    ada = Person("Ada")

    grace.setHeight(180)
    grace.setWeight(86)

    ada.setHeight(175)
    ada.setWeight(64)

    print(grace.getName() + ", body mass index is " + str(grace.bodyMassIndex()))
    print(ada.getName() + ", body mass index is " + str(ada.bodyMassIndex()))
}
```

Prints:

Negative
: Grace, body mass index is 26.54320987654321 <br> Ada, body mass index is 20.897959183673468

### A parameter and instance variable having the same name!

In the preceding example, the `setHeight` method sets the value of the parameter `newHeight` to the instance variable `height`:

```python
def setHeight(self,newHeight):
    self.height = newHeight
```

The parameter's name could also be the same as the instance variable's, so the following would also work:

```python
def setHeight(self,height):
    self.height = height
```

In this case, `height` in the method refers specifically to a parameter named _height_ and `self.height` to an instance variable of the same name. For example, the following example would not work as the code does not refer to the instance variable _height_ at all. What the code does in effect is set the `height` variable received as a parameter to the value it already contains:

```python
def setHeight(self,height):
    # DON'T DO THIS!!!
    height = height
```

```python
def setHeight(self,height):
    # DO THIS INSTEAD!!!
    self.height = height
```

Positive
: **Exercise - Multiplier** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-14-mutiplier.git)

### Calling an internal method

The object may also call its methods. For example, if we wanted the string representation returned by toString to also tell of a person's body mass index, the object's own `bodyMassIndex` method should be called in the `toString` method:

```python
def toString():
    return self.name + ", age " + str(self.age) + " years, my body mass index is " + str(self.bodyMassIndex())
}
```

So, when an object calls an internal method, the name of the method and this prefix suffice.

Positive
: **Exercise - Statistics** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-15-statistics.git)

Positive
: **Exercise - Payment Card** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/btec-diploma-unit4-programming-master/exercise-4-16-payment-card.git)

Positive
: **Rounding errors** <br><br> You probably noticed that some of the figures have rounding errors. In the previous exercise, for example, Grace's balance of 30.7 may be printed as `30.700000000000003`. This is because floating-point numbers, such as `double`, are actually stored in binary form. That is, in zeros and ones using only a limited number of numbers. <br><br> As the number of floating-point numbers is infinite -- (in case you're wondering "how infinite?", think how many floating-point or decimal values fit between the numbers 5 and 6 for instance). All of the floating-point numbers simply cannot be represented by a finite number of zeros and ones. Thus, the computer must place a limit on the accuracy of stored numbers. <br><br> Normally, account balances, for instance, are saved as integers such that, say, the value 1 represents one cent.
