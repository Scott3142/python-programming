author: Scott Morgan
summary: The sixth part of the course material handles objects consisting of objects, and we'll take a look at separating the text user interface and the program logic.
id: part-6
categories: python-programming
environments: Web
status: Published
feedback link: https://github.com/Scott3142/python-programming
analytics account: UA-49751789-4

# Part 6

## Objects on a list and a list as part of an object
Duration: 01:00:00

### What you'll learn
* You review the use of lists.
* You know how to use a list as an instance variable.

Next, let's have a look at objects that contain a list. Examples of objects like these include objects that describe sets, for example playlists.

In the following example, we have made a class for the concept of a playlist. The playlist contains songs: songs can be added, songs can be removed, and the songs that the playlist contains can be printed.

```python
class Playlist:

    def __init__(self):
        self.songs = []

    def add_song(self,song):
        self.songs.append(song)

    def remove_song(self,song):
        self.songs.remove(song)

    def print_songs(self):
        for song in self.songs:
            print(song)
```

Creating playlists is easy with the help of the class above.

```python
from playlist import Playlist

list = Playlist()
list.add_song("22")
list.add_song("Blank Space")
list.print_songs()
```

Negative
: 22 <br> Blank Space

Positive
: **Exercise - Menu** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-1-menu.git)

Positive
: **Exercise - Stack** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-2-stack.git)

### Objects in an Instance Variable List

A list that is an object's instance variable can contain objects other than strings as long as the type of objects in the list is specified when defining the list.

In the previous section, we created a class called `AmusementParkRide`, which was used to check whether or not a person was eligible to get on a particular ride. The `Amusement park` class looks like the following.

```python
class AmusementParkRide:
     def __init__(self,name,minimum_height):
         self.name = name
         self.minimum_height = minimum_height
         self.visitors = 0

     def is_allowed_on(self,person):
         if (person.get_height() < self.minimum_height):
             return False

         self.visitors += 1
         return True

     def __str__(self):
         return self.name + ", minimum height: " + str(self.minimum_height) + ", visitors: " + str(self.visitors)
```

We'll extend the class so that the amusement park keeps track of the people on the ride. In this version, the ride has, as an instance variable, a list of the people who have been allowed on the ride. The list is created in the constructor.

```python
class AmusementParkRide:
     def __init__(self,name,minimum_height):
         self.name = name
         self.minimum_height = minimum_height
         self.visitors = 0
         self.riding = []

    # ...
```

Let's change the method `is_allowed_on`. The method adds to the list all the persons who meet the height requirements.

```python
class AmusementParkRide:
     def __init__(self,name,minimum_height):
         self.name = name
         self.minimum_height = minimum_height
         self.visitors = 0
         self.riding = []

    def is_allowed_on(self,person):
        if (person.get_height() < self.minimum_height):
            return False

        self.visitors += 1
        self.riding.append(person)
        return True

    def __str__():
        return self.name + ", minimum height requirement: " + str(self.minimum_height) +
            ", visitors: " + str(self.visitors)
```

Positive
: **Exercise - Messaging Service** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-3-messaging-service.git)

### Printing an Object from a List

Let's now modify the `__str__` method so that the string returned by the method contains the name of each and every person on the ride.

```python
class AmusementParkRide:
      def __init__(self,name,minimum_height):
         self.name = name
         self.minimum_height = minimum_height
         self.visitors = 0
         self.riding = []

      def is_allowed_on(self,person):
          if (person.get_height() < self.minimum_height):
              return False

          self.visitors += 1
          self.riding.append(person)
          return True

      def __str__(self):
          # let's form a string from all the people on the list
          on_the_ride = ""
          for person in self.riding:
              on_the_ride = on_the_ride + person.get_name() + "\n"

          # we return a string describing the object
          # including the names of those on the ride
          return self.name + ", minimum height requirement: " + str(self.minimum_height) + ", visitors: " + str(self.visitors) + "\n" + "riding:\n" + on_the_ride
```

Let's test out the extended amusement park ride:

```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_weight(86)
matt.set_height(180)

ada = Person("Ada")
ada.set_weight(34)
ada.set_height(132)

megafobia = AmusementParkRide("Megafobia", 140)

print(megafobia)

print()

if (megafobia.is_allowed_on(matt)):
    print(matt.get_name() + " is allowed on the ride")
else:
    print(matt.get_name() + " is not allowed on the ride")

if (megafobia.is_allowed_on(ada)):
    print(ada.get_name() + " is allowed on the ride")
else:
    print(ada.get_name() + " is not allowed on the ride")

print(megafobia)
```

