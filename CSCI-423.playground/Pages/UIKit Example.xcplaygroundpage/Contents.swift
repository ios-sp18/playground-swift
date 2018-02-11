//: [Previous](@previous)

//import Foundation

import UIKit
let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
myLabel.backgroundColor = UIColor.red

myLabel.text = "Hello Swift"
myLabel.textAlignment = .center
myLabel.font = UIFont(name: "Georgia", size: 24)
myLabel

class SomeClass {
     class func someTypeMethod() {
        // type method implementation goes here
        print ("HEllo")
    }
}
//SomeClass.someTypeMethod()

class AnotherClass : SomeClass {
    override class func someTypeMethod(){
        super.someTypeMethod()
        print("SUB")
        
    }
    
}
//let a = AnotherClass()
AnotherClass.someTypeMethod()

