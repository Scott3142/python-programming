author: Scott Morgan
summary: The fifth part of the course material continues with object-oriented programming, which was introduced in the fourth part.
id: part-5
categories: python-programming
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 5

## Learning object-oriented programming
Duration: 01:00:00

### What you'll learn
* To revise the concepts of class and object.
* To realize that a program that has been written without objects can also be written using objects.
* To realize that the use of objects can make a program more understandable.

So, what's object-oriented programming all about?

Let's step back for a moment and inspect how a clock works. The clock has three hands: hours, minutes and seconds. The second-hand grows once every second, the minute hand every sixty seconds, and the hour hand every sixty minutes. When the value of the second hand is 60, its value is set to zero, and the value of the minute hand grows by one. When the minute hand's value is 60, its value is set to zero, and the hour hand's value grows by one. When the hour hand's value is 24, it's set to zero.

The time is always printed in the form `hours: minutes: seconds`, where two digits are used to represent the hour (e.g., 01 or 12) as well as the minutes and seconds.

The clock has been implemented below using integer variables (the printing could be in a separate method, but that has not been done here).

```python
hours = 0
minutes = 0
seconds = 0

while True:
    # 1. Printing the time
    if (hours < 10):
        print("0")
    print(hours)

    print(":")

    if (minutes < 10):
        print("0")
    print(minutes)

    print(":")

    if (seconds < 10):
        print("0")
    print(seconds)
    print()

    # 2. The second hand's progress
    seconds = seconds + 1

    # 3. The other hand's progress when necessary
    if (seconds > 59):
        minutes = minutes + 1
        seconds = 0

        if (minutes > 59):
            hours = hours + 1
            minutes = 0

            if (hours > 23):
                hours = 0
```

As we can see by reading the example above, how a clock consisting of three variables works is not clear to someone reading the code. By looking at the code, it's difficult to "see" what's going on.

A famous [programmer](https://en.wikipedia.org/wiki/Kent_Beck) once remarked *"Any fool can write code that a computer can understand. Good Programmers write code that humans can understand"*.

Our aim is to make the program more understandable.

Since a clock hand is a clear concept in its own right, a good way to improve the program's clarity would be to turn it into a class. Let's create a `ClockHand` class that describes a clock hand, which contains information about its value, upper limit (i.e., the point at which the value of the hand returns to zero), and provides methods for advancing the hand, viewing its value, and also printing the value in string form.

```python
class ClockHand:

    def __init__(self,limit):
        self.limit = limit
        self.value = 0

    def advance(self):
        self.value = self.value + 1

        if (self.value >= self.limit):
            self.value = 0

    def get_value(self):
        return self.value

    def __str__(self):
        if (self.value < 10):
            return "0" + str(self.value)

        return "" + str(self.value)
```

Once we've created the ClockHand class, our clock has become clearer. It's now straightforward to print the clock, i.e., the clock hand, and the hand's progression is hidden away in the ClockHand class.

Since the the hand returns to the beginning automatically with the help of the upper-limit variable defined by the ClockHand class, the way the hands work together is slightly different than in the implementation that used integers. That one looked at whether the value of the integer that represented the clock hand exceeded the upper limit, after which its value was set to zero and the value of the integer representing the next clock hand was incremented.

Using clock-hand objects, the minute hand advances when the second hand's value is zero, and the hour hand advances when the minute hand's value is zero.

```python
from clock_hand import ClockHand

hours = ClockHand(24)
minutes = ClockHand(60)
seconds = ClockHand(60)

while True:
    # 1. Printing the time
    print(str(hours) + ":" + str(minutes) + ":" + str(seconds))

    # 2. Advancing the second hand
    seconds.advance()

    # 3. Advancing the other hands when required
    if (seconds.get_value() == 0):
        minutes.advance()

        if (minutes.get_value() == 0):
            hours.advance()
```

**Object-oriented programming is primarily about isolating concepts into their own entities or, in other words, creating abstractions**. Despite the previous example, one might deem it pointless to create an object containing only a number since the same could be done directly with variables. However, that is not always the case.

Separating a concept into its own class is a good idea for many reasons. Firstly, certain details (such as the rotation of a hand) can be hidden inside the class (i.e., **abstracted**). Instead of typing an if-statement and an assignment operation, it's enough for the one using the clock hand to call a clearly-named method `advance()`. The resulting clock hand may be used as a building block for other programs as well - the class could be named `counter_limited_from_top`, for instance. That is, a class created from a distinct concept can serve multiple purposes. Another massive advantage is that since the details of the implementation of the clock hand are not visible to its user, they can be changed if desired.

We realized that the clock contains three hands, i.e., it consists of three concepts. The clock is a concept in and of itself. As such, we can create a class for it too. Next, we create a class called "Clock" that hides the hands inside of it.

```python
from clock_hand import ClockHand

class Clock:

    def __init__(self):
        self.hours = ClockHand(24)
        self.minutes = ClockHand(60)
        self.seconds = ClockHand(60)

    def advance(self):
        self.seconds.advance()

        if (self.seconds.get_value() == 0):
            self.minutes.advance()

            if (self.minutes.get_value() == 0):
                self.hours.advance()

    def __str__(self):
        return str(self.hours) + ":" + str(self.minutes) + ":" + str(self.seconds)
```

The way the program functions has become increasingly clearer. When you compare our program below to the original one that was made up of integers, you'll find that the program's readability is superior.

```python
from clock import Clock

clock = Clock()

while True:
    print(clock)
    clock.advance()
```

The clock we implemented above is an object whose functionality is based on "simpler" objects, i.e., its hands. This is precisely the **great idea behind ​​object-oriented programming: a program is built from small and distinct objects that work together**

Positive
: **Exercise - One Minute** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-1-one-minute.git)