The program's output is:

Negative
: Megafobia, minimum height requirement: 140, visitors: 0 <br> riding: <br><br> Matt is allowed on the ride <br> Ada is not allowed on the ride <br> Megafobia, minimum height requirement: 140, visitors: 1 <br> riding: <br> Matt

Even though there is no one on the ride, the string `riding:` is on the print output. Let's modify the `__str__` method so that if there is no one on the ride, the string returned by the method informs of it.

```python
class AmusementParkRide:
      def __init__(self,name,minimum_height):
         self.name = name
         self.minimum_height = minimum_height
         self.visitors = 0
         self.riding = []

      # ...

    def __str__(self):

        printOutput = self.name + ", minimum height requirement: " + str(self.minimum_height) + ", visitors: " + str(self.visitors) + "\n"

        if not self.riding:
            return printOutput + "no one is on the ride."

        # we form a string from the people on the list
        peopleOnRide = ""

        for person in self.riding:
            peopleOnRide = peopleOnRide + person.get_name() + "\n"

        return printOutput + "\n" + "on the ride:\n" + peopleOnRide
```

The print output has now been improved.

Negative
: Megafobia, minimum height requirement: 140, visitors: 0 <br> no one is on the ride. <br><br> Matt is allowed on the ride <br> Ada is not allowed on the ride <br> Megafobia, minimum height requirement: 140, visitors: 1 <br><br> on the ride: <br> Matt

Positive
: **Exercise - Printing a Collection** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-4-printing-a-collection.git)

### Clearing an Object's List

We'll next add a `remove_everyone_on_ride` method to the amusement park ride, which removes each and every person currently on the ride. The list method `clear` is very handy here.

```python
class AmusementParkRide:
    # ...

    def remove_everyone_on_ride(self):
        self.riding.clear()

    # ...
```

```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_weight(86)
matt.set_height(180)

ada = Person("Ada")
ada.set_weight(34)
ada.set_height(132)

megafobia = AmusementParkRide("Megafobia", 140)

print(megafobia)

print()

if (megafobia.is_allowed_on(matt)):
    print(matt.get_name() + " is allowed on the ride")
else:
    print(matt.get_name() + " is not allowed on the ride")

if (megafobia.is_allowed_on(ada)):
    print(ada.get_name() + " is allowed on the ride")
else:
    print(ada.get_name() + " is not allowed on the ride")

print(megafobia)

megafobia.remove_everyone_on_ride()

print()
print(megafobia)
```

The program's output is:

Negative
: Megafobia, minimum height requirement: 140, visitors: 0 <br> no one is on the ride. <br><br> Matt is allowed on the ride <br> Ada is not allowed on the ride <br> Megafobia, minimum height requirement: 140, visitors: 1 <br><br> on the ride: <br> Matt <br><br> Megafobia, minimum height requirement: 140, visitors: 1 <br> no one is on the ride.

### Calculating a Sum from Objects on a List

Let's now create a method for the amusement park ride that calculates the average height of the people currently on it. Average height can obtained by calculating the average from the persons on the ride -- the average is calculated by adding up the individual values and dividing that sum by the number of values.

The implementation underneath returns `-1` if not a single person is on the ride. The result of `-1` is impossible in a program that calculates averages. Based on that, we can determine that the average could not have been calculated.

```python
class AmusementParkRide:
    # ...

    def average_height_of_people_on_ride(self):
        if not self.riding:
            return -1

        sum_of_heights = 0
        for person in self.riding:
            sum_of_heights += person.get_height()

        return sum_of_heights / len(self.riding)
    # ...
```


```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_height(180)

ada = Person("Ada")
ada.set_height(132)

grace = Person("Grace")
grace.set_height(194)

megafobia = AmusementParkRide("Megafobia", 140)

megafobia.is_allowed_on(matt)
megafobia.is_allowed_on(ada)
megafobia.is_allowed_on(grace)

print(megafobia)
print(megafobia.average_height_of_people_on_ride())
```

The program's output is:

Negative
: Megafobia, minimum height requirement: 140, visitors: 2 <br><br> on the ride: <br> Matt <br> Grace <br><br> 187.0

Positive
: **Exercise - Santa's Workshop** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-5-santas-workshop.git)

### Retrieving a Specific Object from a List

We'll now create a method for the amusement park ride that returns the tallest person on the ride. As such, the method should both retrieve the tallest person from the list and return it.

