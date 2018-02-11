//: Playground - noun: a place where people can play

import UIKit

//:# Functions

//: You can have 0 or more parameters.
//: return is also optional
func doNothing(){}  //it returns Void secretly, which is empty tuple ()

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}


print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"

//: The return value of a function can be ignored when it is called.
//: But every function must return it's return Type


//:## Functions with Multiple Return Values

//You can use a tuple type as the return type for a function to return multiple values as part of one compound return value.

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//Use it
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"

//:## Optional Tuple Return Types

//: If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil.
//: You write an optional tuple return type by placing a question mark after the tuple type’s closing parenthesis, such as (Int, Int)? or (String, Int, Bool)?.

//: NOTE:
//:* An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?). 
//:* With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.


func minMaxOpt(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMaxOpt(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109"


//:## Function Argument Labels and Parameter Names

//: Each function parameter has both an **argument label** and a **parameter name**.
//: The argument label is used when calling the function;
//: each argument is written in the function call with its argument label before it.

//The parameter name is used in the implementation of the function. 
//By default, parameters use their parameter name as their argument label.
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//:Specifying Argument Labels

//You write an argument label before the parameter name, separated by a space:

func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
    //: let x = argumentLabel
    let x = parameterName
}
//Here’s a variation of the greet(person:) function that takes a person’s name and hometown and returns a greeting:

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill!  Glad you could visit from Cupertino."

//The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent.

//:Omitting Argument Labels

//If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.

func someFunction2(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction2(1, secondParameterName: 2)
//If a parameter has an argument label, the argument must be labeled when you call the function.


//:Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12


//:Variadic Parameters
//A variadic parameter accepts zero or more values of a specified type. 
//The values passed to a variadic parameter are made available within the function’s body as an array of the appropriate type.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers


//:## In-Out Parameters

//:### Function parameters are constants by default.
//:### Trying to change the value of a function parameter from within the body of that function results in a compile-time error.
//:wont' compile
func cantSwatp(_ a: Int, _ b: Int){
    
    //a = 5
}
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"


//:## Function Types
//:This is powerfull

//: Every function has a specific function type, made up of the **parameter types and the return type** of the function.

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/*: This example defines two simple mathematical functions called addTwoInts and multiplyTwoInts.
These functions each take two Int values, and return an Int value, which is the result of performing an appropriate mathematical operation.

The type of both of these functions is (Int, Int) -> Int. This can be read as:

“A function type that has two parameters, both of type Int, and that returns a value of type Int.”

//Here’s another example, for a function with no parameters or return value:*/

func printHelloWorld() {
    print("hello, world")
}
//The type of this function is () -> Void, or “a function that has no parameters, and returns Void.”

//:Using Function Types

//You use function types just like any other types in Swift. 
//For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable:

var mathFunction: (Int, Int) -> Int = addTwoInts

//This can be read as:
//“Define a variable called mathFunction, which has a type of ‘a function that takes two Int values, and returns an Int value.’ Set this new variable to refer to the function called addTwoInts.”
//CAll it using the var name
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

//mathFunction is a var, assign it to another function
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

//: You can pass them as arguments to functions and return them from functions.

//:Nested Functions

//Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. 
//An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope.
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