Next, let's review topic terminology.

### Object

An **Object** refers to an independent entity that contains both data (instance variables) and behaviour (methods). Objects may come in lots of different forms: some may describe problem-domain concepts, others are used to coordinate the interaction that happens between objects. Objects interact with one another through method calls -- these method calls are used to both request information from objects and give instructions to them.

Generally, each object has clearly defined boundaries and behaviours and is only aware of the objects that it needs to perform its task. In other words, the object hides its internal operations, providing access to its functionality through clearly defined methods. Moreover, the object is independent of any other object that it doesn't require to accomplish its task.

In the previous section, we dealt with objects that represented people whose structure was defined in a "Person" class. It's a good idea to remind ourselves of what a class does: a **class** contains the blueprint needed to create objects, and also defines the objects' variables and methods. An object is created on the basis of the class constructor.

Our person objects had a name, age, weight and height property, along with a few methods. If we were to think about the structure of our person object some more, we could surely come up with more variables related to a person, such as a personal ID number, telephone number, address and eye color.

In reality, we can relate all kinds of different information and things to a person. However, when building an application that deals with people, the **functionality and features related to a person are gathered based on the application's use case**. For example, an application focused on personal health and well-being would probably keep track of the variables mentioned earlier, such as age, weight, and height, and also provide the ability to calculate a body mass index and a maximum heart rate. On the other hand, an application focused on communication could store people's email addresses and phone numbers, but would have no need for information such as weight or height.

**The state of an object** is the value of its internal variables at any given point in time.

In the Python programming language, a Person object that keeps track of name, age, weight, and height, and provides the ability to calculate body mass index and maximum heart rate would look like the following. Below, the height and weight are expressed as floats - the unit of length is one meter.

```python
class Person:
    def __init__(self,name,age,weight,height):
        self.age = age
        self.name = name
        self.weight = weight
        self.height = height

    def body_mass_index(self):
        return self.weight / (self.height * self.height)

    def maximum_heart_rate(self):
        return 206.3 - (0.711 * self.age)

    def __str__(self):
        return self.name + ", BMI: " + str(self.body_mass_index()) + ", maximum heart rate: " + str(self.maximum_heart_rate())
```

Determining the maximum heart rate and body mass index of a given person is straightforward using the Person class described above.

```python
name = input("What's your name?")
age = int(input("What's your age?"))
weight = float(input("What's your weight?"))
height = float(input("What's your height?"))

person = Person(name, age, weight, height)
print(person)
```

Negative
: What's your name? <br> *User: \<Ada Lovelace\>* <br> What's your age? <br> *User: \<51\>* <br> What's your weight? <br> *User: \<80\>* <br> What's your height? <br> *User: \<1.70\>* <br> Ada Lovelace, BMI: 27.68166089965398, maximum heart rate: 170.03900000000002

### Class

A class defines the types of objects that can be created from it. It contains instance variables describing the object's data, a constructor or constructors used to create it, and methods that define its behaviour. A rectangle class is detailed below which defines the functionality of a rectangle.

```python
# class
class Rectangle:

    # constructor
    def __init__(self,width,height):
        self.width = width
        self.height = height

    # methods
    def widen(self):
        self.width = self.width + 1

    def narrow(self):
        if (self.width > 0):
            self.width = self.width - 1

    def surface_area(self):
        return self.width * self.height

    def __str__(self):
        return "(" + str(self.width) + ", " + str(self.height) + ")"
```

Some of the methods defined above do not return a value, while others do. The class above also defines the `__str__` method, which returns the string used to print the object.

Objects are created from the class through constructors much like variable declarations. Below, we'll create two rectangles and print information related to them.