Methods that retrieve objects from a list should be implemented in the following way. First off, we'll check whether or not the list is empty - if it is, we return a `None` reference or some other value indicating that the list had no values. After that, we create an object reference variable that describes the object to be returned. We set the first object on the list as its value. We then go through the values on the list by comparing each list object with the object variable representing the object to be returned. If the comparison finds a better matching object, its assigned to the object reference variable to be returned. Finally, we return the object variable describing the object that we want to return.

```python
def get_tallest(self):
    # return a null reference if there's no one on the ride
    if not self.riding:
        return None

    # create an object reference for the object to be returned
    # its first value is the first object on the list
    return_object = self.riding[0]

    # go through the list
    for prs in self.riding:
        # compare each object on the list
        # to the return_object -- we compare heights
        # since we're searching for the tallest,

        if (return_object.get_height() < prs.get_height()):
            # if we find a taller person in the comparison,
            # we assign it as the value of the return_object
            return_object = prs

    # finally, the object reference describing the
    # return object is returned
    return return_object
```

Finding the tallest person is now easy.

```python
from amusement_park_ride import AmusementParkRide
from person import Person

matt = Person("Matt")
matt.set_height(180)

ada = Person("Ada")
ada.set_height(132)

grace = Person("Grace")
grace.set_height(194)

megafobia = AmusementParkRide("Megafobia", 140)

megafobia.is_allowed_on(matt)
megafobia.is_allowed_on(ada)
megafobia.is_allowed_on(grace)

print(megafobia)
print(megafobia.average_height_of_people_on_ride())

print()
print(megafobia.get_tallest().get_name())
tallest = megafobia.get_tallest()
print(tallest.get_name())
```

Negative
: Megafobia, minimum height requirement: 140, visitors: 2 <br> on the ride: <br> Matt <br> Grace <br><br> 187.0 <br><br> Grace <br> Grace

Positive
: **Exercise - Longest in collection** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-6-longest-in-collection.git)

Positive
: **Exercise - Height order** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-7-height-order.git)

Positive
: **Exercise - Cargo hold** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-8-cargo-hold.git)

## Separating the user interface from program logic
Duration: 01:00:00

### What you'll learn
* You understand creating programs so that the user interface and the application logic are separated
* You can create a textual user interface, which takes program specific application logic as a parameter

Let's examine the process of implementing a program and separating different areas of responsibility from each other. The program asks the user to write words until they write the same word twice.

Negative
: Write a word: *User: \<carrot\>* <br> Write a word: *User: \<turnip\>* Write a word:*User: \<potato\>* <br> Write a word: *User: \<celery\>* <br> Write a word: *User: \<potato\>* <br> You wrote the same word twice!

Let's build this program piece by piece. One of the challenges is that it is difficult to decide how to approach the problem, or how to split the problem into smaller subproblems, and from which subproblem to start.

There is no one clear answer -- sometimes it is good to start from the problem domain and its concepts and their connections, sometimes it is better to start from the user interface.

We could start implementing the user interface by creating a class UserInterface:

```python
class UserInterface:

    def __init__(self):
        # initial variables

    def start(self):
        # do something
```

Creating and starting up a user interface can be done as follows.

```python
def main():
    user_interface = UserInterface()
    user_interface.start()
```

### Looping and quitting

This program has (at least) two "sub-problems". The first problem is continuously reading words from the user until a certain condition is reached. We can outline this as follows.

```python
class UserInterface:

    def start(self):
        while True:
            print("Enter a word: ")
            word = input()

            if (*stop condition*):
                break

        print("You gave the same word twice!")
```

The program continues to ask for words until the user enters a word that has already been entered before. Let us modify the program so that it checks whether the word has been entered or not. We don't know yet how to implement this functionality, so let us first build an outline for it.

```python
class UserInterface:

    def start(self):
        while True:
            word = input("Enter a word: ")

            if self.already_entered(word):
                break

        print("You gave the same word twice!")

    def already_entered(self,word):
        # do something here

        return False
```

It's a good idea to test the program continuously, so let's make a test version of the method:

```python
def already_entered(self,word):
    if word == "end":
        return True

    return False
```
Now the loop continues until the input equals the word "end":

Negative
: Write a word: *User: \<carrot\>* <br> Write a word: *User: \<turnip\>* Write a word:*User: \<potato\>* <br> Write a word: *User: \<celery\>* <br> Write a word: *User: \<end\>* <br> You wrote the same word twice!

The program doesn't completely work yet, but the first sub-problem - quitting the loop when a certain condition has been reached - has now been implemented.

### Storing relevant information

Another sub-problem is remembering the words that have already been entered. A list is a good structure for this purpose.

```python
class UserInterface:

    def __init__(self):
        self.words = []

    # ...
```

