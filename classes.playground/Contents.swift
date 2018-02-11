
//:# Classes & Structs

import UIKit

//Syntax
class SomeClass {
    // class definition goes here  TEST
}
struct SomeStructure {
    // structure definition goes here
}

//: Naming convension, Since you're defining type use UpperCamelCase


struct Resolution {
    var width = 0
    var height = 0
    
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: Question: How come all are initialized except for 'name'?

//Create instances
//Since in swift you create instances from both classes & structs, it preferes instance over object.
let someResolution = Resolution()
let someVideoMode = VideoMode()

//: Accessing Properties

//You can access the properties of an instance using dot syntax. In dot syntax, you write the property name immediately after the instance name, separated by a period (.), without any spaces:

print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"

//assign value
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"


//:Memberwise Initializers for Structure Types

//All structures have an automatically-generated memberwise initializer, 
//which you can use to initialize the member properties of new structure instances. 
//Initial values for the properties of the new instance can be passed to the memberwise initializer by name:

let vga = Resolution(width: 640, height: 480)
//UC let vga2 = Resolution(width: 640)
//
//Unlike structures, class instances do not receive a default memberwise initializer.

//:Structures and Enumerations Are Value Types
//:* A value type is a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.
//:* all of the basic types in Swift— integers, floating-point numbers, Booleans, strings, arrays and dictionaries—are value types, and are implemented as structures behind the scenes.
//:* All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they are passed around in your code.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"



//:*The same behavior applies to enumerations:*
enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}
// Prints "The remembered direction is still .west"

//:## Classes Are Reference Types

//Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. 
//:*Rather than a copy, a reference to the same existing instance is used instead.*

//Here’s an example, using the VideoMode class defined above:

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

//:## Identity Operators
//: Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes.
//: It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:

//:* Identical to (===)
//:* Not identical to (!==)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."

//: Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):

//:* “Identical to” means that two constants or variables of class type refer to exactly the same class instance.
//:* “Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.

//:## Choosing Between Classes and Structures

//: You can use both classes and structures to define custom data types to use as the building blocks of your program’s code.

//: However, structure instances are always passed by value, and class instances are always passed by reference. This means that they are suited to different kinds of tasks. 
//: As you consider the data constructs and functionality that you need for a project, decide whether each data construct should be defined as a class or as a structure.

//: As a general guideline, consider creating a structure when one or more of these conditions apply:

//:* The structure’s primary purpose is to encapsulate a few relatively simple data values.
//:* It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure.
//:* Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.
//:* The structure does not need to inherit properties or behavior from another existing type.

//: Examples of good candidates for structures include:

//:* The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
//:* A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
//:* A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.

//: In all other cases, define a class, and create instances of that class to be managed and passed by reference. In practice, this means that most custom data constructs should be classes, not structures.


//:## Assignment and Copy Behavior for Strings, Arrays, and Dictionaries

//: In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.

//: This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.