```python
from rectangle import Rectangle

first = Rectangle(40, 80)
rectangle = Rectangle(10, 10)
print(first)
print(rectangle)

first.narrow()
print(first)
print(first.surface_area())
```

Negative
: (40, 80) <br> (10, 10) <br> (39, 80) <br> 3920

Positive
: **Exercise - Book** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-2-book.git)

Positive
: **Exercise - Cube** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-3-cube.git)

Positive
: **Exercise - FitByte** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-4-FitByte.git)

## Removing repetitive code (overloading methods and constructors)
Duration: 01:00:00

### What you'll learn
* Becoming familiar with the term overloading
* Creating multiple constructors for a class.
* Creating multiple methods with the same name in a class.

Let's once more return to our Person class. It currently looks like this:

```python
class Person:

    def __init__(self,name):
        self.name = name
        self.age = 0
        self.weight = 0
        self.height = 0

    def grow_older(self):
        self.age += 1

    def is_adult(self):
        if (self.age < 18):
            return False

        return True

    def body_mass_index(self):
        height_in_meters = self.height / 100.0

        return self.weight / (height_in_meters * height_in_meters)

    def __str__(self):
        return self.name + " is " + str(self.age) + " years old, their BMI is " + str(self.body_mass_index())

    def set_height(height):
        self.height = height

    def get_height(self):
        return self.height

    def get_weight(self):
        return self.weight

    def set_weight(weight):
        self.weight = weight

    def get_name(self):
        return self.name
```

All person objects are 0 years old when created. This is because the constructor sets the value of the instance variable `age` to 0:

```python
def __init__(self, name):
    self.name = name
    self.age = 0
    self.weight = 0
    self.height = 0
```

###  Constructor Overloading

We would also like to be able to create persons so that the constructor is provided both the age as well as the name as parameters. This is possible in Python if we use **class methods**. Note that if you are coming from a programming background that allows multiple constructors, this is not allowed in Python. Class methods can be implemented as follows:

```python
class Person:
    def __init__(self,name, age=0, weight=0, height=0):
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height

    @classmethod
    def with_age(cls,name,age):
        return cls(name,age)

    def __str__(self):
      return self.name + " is " + str(self.age) + " years old."
```

Notice here that we have moved the declaration of the zero age, weight and height into the argument of the `__init__` method to allow us to use the classmethod.

We now have two alternative ways to create objects:

```python
def main():
    paul = Person("Paul")
    ada = Person.with_age("Ada",24)

    print(paul)
    print(ada)
```

Negative
: Paul is 0 years old. <br> Ada is 24 years old.

The technique of having two (or more) constructors in a class is known as *constructor overloading*.

Positive
: **Exercise - Constructor Overload** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-5-constructor-overload.git)

### Method Overloading

Methods and constructors can also be overloaded in Python by specifying an argument list quantified by the keyword `None`. It's arguable as to whether this is neater or more readable than the example above, but in the interest of completeness, let's take a look at it. Let's change the `grow_older` method so that we can specify a value that ages the person by the amount of years given to it as a parameter.


```python
def grow_older(self, years=None):
    if years is not None:
        self.age = self.age + years
    else:
        self.age = self.age + 1
```

In the example below, "Paul" is born 24 years old, ages by a year and then by 10 years:


```python
def main():
    paul = Person("Paul", 24)
    print(paul)

    paul.grow_older()
    print(paul)

    paul.grow_older(10)
    print(paul)
```

Prints:


Negative
: Paul is 24 years old. <br> Paul is 25 years old. <br> Paul is 35 years old.

Positive
: **Exercise - Overloaded Counter** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-6-overloaded-counter.git)

## Objects and references
Duration: 01:00:00

### What you'll learn
* You will brush up on using classes and objects.
* You can use an object as an object variable and a method parameter.
* You can create a method that returns an object.
* You can create the method equals, which can be used to check if two objects of the same type have the same contents or state.

Let's continue working with objects. Assume we can use the class that represents a person, shown below. Person has object variables name, age, weight and height. Additionally, it contains methods to calculate the body mass index, among other things.

```python
class Person:

    def __init__(self, name, age=0, weight=0, height=0):
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height

    @classmethod
    def with_age(cls, name, age):
        return cls(name, age)

    @classmethod
    def with_age_weight_height(cls, name, age, weight, height):
        return cls(name, age, weight, height)

    # other constructors and methods

    def get_name(self):
        return self.name

    def get_age(self):
        return self.age

    def get_height(self):
        return self.height

    def grow_older(self):
        self.age = self.age + 1

    def set_height(self,newHeight):
        self.height = newHeight

    def set_weight(self,newWeight):
        self.weight = newWeight

    def body_mass_index(self):
        heightPerHundred = self.height / 100.0
        return self.weight / (heightPerHundred * heightPerHundred)

    def __str__(self):
        return self.name + ", age " + str(self.age) + " years"
```