When a new word is entered, it has to be added to the list of words that have been entered before. This is done by adding a line that updates our list to the while-loop:

```python
while True:
    word = input("Enter a word: ")

    if (self.already_entered(word)):
        break

    # adding the word to the list of previous words
    self.words.append(word)
```

The whole user interface looks as follows.

```python
class UserInterface:

    def __init__(self):
        self.words = []

    def start(self):
        while True:
            word = input("Enter a word: ")

            if (self.already_entered(word)):
                break

            # adding the word to the list of previous words
            self.words.append(word)
        print("You gave the same word twice!")

    def already_entered(self,word):
        if word == "end":
            return True

        return False
```

Again, it is a good idea to test that the program still works. For example, it might be useful to add a test print to the end of the start-method to make sure that the entered words have really been added to the list.

```python
# test print to check that everything still works
for word in self.words:
    print(word)
```

### Combining the solutions to sub-problems

Let's change the method 'already_entered' so that it checks whether the entered word is contained in our list of words that have been already entered.

```python
def already_entered(self,word):
    return word in self.words
```

Now the application works as intended.

### Objects as a natural part of problem solving

We just built a solution to a problem where the program reads words from a user until the user enters a word that has already been entered before. Our example input was as follows:

Negative
: Write a word: *User: \<carrot\>* <br> Write a word: *User: \<turnip\>* Write a word:*User: \<potato\>* <br> Write a word: *User: \<celery\>* <br> Write a word: *User: \<potato\>* <br> You wrote the same word twice!

We came up with the following solution:

```python
class UserInterface:

    def __init__(self):
        self.words = []

    def start(self):
        while True:
            word = input("Enter a word: ")

            if (self.already_entered(word)):
                break

            # adding the word to the list of previous words
            self.words.append(word)

        for word in self.words:
            print(word)            
        print("You gave the same word twice!")

    def already_entered(self,word):
        return word in self.words
```

From the point of view of the user interface, the support variable 'words' is just a detail. The main thing is that the user interface remembers the *set of words* that have been entered before. The set is a clear distinct "concept" or an abstraction. Distinct concepts like this are all potential objects: when we notice that we have an abstraction like this in our code, we can think about separating the concept into a class of its own.

### Word set

Let's make a class called 'WordSet'. After implenting the class, the user interface's start method looks like this:

```python
while True:
    word = input()

    if (words.contains(word)):
        break

    word_set.add(word)

print("You gave the same word twice!")
```

From the point of view of the user interface, the class WordSet should contain the method `contains(self,word)`, that checks whether the given word is contained in our set of words, and the method `add(self,word)`, that adds the given word into the set.

We notice that the readability of the user interface is greatly improved when it's written like this.

The outline for the class 'WordSet' looks like this:

```python
class WordSet:
    # object variable(s)

    def __init__(self):
        # constructor

    def contains(self,word):
        # implementation of the contains method
        return False

    def add(self,word):
        # implementation of the add method
```

### Earlier solution as part of implementation

We can implement the set of words by making our earlier solution, the list, into an object variable:

```python
class WordSet:
    def __init__(self):
        self.words = []

    def add(self,word):
        self.words.append(word)

    def contains(self,word):
        return word in self.words  
```

Now our solution is quite elegant. We have separated a distinct concept into a class of its own, and our user interface looks clean. All the "dirty details" have been encapsulated neatly inside an object.

Let's now edit the user interface so that it uses the class WordSet. The class is given to the user interface as a parameter, just like Scanner.

```python
class UserInterface:

    def __init__(self,WordSet):
        self.word_set = WordSet

    def start(self):
        while True:
            word = input("Enter a word: ")

            if (self.word_set.contains(word)):
                break

            # adding the word to the list of previous words
            self.word_set.add(word)

        print("You gave the same word twice!")
```

Starting the program is now done as follows:

```python
from user_interface import UserInterface
from word_set import WordSet

def main():
    set = WordSet()

    user_interface = UserInterface(set)
    user_interface.start()
```

### Changing the implementation of a class

We have arrived at a situation where the class 'WordSet' "encapsulates" a list. Is this reasonable? Perhaps. This is because we can make other changes to the class if we so desire, and before long we might arrive into a situation where the word set has to be, for example, saved into a file. If we make all these changes inside the class WordSet without changing the names of the methods that the user interface uses, we don't have to modify the actual user interface at all.

The main point here is that changes made inside the class WordSet don't affect the class UserInterface. This is because the user interface uses WordSet through the methods that it provides -- these are called its deferfaces.

### Implementing new functionality: palindromes

