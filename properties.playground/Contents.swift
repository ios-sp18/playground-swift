//: Playground - noun: a place where people can play

import UIKit

//:# Properties
//:## Stored Properties

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

//:## Stored Properties of Constant Structure Instances
//: If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance’s properties, even if they were declared as variable properties:

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
// rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

//:## Lazy Stored Properties

//: A lazy stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
//:* Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete. 
//:* Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
     lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager() //view the 'manager' on the right, remove 'lazy' then view the 'manager' again.
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

//: Not used until NOW
print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"



//:## Computed Properties

//: They DON'T actually store a value. Instead, they provide a getter and an *optional* setter to retrieve and set other properties and values indirectly.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"


//:## Shorthand Setter Declaration

//: If a computed property’s setter does not define a name for the new value to be set, a default name of __newValue__ is used. 
//: Here’s an alternative version of the Rect structure, which takes advantage of this shorthand notation:

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2) //: __newValue__ default name
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//:## Read-Only Computed Properties

//: A computed property with a getter but no setter is known as a read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.

//: You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth // NO get OR set
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"
//UC fourByFiveByTwo.volume=4.0

//:## Property Observers
//:Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

//: You have the option to define either or both of these observers on a property:

//:* willSet is called just before the value is stored. newValue is passed
//:* didSet is called immediately after the new value is stored. oldValue is passed

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            //if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            //}
        }
    }

}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
stepCounter.totalSteps = 896


//:* You can add property observers to any stored properties you define, except for lazy stored properties. 
//:* Do we need to define observers for computed properties we define? why?
//:* You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass.
//:* why now we can define observers for the computed properties that we inherit?
//:* You don’t need to define property observers for nonoverridden computed properties, because you can observe and respond to changes to their value in the computed property’s setter.


//:## Type Properties

//: Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.

//: You can also define properties that belong to the type itself (class, struct, & enum), not to any one instance of that type. 
//: There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.
//: Type properties are useful for defining values that are universal to all instances of a particular type, such as a constant property that all instances can use (like a static constant in C), or a variable property that stores a value that is global to all instances of that type (like a static variable in C).

//: Stored type properties can be variables or constants. Computed type properties are always declared as variable properties, in the same way as computed instance properties.
//: Why?

//:### Type Property Syntax

//: You define type properties with the static keyword. 
//: For computed type properties for class types, you can use the __class__ keyword instead to allow subclasses to override the superclass’s implementation.
struct SomeStructure {
    static var storedTypeProperty = "Some value." // STORED
    static var computedTypeProperty: Int {   //COMPUTED
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int { //: NOTE CLASS, no mention of static.
        return 107
    }
}


//:### Querying and Setting Type Properties

//: Type properties are queried and set with dot syntax, just like instance properties. 
//: However, type properties are queried and set on the type, not on an instance of that type. For example:

print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"