Precisely what happens when a new object is created?

```python
joan = Person("Joan Ball")
```

Calling a constructor with this command causes several things to happen. First, space is reserved in the computer memory for storing object variables. Then default or initial values are set to object variables (e.g. variable receives an initial value of 0). Lastly, the source code in the constructor is executed.

A constructor call returns a reference to an object. A **reference** is information about the location of object data.

So the value of the variable is set to be a reference, i.e. knowledge about the location of related object data. The image above also reveals that strings -- the name of our example person, for instance -- are objects, too.

### Assigning a reference type variable copies the reference

Let's add a `Person` type variable called `ball` into the program, and assign `joan` as its initial value. What happens then?

```python
joan = Person("Joan Ball")
print(joan)

ball = joan
```

The statement `ball = joan ` creates a new Person variable `ball`, and copies the value of the variable `joan` as its value. As a result, `ball` refers to the same object as `joan`.

Let's inspect the same example a little more thoroughly.

```python
joan = Person("Joan Ball")
print(joan)

ball = joan
ball.grow_older()
ball.grow_older()

print(joan)
```

Negative
: Joan Ball, age 0 years <br> Joan Ball, age 2 years

Joan Ball -- i.e. the Person object that the reference in the `joan` variable points at -- starts as 0 years old. After this the value of the `joan` variable is assigned (so copied) to the `ball` variable. The Person object `ball` is aged by two years, and Joan Ball ages as a consequence!

An object's internal state is not copied when a variable's value is assigned. A new object is not being created in the statement `ball = joan ` -- the value of the variable ball is assigned to be the copy of  joan's value, i.e. a reference to an object.

Next, the example is continued so that a new object is created for the `joan` variable, and a reference to it is assigned as the value of the variable. The variable `ball` still refers to the object that we created earlier.

```python
joan = Person("Joan Ball")
print(joan)

ball = joan
ball.grow_older()
ball.grow_older()

print(joan)

joan = Person("Joan B.")
print(joan)
```

The following is printed:

Negative
: Joan Ball, age 0 years <br> Joan Ball, age 2 years <br> Joan B., age 0 years

So in the beginning the variable `joan` contains a reference to one object, but in the end a reference to another object has been copied as its value. Here is a picture of the situation after the last line of code.

### *None* value of a reference variable

Let's extend the example further by setting  the value of the reference variable `ball` to `None`, i.e. a reference "to nothing". The `None` reference can be set as the value of any reference type variable.

```python
joan = Person("Joan Ball")
print(joan)

ball = joan
ball.grow_older()
ball.grow_older()

print(joan)

joan = Person("Joan B.")
print(joan)

ball = None
```

The object whose name is Joan Ball is referred to by nobody. In other words, the object has become "garbage". In the Python programming language the programmer need not worry about the program's memory use. From time to time, the automatic garbage collector of the Python language cleans up the objects that have become garbage. If the garbage collection did not happen, the garbage objects would reserve a memory location until the end of the program execution.

Let's see what happens when we try to print a variable that references "nothing" i.e. `None`.

```python
joan = Person("Joan Ball")
print(joan)

ball = joan
ball.grow_older()
ball.grow_older()

print(joan)

joan = Person("Joan B.")
print(joan)

ball = None
print(ball)
```

Negative
: Joan Ball, age 0 years <br> Joan Ball, age 2 years <br> Joan B., age 0 years <br> None

Printing a `None` reference prints "None". How about if we were to try and call a method, say `grow_older`, on an object that refers to nothing:

```python
joan = Person("Joan Ball")
print(joan)

joan = None
joan.grow_older()
```

The result is an Attribute Error.

Bad things follow. This could be the first time you have seen the text **Attribute Error**. In the course of the program, there occurred an error indicating that we called a method on a variable that refers to nothing.

We promise that this is not the last time you will encounter the previous error. When you do, the first step is to look for variables whose value could be `None`. Fortunately, the error message is useful: it tells which row caused the error. Try it out yourself!

### Object as a method parameter

We have seen variables act as method parameters. Since objects are also variables, any type of object can be defined to be a method parameter. Let's take a look at a practical demonstration.

Amusement park rides only permit people who are taller than a certain height. The limit is not the same for all attractions. Let's create a class representing an amusement park ride. When creating a new object, the constructor receives as parameters the name of the ride, and the smallest height that permits entry to the ride.

```python
class AmusementParkRide:
    def __init__(self,name,minimum_height):
        self.name = name
        self.minimum_height = minimum_height

    def __str__(self):
        return self.name + ", minimum height: " + str(self.minimum_height)
```

Then let's write a method that can be used to check if a person is allowed to enter the ride, so if they are tall enough. The method returns `True` if the person given as the parameter is permitted access, and `False` otherwise.