In the future, we might want to augment the program so that the class 'WordSet' offers some new functionalities. If, for example, we wanted to know how many of the entered words were palindromes, we could add a method called 'palindromes' into the program.

```python
def start(self):
        while True:
            word = input("Enter a word: ")

            if (self.word_set.contains(word)):
                break

            # adding the word to the list of previous words
            self.word_set.add(word)

        print("You gave the same word twice!")
        print(str(self.word_set.palindromes()) + " of the words were palindromes.")

```

The user interface remains clean, because counting the palindromes is done inside the 'WordSet' object. The following is an example implementation of the method.

```python
class WordSet:
    def __init__(self):
        self.words = []

    def add(self,word):
        self.words.append(word)

    def contains(self,word):
        return word in self.words

    def palindromes(self):
        count = 0

        for word in self.words:
            if is_palindrome(word):
                count += 1

        return count

    def is_palindrome(self,word):
        end = len(word) - 1

        i = 0
        while (i < len(word) / 2):
            # [] returns the character at given index
            # as a simple variable
            if(word[i] != word[end-i]):
                return False

            i += 1

        return True
```

The method 'palindromes' uses the helper method 'is_palindrome' to check whether the word that's given to it as a parameter is, in fact, a palindrome.

Positive
: **Recycling** <br><br> When concepts have been separated into different classes in the code, recycling them and reusing them in other projects becomes easy. For example, the class 'WordSet' could be well be used in a graphical user interface, and it could also part of a mobile phone application. In addition, testing the program is much easier when it has been divided into several concepts, each of which has its own separate logic and can function alone as a unit.

### Programming tips

In the larger example above, we were following the advice given here.

-  Proceed with small steps
    -  Try to separate the program into several sub-problems and **work on only one sub-problem at a time**
    -  Always test that the program code is advancing in the right direction, in other words: test that the solution to the sub-problem is correct
    -  Recognize the conditions that require the program to work differently. In the example above, we needed a different functionality to test whether a word had been already entered before.

-  Write as "clean" code as possible
    -  Indent your code
    -  Use descriptive method and variable names
    -  Don't make your methods too long, not even the main method
    -  Do only one thing inside one method
    -  **Remove all copy-paste code**
    -  Replace the "bad" and unclean parts of your code with clean code

-  If needed, take a step back and assess the program as a whole. If it doesn't work, it might be a good idea to return into a previous state where the code still worked. As a corollary, we might say that a program that's broken is rarely fixed by adding more code to it.

Programmers follow these conventions so that programming can be made easier. Following them also makes it easier to read programs, to keep them up, and to edit them in teams.

Positive
: **Exercise - Simple Dictionary** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-9-simple-dictionary.git)

Positive
: **Exercise - To do list** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-10-to-do-list.git)

### From one entity to many parts

Let's examine a program that asks the user to enter exam points and turns them into grades. Finally, the program prints the distribution of the grades as stars. The program stops reading inputs when the user inputs an empty string. An example program looks as follows:

Positive
: Points: <br> *User: \<91\>* <br> Points: <br> *User: \<98\>* <br> Points: <br> *User: \<103\>* <br> Impossible number. <br> Points: <br> *User: \<90\>* <br> Points: <br> *User: \<89\>* <br> Points: <br> *User: \<89\>* <br> Points: <br> *User: \<88\>* <br> Points: <br> *User: \<72\>* <br> Points: <br> *User: \<54\>* <br> Points: <br> *User: \<55\>* <br> Points: <br> *User: \<59\>* <br> Points: <br> *User: \<41\>* <br> Points: <br> *User: \<48\>* <br> Points: <br><br> 5: \*\*\* <br> 4: \*\*\* <br> 3: \* <br> 2: <br> 1: \*\*\* <br> 0: \*\*

As with almost all programs, this program can be written into main as one entity. Here is one possibility.


```python
def main():
    grades = []

    while True:
        textinput = input("Points: ")
        if (textinput == ""):
            break

        score = int(textinput)

        if (score < 0 or score > 100):
            print("Impossible number.")
            continue

        grade = 0
        if (score < 50):
            grade = 0
        elif (score < 60):
            grade = 1
        elif (score < 70):
            grade = 2
        elif (score < 80):
            grade = 3
        elif (score < 90):
            grade = 4
        else:
            grade = 5

        grades.append(grade)

    print("")
    grade = 5
    while (grade >= 0):
        stars = 0
        for received in grades:
            if (received == grade):
                stars += 1

        print(str(grade) + ": ")
        while (stars > 0):
            print("*")
            stars -= 1

        print("")

        grade = grade - 1

main()        
```

