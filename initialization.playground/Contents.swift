//: Playground - noun: a place where people can play

import UIKit

//:# Initialization

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"

//:## Default Property Values
//: If you don't want to use init(), you can specify a value along with the declration
struct Fahrenheit2 {
    var temperature = 32.0
}

struct Fahrenheit3 {
    var temperature: Double
}
var f3 = Fahrenheit3(temperature: 40)

struct Fahrenheit4 {
    static let  statTemp = 99
    //UC static let  statTemp2
}



//:## Customizing Initialization
//:You can customize the initialization process with input parameters and optional property types, or by assigning constant properties during initialization:

//:### Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

//:### Parameter Names and Argument Labels
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//UC let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - argument labels are required


//:### Initializer Parameters Without Argument Labels
//: Use underscore
class ImLazy{
    //UC var breaktime: Int
}
//: if you're a class, do your INIT

//:### Optional Property Types
//: Properties of optional type are automatically initialized with a value of nil, indicating that the property is deliberately intended to have “no value yet” during initialization.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

class ImLazyToo{
    var optBreak: Int?
}
//:### Assigning Constant Properties During Initialization
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
// Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"


//:## Default Initializers
//: The default initializer simply creates a new instance with all of its properties set to their default values.
//: Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
//: Because all properties of the ShoppingListItem class have default values, and because it is a base class with no superclass, ShoppingListItem automatically gains a default initializer implementation that creates a new instance with all of its properties set to their default values.

//:### Memberwise Initializers for Structure Types
//: Structure types automatically receive a memberwise initializer if they do not define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that do not have default values.
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Size2 {
    var wdith, height: Double
}
//UC let s2 = Size2()
//UC let s3 = Size2(2, 3)
let s4 = Size2(wdith: 2, height: 3)



//:## Initializer Delegation for Value Types {struct, & enums}
//: You just delegate, or call, another initializer

struct Point {
    var x = 0.0, y = 0.0
}

let p = Point()

struct Rect3 {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let r = Rect3()
//: why do i have to have `init(){}` what heppens if I remove it


//: # Deinitialization
//: * Swift automatically deallocates your instances when they are no longer needed, to free up resources.
//: * Swift handles the memory management of instances through automatic reference counting (ARC), as described in Automatic Reference Counting.
//: * Typically you don’t need to perform manual cleanup when your instances are deallocated.
//: * However, when you are working with your own resources, you might need to perform some additional cleanup yourself.
//:     * For example, if you create a custom class to open a file and write some data to it, you might need to close the file before the class instance is deallocated.
//: * Class definitions can have at most one deinitializer per class.
//: * The deinitializer does not take any parameters and is written without parentheses:
class MyDinit {
    deinit {
        // perform the deinitialization
    }
}
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        print("Bank.init() is called")
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        print("Bank.deinit() is called")
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 9900 coins left in the bank"

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// Prints "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// Prints "The bank now only has 7900 coins left"

playerOne = nil

//: * Deinitializers are called automatically, just before instance deallocation takes place.
//: * You are not allowed to call a deinitializer yourself.
//: * Superclass deinitializers are inherited by their subclasses, and the superclass deinitializer is called automatically at the end of a subclass deinitializer implementation. Superclass deinitializers are always called, even if a subclass does not provide its own deinitializer.

//: What's thisd? _
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//:## Class Inheritance and Initialization
//: * All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.
//: * Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as designated initializers and convenience initializers
//: ### Designated Initializers and Convenience Initializers
//: * Designated initializers are the primary initializers for a class.
//: * A designated initializer fully initializes all properties introduced by that class and **calls an appropriate superclass initializer** to continue the initialization process up the superclass chain.
//: * Every class must have at least one designated initializer.
//:     * In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass
//: * *Convenience* initializers are secondary, supporting initializers for a class.
//: * You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values.
//: * You do not have to provide convenience initializers if your class does not require them.
//:     * usually used for code `reuse`
//: ### Syntax for Designated and Convenience Initializers

//: * Designated initializers for classes are written in the same way as simple initializers for value types:
/*
init(parameters) {
    statements
}
*/

//: Convenience initializers are written in the same style, but with the convenience modifier placed before the init keyword, separated by a space:
/*
convenience init(parameters) {
    statements
}
 */
//: * **swith to slide: Initializer Delegation for Class Types**

class SuperFood{
    
}

class Food : SuperFood{
    var name: String
    init(name: String) {
        self.name = name
        super.init()
    }
    override convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    init(name: String){
        
    }
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let v = Bicycle() // if we remove the `override init()...` this line won't compile.

//:## Failable Initializers

//:## Required Initializers

//:## Setting a Default Property Value with a Closure or Function