Below, it is assumed that Person has the method `def get_height()` that returns the height of the person.

```python
class AmusementParkRide:
    def __init__(self,name,minimum_height):
        self.name = name
        self.minimum_height = minimum_height

    def allowed_to_ride(self,person):
        if (person.get_height() < self.minimum_height):
            return False

        return True

    def __str__(self):
        return self.name + ", minimum height: " + str(self.minimum_height)
```

So the method `allowed_to_ride` of an AmusementParkRide object is given a `Person` object as a parameter. Like earlier, the value of the variable is copied for the method to use. The method handles this and it calls the `get_height` method of the person passed as a parameter.

Below is an example main program where the amusement park ride method is called twice: first the supplied parameter is a person object `matt`, and then a person object `jasper`:

```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_weight(86)
matt.set_height(180)

jasper = Person("Jasper")
jasper.set_weight(34)
jasper.set_height(132)

water_track = AmusementParkRide("Water track", 140)

if (water_track.allowed_to_ride(matt)):
    print(matt.get_name() + " may enter the ride")
else:
    print(matt.get_name() + " may not enter the ride")

if (water_track.allowed_to_ride(jasper)):
    print(jasper.get_name() + " may enter the ride")
else:
    print(jasper.get_name() + " may not enter the ride")

print(water_track)
```

The output of the program is:

Negative
: Matt may enter the ride <br> Jasper may not enter the ride <br> Water track, minimum height: 140

What if we wanted to know how many people have taken the ride?

Let's add an object variable to the amusement park ride. It keeps track of the number of people that were permitted to enter.

```python
class AmusementParkRide:
    def __init__(self,name,minimum_height):
        self.name = name
        self.minimum_height = minimum_height
        self.visitors = 0

    def allowed_to_ride(self,person):
        if (person.get_height() < self.minimum_height):
            return False

        self.visitors += 1
        return True

    def __str__(self):
        return self.name + ", minimum height: " + str(self.minimum_height) + ", visitors: " + str(self.visitors)
```

Now the previously used example program also keeps track of the number of visitors who have experienced the ride.

```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_weight(86)
matt.set_height(180)

jasper = Person("Jasper")
jasper.set_weight(34)
jasper.set_height(132)

water_track = AmusementParkRide("Water track", 140)

if (water_track.allowed_to_ride(matt)):
    print(matt.get_name() + " may enter the ride")
else:
    print(matt.get_name() + " may not enter the ride")

if (water_track.allowed_to_ride(jasper)):
    print(jasper.get_name() + " may enter the ride")
else:
    print(jasper.get_name() + " may not enter the ride")

print(water_track)
```

The output of the program is:

Negative
: Matt may enter the ride <br> Jasper may not enter the ride <br> Water track, minimum height: 140, visitors: 1

Positive
: **Exercise - Health station** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-7-health-station.git)

Positive
: **Exercise - Card payments** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-8-card-payments.git)

### Object as object variable

Objects may contain references to objects.

Let's keep working with people, and add a birthday to the person class. A natural way of representing a birthday is to use a `Date` class. We will call this class `SimpleDate`

```python
class SimpleDate:
    def __init__(self,day,month,year):
        self.day = day
        self.month = month
        self.year = year

    def get_day(self):
        return self.day

    def get_month(self):
        return self.month

    def get_year(self):
        return self.year

    def __str__(self):
        return str(self.day) + "." + str(self.month) + "." + str(self.year)
```

We can change our Person class to take reference of the birthday. Since we know the birthday, there is no need to store that age of a person as a separate object variable. The age of the person can be inferred from their birthday.

Let's create a new Person method that allows for setting the birthday:

```python
from simple_date import SimpleDate

class Person:

    def __init__(self, name, birthday):
        self.name = name
        self.birthday = birthday

    @classmethod
    def with_birthday(cls, name, date):
        return cls(name,date)
```

Along with constructor above, we could give Person another constructor where the birthday was given as integers.

```python
@classmethod
def with_birthday_as_integers(cls, name, day, month, year):
    date = SimpleDate(day,month,year)
    return cls(name,date)
```

The constructor receives as parameters the different parts of the date (day, month, year). They are used to create a date object, and finally the reference to that date is copied to `__init__`.

Let's modify the `__str__` method of the Person class so that instead of age, the method returns the birthday:

```python
def __str__(self):
    return self.name + ", born on " + str(self.birthday)
```

Let's see how the updated Person class works.

```python
from person import Person
from simple_date import SimpleDate

date = SimpleDate(1, 1, 1780)
euler = Person("Euler", date)
pascal = Person.with_birthday_as_integers("Pascal", 19, 6, 1623)

print(euler)
print(pascal)
```