Let's separate the program into smaller chunks. This can be done by identifying several discrete areas of responsibility within the program. Keeping track of grades, including converting scores into grades, could be done inside a different class. In addition, we could create a new class for the user interface.

### Program logic

Program logic includes parts that are crucial for the execution of the program, like functionalities that store information. From the previous example, we can separate the parts that store grade information. From these we can make a class called 'GradeRegister', which is responsible for keeping track of the numbers of different grades students have received. In the register, we can add grades according to scores. In addition, we can use the register to ask how many people have received a certain grade.

An example class follows.

```python
class GradeRegister:

    def __init__(self):
        self.grades = []

    def add_grade_based_on_points(self,points):
        self.grades.append(self.points_to_grades(points))

    def number_of_grades(self,grade):
        count = 0
        for received in self.grades:
            if (received == grade):
                count += 1

        return count

    def points_to_grades(self,points):

        grade = 0
        if (points < 50):
            grade = 0
        elif (points < 60):
            grade = 1
        elif (points < 70):
            grade = 2
        elif (points < 80):
            grade = 3
        elif (points < 90):
            grade = 4
        else:
            grade = 5

        return grade
```

When the grade register has been separated into a class, we can remove the functionality associated with it from our main program. The main program now looks like this.

```python
from grade_register import GradeRegister

def main():
    register = GradeRegister()

    while True:
        textinput = input("Points: ")
        if not textinput: # same as input == ""
            break

        score = int(textinput)

        if (score < 0 or score > 100):
            print("Impossible number.")
            continue

        register.add_grade_based_on_points(score)

    print("")
    grade = 5
    while (grade >= 0):
        stars = register.number_of_grades(grade)
        print(str(grade) + ": ")
        while (stars > 0):
            print("*")
            stars-= 1

        print("")

        grade = grade - 1
```

Separating the program logic is a major benefit for the maintenance of the program. Since the program logic -- in this case the GradeRegister -- is its own class, it can also be tested separately from the other parts of the program. If you wanted to, you could copy the class `GradeRegister` and use it in your other programs. Below is an example of simple manual testing -- this experiment only concerns itself with a small part of the register's functionality.

```python
register = GradeRegister()
register.add_grade_based_on_points(51)
register.add_grade_based_on_points(50)
register.add_grade_based_on_points(49)

print("Number of students with grade 0 (should be 1): " + str(register.number_of_grades(0)))
```

### User interface

Typically each program has its own user interface. We will create the class `UserInterface` and separate it from the main program. The user interface receives two parameters in its constructor: a grade register for storing the grades, and a Scanner object used for reading input.

When we now have a separate user interface at our disposal, the main program that initializes the whole program becomes very clear.

```python
from grade_register import GradeRegister
from user_interface import UserInterface

def main():
    register = GradeRegister()

    user_interface = UserInterface(register)
    user_interface.start()
```

Let's have a look at how the user interface is implemented. There are two essential parts to the UI: reading the points, and printing the grade distribution.

```python
class UserInterface:

    def __init__(self,register):
        self.register = register

    def start(self):
        self.read_points()
        print("")
        self.print_grade_distribution()

    def read_points(self):

    def print_grade_distribution(self):
```

We can copy the code for reading exam points and printing grade distribution nearly as is from the previous main program. In the program below, parts of the code have indeed been copied from the earlier main program, and new method for printing stars has also been created -- this clarifies the method that is used for printing the grade distribution.

```python
class UserInterface:

    def __init__(self,register):
        self.register = register

    def start(self):
        self.read_points()
        print("")
        self.print_grade_distribution()

    def read_points(self):
        while True:
            textinput = input("Points: ")
            if not textinput: # same as input == ""
                break

            score = int(textinput)

            if (score < 0 or score > 100):
                print("Impossible number.")
                continue

            self.register.add_grade_based_on_points(score)

    def print_grade_distribution(self):
        grade = 5
        while (grade >= 0):
            stars = self.register.number_of_grades(grade)
            print(str(grade) + ": ")
            self.print_stars(stars)
            print("")

            grade = grade - 1

    def print_stars(self,stars):
        while (stars > 0):
            print("*")
            stars-= 1
```

Positive
: **Exercise - Averages** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-11-averages.git)

Positive
: **Exercise - Joke manager** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-12-joke-manager.git)

## Introduction to testing
Duration: 01:00:00

### What you'll learn
* You can explain about some issues caused by software bugs.
* You know what a stack trace is, the steps taken in troubleshooting, and can give textual test inputs to code.
* You know what unit testing is all about and you can write unit tests.
* You know about test-driven software development.

