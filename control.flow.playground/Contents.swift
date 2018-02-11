//: Playground - noun: a place where people can play

import UIKit

//:# Control FLow

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: Don't care about index
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

//: Iterate over an array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//: Iterate over dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


//## Switch Statement
//: Exhaustive
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"


//: No Implicit Fallthrough

//to match 'a' & 'A'
let anotherCharacter: Character = "a"
switch anotherCharacter {
//UC case "a": // Invalid, the case has an empty body
case "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// This will report a compile-time error.

//to match 'a' & 'A'
let anotherCharacter2: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"



//:### Interval Matching

//: Values in switch cases can be checked for their inclusion in an interval.
//: This example uses number intervals to provide a natural-language count for numbers of any size:

let approximateCount = 5
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."



//:### Match Tuples

//: You can use tuples to test multiple values in the same switch statement.
//:* Each element of the tuple can be tested against a different value or interval of values.
//:* Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.

//: The example below takes an (x, y) point, expressed as a simple tuple of type (Int, Int), and categorizes it on the graph that follows the example.

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// Prints "(1, 1) is inside the box"



//:### Value Bindings

//: A switch case can bind the value or values it matches to temporary constants or variables, for use in the body of the case.
//: This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"


//:### WHERE

//A switch case can use a where clause to check for additional conditions.

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

//:### Compound Cases

//: Multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns.
//: If any of the patterns match, then the case is considered to match.
let someCharacter3: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter3) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter3) is a consonant")
default:
    print("\(someCharacter3) is not a vowel or a consonant")
}
// Prints "e is a vowel"


//:## Early Exit

//: A guard statement, like an if statement, executes statements depending on the Boolean value of an expression.
//: You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed.
//: Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition is not true.

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."


//:## Control Transfer Statement

//: Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:

//:fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."



/*
continue: tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop
 break: ends execution of an entire control flow statement immediately
return
throw
 */