Negative
: Euler, born on 1.1.1780 <br> Pascal, born on 19.6.1623

Positive
: **Dates in Python** <br><br> Python has special methods which can handle datetimes. You can read more [here](https://www.w3schools.com/python/python_datetime.asp).

Positive
: **Exercise - Biggest pet shop** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-9-biggest-pet-shop.git)

### Object of same type as method parameter

We will continue working with the `Person` class. We recall that persons know their birthdays:

We would like to compare the ages of two people. The comparison can be done in multiple ways. We could, for instance, implement a method called `def ageAsYears()` for the Person class  in that case, the comparison would happen in the following manner:

```python
date = SimpleDate(1, 1, 1780)
euler = Person("Euler", date)
pascal = Person.with_birthday_as_integers("Pascal", 19, 6, 1623)

if (euler.ageAsYears() > pascal.ageAsYears()):
    print(euler.get_name() + " is older than " + pascal.get_name())
```

We are now going to learn a more "object-oriented" way to compare the ages of people.

We are going to create a new method `older_than(compared)` for the Person class. It can be used to compare a certain person object to the person supplied as the parameter based on their ages.

The method is meant to be used like this:

```python
date = SimpleDate(1, 1, 1780)
euler = Person("Euler", date)
pascal = Person.with_birthday_as_integers("Pascal", 19, 6, 1623)

if euler.older_than(pascal):  #  same as euler.older_than(pascal)==true
    print(euler.get_name() + " is older than " + pascal.get_name())
else:
    print(euler.get_name() + " is not older than " + pascal.get_name())
```

The program above asks if Euler is older than Pascal. The method `older_than` returns `True` if the object that is used to call the method (`object.older_than(objectGivenAsParameter)`) is older than the object given as the parameter, and `False` otherwise.

In practice, we call the `older_than` method of the object that matches "Euler ibn Musa Euler", which is referred to by the variable `euler`. The reference `pascal`, matching the object "Blaise Pascal", is given as the parameter to that method.

The program prints:

Negative
: Euler is older than Pascal

The method `older_than` receives a person object as its parameter. More precisely, the variable that is defined as the method parameter receives a copy of the value contained by the given variable. That value is a reference to an object, in this case.

The implementation of the method is illustrated below. Note that the **method may return a value in more than one place** -- here the comparison has been divided into multiple parts based on the years, the months, and the days:

```python
class Person:
    # ...

    def older_than(self,other):
        # 1. First compare years
        own_year = self.get_birthday().get_year()
        compared_year = other.get_birthday().get_year()

        if (own_year < compared_year):
            return True

        if (own_year > compared_year):
            return False

        # 2. Same birthyear, compare months
        own_month = self.get_birthday().get_month()
        compared_month = other.get_birthday().get_month()

        if (own_month < compared_month):
            return True

        if (own_month > compared_month):
            return False

        # 3. Same birth year and month, compare days
        own_day = self.get_birthday().get_day()
        compared_day = other.get_birthday().get_day()

        if (own_day < compared_day):
            return True

        return False
```

Let's pause for a moment to consider abstraction, one of the principles of object-oriented programming. The idea behind abstraction is to conceptualize the programming code so that each concept has its own clear responsibilities. When viewing the solution above, however, we notice that the comparison functionality would be better placed inside the `SimpleDate` class instead of the `Person` class.

We'll create a method called `def before(self,other)` for the class `SimpleDate`. The method returns the value `true` if the date given as the parameter is after (or on the same day as) the date of the object whose method is called.

```python
class SimpleDate:

    def __init__(self,day,month,year):
        self.day = day
        self.month = month
        self.year = year

    def get_day(self):
        return self.day

    def get_month(self):
        return self.month

    def get_year(self):
        return self.year

    def __str__(self):
        return str(self.day) + "." + str(self.month) + "." + str(self.year)

    # used to check if this date object (`self`) is before
    # the date object given as the parameter (`compared`)
    def before(self,other):
        # first compare years
        if (self.year < other.year):
            return True

        if (self.year > other.year):
            return False

        # years are same, compare months
        if (self.month < other.month):
            return True

        if (self.month > other.month):
            return False

        # years and months are same, compare days
        if (self.day < other.day):
            return True

        return False
```

An example of how to use the method:

```python
from simple_date import SimpleDate

def main():
    d1 = SimpleDate(14, 2, 2011)
    d2 = SimpleDate(21, 2, 2011)
    d3 = SimpleDate(1, 3, 2011)
    d4 = SimpleDate(31, 12, 2010)

    print(str(d1) + " is earlier than " + str(d2) + ": " + str(d1.before(d2)))
    print(str(d2) + " is earlier than " + str(d1) + ": " + str(d2.before(d1)))

    print(str(d2) + " is earlier than " + str(d3) + ": " + str(d2.before(d3)))
    print(str(d3) + " is earlier than " + str(d2) + ": " + str(d3.before(d2)))

    print(str(d4) + " is earlier than " + str(d1) + ": " + str(d4.before(d1)))
    print(str(d1) + " is earlier than " + str(d4) + ": " + str(d1.before(d4)))
```