Let's take our first steps in the world of program testing.

### Error Situations and Step-By-Step Problem Resolving

Errors end up in the programs that we write. Sometimes the errors are not serious and cause headache mostly to users of the program. Occasionally, however, mistakes can lead to very serious consequences. In any case, it's certain that a person learning to program makes many mistakes.

You should never be afraid of or avoid making mistakes since that is the best way to learn. For this reason, try to break the program that you're working on from time to time to investigate error messages, and to see if those messages tell you something about the error(s) you've made.

Positive
: **Software Error** <br><br> The report in the address [http://sunnyday.mit.edu/accidents/MCO_report.pdf](http://sunnyday.mit.edu/accidents/MCO_report.pdf) describes an incident resulting from a more serious software error and also the error itself. <br><br> The bug in the software was caused by the fact that the program in question expected the programmer to use the [International System of Units](https://en.wikipedia.org/wiki/International_System_of_Units) (meters, kilograms, ...) in the calculations. However, the programmer had used the [American Measurement System](https://en.wikipedia.org/wiki/English_Engineering_units) for some of the system's calculations, which prevented the satellite navigation auto-correction system from working as inteded. <br><br> The satellite was destroyed, costing millions of dollars of damage.

As programs grow in their complexity, finding errors becomes even more challenging.

### Stack Trace (Traceback)

When an error occurs in a program, the program typically prints something called a stack trace, i.e., the list of method calls that resulted in the error. For example, for a file that contains:

```python
def greet(name):
    print('Hello, ' + nam)

greet('Ada')
```

a stack trace might look like this:

```plaintext
Traceback (most recent call last):
  File "/path/to/example.py", line 4, in <module>
    greet('Ada')
  File "/path/to/example.py", line 2, in greet
    print('Hello, ' + nam)
NameError: name 'nam' is not defined
```

The type of error is stated at the beginning of the list, and the following lines tell us where the error occurred. The type of error thrown here is a `NameError`, which says that Python didn't understand the variable `nam` (since it should have been `name` here).

### Checklist for Troubleshooting

If your code doesn't work and you don't know where the error is, these steps will help you get started.

1. Indent your code properly and find out if there are any missing parentheses.
2. Verify that the variables used are correctly named.
3. Test the program flow with different inputs and find out the sort of input that causes the program to not work as desired. If you received an error in the tests, the tests may also indicate the input used.
4. Add print commands to the program in which you print out the values of the variables used at various stages of the program's execution.
5. Verify that all variables you are using are initialized. If they aren't, an AttributeError error will occur.
6. If your program causes an exception, you should definitely pay attention to the *stack trace* associated with the exception, which is the list of method calls that resulted in the situation that caused the exception.
7. Learn how to use a debugger.

### Automated testing

Manually testing the program is often laborious. It's possible to automate the testing by using a testing framework such as `pytest`. You'll find an example below of how to test a program automatically:

```python
def ada():
    return "Ada Lovelace"
```

```python
import adafile

def test_ada():
    assert adafile.ada() == "Ada Lovelace"
```

Each of these programs is in a different file in the same directory. The first has the filename `adafile.py` while the second has the filename `test_adafile.py`. You can run the test with the command `pytest` in the same directory.

### Unit Testing

The automated testing method laid out above where the input to a program is modified is quite convenient, but limited nonetheless. Testing larger programs in this way is challenging. One solution to this is unit testing, where small parts of the program are tested in isolation.

Unit testing refers to the testing of individual components in the source code, such as classes and their provided methods. The writing of tests reveals whether each class and method observes or deviates from the guideline of each method and class having a single, clear responsibility. The more responsibility the method has, the more complex the test. If a large application is written in a single method, writing tests for it becomes very challenging, if not impossible. Similarly, if the application is broken into clear classes and methods, then writing tests is straightforward.

Ready-made unit test libraries are commonly used in writing tests, which provide methods and help classes for writing tests. The most common unit testing library in Python is `unittest` but we will advocate the usage of `pytest` in this course. The code you have been submitting to Github throughout this course has been unit tested along the way. Go back and look through the folders you've been submitting. You should see test files in there which are used to verify your code is correct. Explore them!

Positive
: **Unit Testing and the Parts of an Application** <br><br> Unit testing tends to be extremely complicated if the whole application has been written in one function. To make testing easier, the app should split into small parts, each having a clear responsibility. In the previous section, we practiced this when we separated the user interface from the application logic. Writing tests for parts of an application, such as the 'JokeManager' class from the exercise in the previous section is significantly easier than writing them for program contained in "main" in its entirety.

### Test-Driven Development

[Test-driven development](https://en.wikipedia.org/wiki/Test-driven_development) is a software development process that's based on constructing a piece of software in small iterations. In test-driven software development, the first thing a programmer always does is write an automatically-executable test, which tests a single piece of the computer program.

The test will not pass because the functionality that satisfies the test, i.e., the part of the computer program to be examined, is missing. Once the test has been written, functionality that meets the test requirements is added to the program. The tests are run again. If all tests pass, a new test is added, or alternatively, if the tests fail, the already-written program is corrected. If necessary, the internal structure of the program will be corrected or refactored, so that the functionality of the program remains the same, but the structure becomes clearer.

Test-driven software development consists of five steps that are repeated until the functionality of the program is complete.

1. Write a test. The programmer decides which program functionality to test and writes a test for it.

2. Run the tests and check if the tests pass. When a new test is written, the tests are run. If the test passes, the test is most likely erroneous and should be corrected - the test should only test functionality that hasn't yet been implemented.

3. Write the functionality that meets the test's requirements. The programmer implements functionality that only meets the test requirements. Note: this doesn't do things that the test does not require - functionality is only added in small increments.

4. Perform the tests. If the tests fail, there is likely to be an error in the functionality written. Correct the functionality - or, if there is no error in the functionality, fix the latest test that was performed.

5. Repair the internal structure of the program. As the size of the program increases, its internal structure is adjusted as needed. Methods that are too long are broken down into multiple parts and classes representing concepts are isolated. The tests are not modified, but are instead used to verify the correctness of the changes made to the program's internal structure - if a change in the program structure changes the functionality of the program, the tests will produce a warning and the programmer can remedy the situation.

Positive
: **Exercise - Testing** <br><br> Read the instructions for the exercise and commit the solution via Github. <br><br> [Source files on Github](https://github.com/den01-python-programming/exercise-6-13-testing.git)

Positive
: **Unit testing** <br><br> Unit testing is only a part of software testing. On top of unit testing, a developer also performs integration tests that examine the interoperability of components, such as classes, and interface tests that test the application's interface through elements provided by the interface, such as buttons. <br><br> These testing methods are covered in more detail in more advanced courses. <br><br> You can check out [this excellent resource](https://realpython.com/python-testing/) if you are interested in learning more about testing in Python.

## Complex programs
Duration: 00:10:00

When you learn programming, you also develop a better eye for reading code (yours and others). In this part we understood the use of lists and practiced separating the UI from the program logic.

The following is from [On the role of scientific thought](https://www.cs.utexas.edu/users/EWD/ewd04xx/EWD447.PDF) by [Edsger W. Dijkstra](https://en.wikipedia.org/wiki/Edsger_W._Dijkstra) .

_Let me try to explain to you, what to my taste is characteristic for all intelligent thinking. It is, that one is willing to study in depth an aspect of one's subject matter in isolation for the sake of its own consistency, all the time knowing that one is occupying oneself only with one of the aspects. We know that a program must be correct and we can study it from that viewpoint only; we also know that it should be efficient and we can study its efficiency on another day, so to speak. In another mood we may ask ourselves whether, and if so: why, the program is desirable. But nothing is gained - on the contrary! - by tackling these various aspects simultaneously. It is what I sometimes have called "**the separation of concerns**", which, even if not perfectly possible, is yet the only available technique for effective ordering of one's thoughts, that I know of. This is what I mean by "focusing one's attention upon some aspect": it does not mean ignoring the other aspects, it is just doing justice to the fact that from this aspect's point of view, the other is irrelevant. It is being one- and multiple-track minded simultaneously._

The core of Dijkstra's message is, that the problem areas of a program must be separated from each other -- this is exactly what we have been doing with object-oriented programming and by separating the UI from the program logic. Each problem area has been separated into its own part.
This can also be viewed through the lens of program responsibilities. In [his blog](https://8thlight.com/blog/uncle-bob/2014/05/08/SingleReponsibilityPrinciple.html) Robert "Unvle Bob" C. Martin describes the term "**single responsibility principle**":

_When you write a software module, you want to make sure that when changes are requested, those changes can only originate from a single person, or rather, a single tightly coupled group of people representing a single narrowly defined business function. You want to isolate your modules from the complexities of the organization as a whole, and design your systems such that each module is responsible (responds to) the needs of just that one business function._

_[..in other words..] Gather together the things that change for the same reasons. Separate those things that change for different reasons._

Proper program structure and following good naming principles leads to clean code. When you code a bit more, you'll learn that each program part can be given one clear area of responsibility.

replace-with-summary-form-6
