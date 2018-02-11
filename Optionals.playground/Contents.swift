//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let name:String? = String("Hi")
print(name)

//: Same using Optional
let lName:Optional<String> = String("Hi")
print(lName)


//: These two are the same
let x: String? = nil
let xx = Optional<String>.none

//: These two are the same
let y: String? = "Hello"
let yy = Optional<String>.some("Hello")

//: Button
let b: UIButton = UIButton()
let title = b.currentTitle

//:bad int
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//:I know what I'm doing, just UNWRAP IT!!!
print (convertedNumber!)

//:now change possibleNumber to "12z"


//:what's better
//:Reads as follow:
//:“If the optional Int returned by Int(possibleNumber) contains a value, set a new constant called actualNumber to the value contained in the optional.”

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
}else{
    print("\"\(possibleNumber)\" could not be converted to an integer")
}