Negative
: 14.2.2011 is earlier than 21.2.2011: true <br> 21.2.2011 is earlier than 14.2.2011: false <br> 21.2.2011 is earlier than 1.3.2011: true <br> 1.3.2011 is earlier than 21.2.2011: false <br> 31.12.2010 is earlier than 14.2.2011: true <br> 14.2.2011 is earlier than 31.12.2010: false

Let's tweak the method older_than of the Person class so that from here on out, we take use of the comparison functionality that date objects provide.

```python
class Person:
    # ...

    def older_than(self,other):
        if (self.birthday.before(other.get_birthday())):
            return True

        return False

        # or return more directly:
        # return self.birthday.before(other.get_birthday())
```

Now the concrete comparison of dates is implemented in the class that it logically (based on the class names) belongs to.

Positive
: **Exercise - Comparing apartments** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-10-comparing-apartments.git)

### Comparing the equality of objects (__eq__)

With variables, comparison can be done with two equality signs. This is because the value of a variable is stored directly in the "variable's box".

The method `is` is similar to the method `__str__` in the respect that it is available for use even if it has not been defined in the class. The default implementation of this method compares the equality of the references. Let's observe this with the help of the previously written `SimpleDate` class.

```python
first = SimpleDate(1, 1, 2000)
second = SimpleDate(1, 1, 2000)
third = SimpleDate(12, 12, 2012)
fourth = first

if (first is first):
    print("Variables first and first are equal")
else:
    print("Variables first and first are not equal")

if (first is second):
    print("Variables first and second are equal")
else:
    print("Variables first and second are not equal")

if (first is third):
    print("Variables first and third are equal")
else:
    print("Variables first and third are not equal")

if (first is fourth):
    print("Variables first and fourth are equal")
else:
    print("Variables first and fourth are not equal")
```

Negative
: Variables first and first are equal <br> Variables first and second are not equal <br> Variables first and third are not equal <br> Variables first and fourth are equal

There is a problem with the program above. Even though two dates (first and second) have exactly the same values for object variables, they are different from each other from the point of view of the default `is` method.

If we want to be able to compare two objects of our own design with the `==` method, that method must be defined in the class. The method equals is defined as a method that returns a boolean type value -- the return value indicates whether the objects are equal.

The method `is` is implemented in a way that allows for using it to compare the current object with any other object. The method receives an object as its single parameter -- all objects are Object type, in addition to their own type. The equals method first compares if the addresses are equal: if so, the objects are equal. After this, we examine if the types of the objects are the same: if not, the objects are not equal. Then the object passed as the parameter is converted to the type of the object that is being examined by using a type cast. Then the values of the object variables can be compared. Below the equality comparison has been implemented for the SimpleDate class.

```python
class SimpleDate:

    def __init__(self,day,month,year):
        self.day = day
        self.month = month
        self.year = year

    def get_day(self):
        return self.day

    def get_month(self):
        return self.month

    def get_year(self):
        return self.year

    def __eq__(self,other):
        # if the type of the compared object is not SimpleDate, the objects are not equal
        if not isinstance(other,SimpleDate):
            return False

        # if the values of the object variables are the same, the objects are equal
        if (self.day == other.day and self.month == other.month and self.year == other.year):
            return True

        # otherwise the objects are not equal
        return False

    def __str__(self):
        return self.day + "." + self.month + "." + self.year
```

Building a similar comparison functionality is possible for Person objects, too. Below, the comparison has been implemented for Person objects that don't have a separate SimpleDate object. Notice that the names of people are strings (i.e. objects), so we use the equals method for comparing them.

```python
class Person:
    # constructors and methods


    def __eq__(self,other):
        # if the compared object is not of type Person, the objects are not equal
        if not isinstance(other,Person):
            return False

        # if the values of the object variables are equal, the objects are equal
        if (self.name == other.name and self.age == other.age and self.weight == other.weight and self.height == other.height):
            return True

        # otherwise the objects are not equal
        return False

    # .. methods
```

Positive
: **Exercise - Song** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-11-song.git)

Positive
: **Exercise - Identical Twins** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-12-identical-twins.git)

### Object equality and lists

Every class we create (and every ready-made Python class) inherits the class Object, even though it is not specially visible in the program code. This is why an instance of any class can be passed as a parameter to a method that receives an Object type variable as its parameter. Inheriting the Object can be seen elsewhere, too: for instance, the `__str__` method exists even if you have not implemented it yourself, just as the `__eq__` method does.

