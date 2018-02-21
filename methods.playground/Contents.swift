//: Playground - noun: a place where people can play

import UIKit
//:# Instance Methods
//: Nothing special
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset(count : Int) {
        self.count = count
    }
}

//: __self__ refers to this instance.

//:## Modifying Value Types from Within Instance Methods

//: Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
//: use __mutating__
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")
// Prints "The point is now at (3.0, 4.0)"

//:## Type Methods

//: Instance methods, as described above, are methods that are called on an instance of a particular type. 
//: You can also define methods that are called on the type itself. These kinds of methods are called type methods. You indicate type methods by writing the __static__ keyword before the method’s func keyword. Classes may also use the __class__ keyword to allow subclasses to override the superclass’s implementation of that method.
class SomeClass {
    static func someTypeMethod() {
        // type method implementation goes here
    }
    class func youCanOverrideMe() {
        // type method implementation goes here
    }
    func aFun (){
        
    }
}
let s = SomeClass()
s.aFun()
//UC SomeClass.aFun()
SomeClass.someTypeMethod() //NOTE 'SomeClass'
SomeClass.youCanOverrideMe()
