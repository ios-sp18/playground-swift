//: Playground - noun: a place where people can play

import UIKit

//:# Closures
//:## Functions are just special cases of CLOSURES


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//I'd like to sort it
//Swift’s standard library provides a method called sorted(by:)
//which sorts an array of values of a known type, based on the output of a sorting closure that you provide.
//Remember functions are NAMED closures.
//Since the array 'names' is of type Sring, the closure needs to of the type: (String, String) -> Bool

//One way is to provide a name function as a closure.
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

//This is too much typing, instead we'll use 
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


//Because the body of the closure is so short, it can even be written on a single line:
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

//Closure can infer types
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

//You can even throw away the return for single statement
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

//Swift automatically provides shorthand argument names to inline closures, 
//which can be used to refer to the values of the closure’s arguments by the names $0, $1, $2, and so on.
reversedNames = names.sorted(by: { $0 > $1 } )
//Here, $0 and $1 refer to the closure’s first and second String arguments.

//Since String has it's own implementation of >, we can:
reversedNames = names.sorted(by: <)


//: ### C'MON
//: ">"
//: That's it.
//: #### Good closure are the multiple line ones

//: Trailing Closures
//A trailing closure is written after the function call’s parentheses, even though it is still an argument to the function.

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
//NOTE: closure is outside the parameter list parantheses

reversedNames = names.sorted() { $0 > $1 }
//you can ommit the paranthesis if closure is the only parameter.
reversedNames = names.sorted { $0 > $1 }

//:Capturing values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

//This will have it's own stored reference to a new, separate runningTotal variable:
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7