To illustrate, the following source code runs successfully: `==` method can be found in the Object class inherited by all classes.

```python
class Bird:

    def __init__ (self,name):
        self.name = name
```

```python
from bird import Bird

red = Bird("Red")
print(red)

chuck = Bird("Chuck")
print(chuck)

if (red == chuck):
    print(red + " equals " + chuck)
```

Let's examine how the `__eq__` method is used with lists. Let's assume we have the previously described class `Bird` without any `__eq__` method.

```python
class Bird:

    def __init__ (self,name):
        self.name = name
```

Let's create a list and add a bird to it. After this we'll check if that bird is contained in it.

```python
from bird import Bird

birds = []
red = Bird("Red")

if red in birds:
    print("Red is on the list.")
else:
    print("Red is not on the list.")

birds.append(red)
if red in birds:
    print("Red is on the list.")
else:
    print("Red is not on the list.")

print("However!")

red = Bird("Red")
if red in birds:
    print("Red is on the list.")
else:
    print("Red is not on the list.")
```

Negative
: Red is not on the list. <br> Red is on the list. <br> However! <br> Red is not on the list.

We can notice in the example above that we can search a list for our own objects. First, when the bird had not been added to the list, it is not found -- and after adding it is found. When the program switches the `red` object into a new object, with exactly the same contents as before, it is no longer equal to the object on the list, and therefore cannot be found on the list.

The `is` method of a list uses the `==` method that is defined for the objects in its search for objects. In the example above, the `Bird` class has no definition for that method, so a bird with exactly the same contents -- but a different reference -- cannot be found on the list.

Let's implement an `__eq__` method for the class `Bird`. The method examines if the names of the objects are equal -- if the names match, the birds are thought to be equal.

```python
class Bird:

    def __init__ (self,name):
        self.name = name

    def __eq__(self,other):
        # if the compared object is not of type Bird, the objects are not equal
        if not isinstance(other,Bird):
            return False

        # if the values of the object variables are equal, the objects are, too
        return self.name == other.name
```

Now the contains list method recognizes birds with identical contents.

```python
from bird import Bird

birds = []
red = Bird("Red")

if (red in birds):
    print("Red is on the list.")
else:
    print("Red is not on the list.")

birds.append(red)
if (red in birds):
    print("Red is on the list.")
else:
    print("Red is not on the list.")


print("However!")

red = Bird("Red")
if (red in birds):
    print("Red is on the list.")
else:
    print("Red is not on the list.")

```

Negative
: Red is not on the list. <br> Red is on the list. <br> However! <br> Red is on the list.

Positive
: **Exercise - Books** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-13-books.git)

Positive
: **Exercise - Archive** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-14-archive.git)

### Object as a method's return value

We have seen methods return boolean values, numbers, and strings. Easy to guess, a method can return an object of any type.

In the next example we present a simple counter that has the method `clone`. The method can be used to create a clone of the counter  i.e. a new counter object that has the same value at the time of its creation as the counter that is being cloned.

```python
from counter import Counter

class Counter:

    def __init__(self,initialValue):
        self.value = initialValue

    def increase(self):
        self.value = self.value + 1

    def __str__(self):
        return "value: " + str(self.value)

    def counter_clone(self):
        # create a new counter object that receives the value of the cloned counter as its initial value
        clone = Counter(self.value)

        # return the clone to the caller
        return clone
```
An example of using counters follows:

```python
counter = Counter(0)
counter.increase()
counter.increase()

print(counter)          # prints 2

clone = counter.counter_clone()

print(counter)          # prints 2
print(clone)           # prints 2

counter.increase()
counter.increase()
counter.increase()
counter.increase()

print(counter)          # prints 6
print(clone)           # prints 2

clone.increase()

print(counter)          # prints 6
print(clone)           # prints 3
```

Immediately after the cloning operation, the values contained by the clone and the cloned object are the same. However, they are two different objects, so increasing the value of one counter does not affect the value of the other in any way.

Similarly, a `Factory` object could also be used to create and return new `Car` objects. Below is a sketch of the outline of the factory -- the factory also knows the makes of the cars that are created.

```python
class Factory:

    def __init__(self,make):
        self.make = make

    def produce_car(self):
        return Car(self.make)
```

Positive
: **Exercise - Dating app** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-15-dating-app.git)

Positive
: **Exercise - Money** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-5-16-money.git)

## Summary
Duration: 00:10:00

In the fifth part we took a deep dive into the world of objects. We examined the differences between primitive and reference variables. We learned to overload methods and constructors, and we practiced using objects as object variables, method parameters, and method return values. We created methods that compare objects with each other, and we saw how objects are handled with objects in them.

replace-with-summary-form-5
