//: Playground - noun: a place where people can play

import UIKit


//:# ERROR handling
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

//: Because the vend(itemNamed:) method propagates any errors it throws, any code that calls this method must either handle the errors—using a do-catch statement, try?, or try!—or continue to propagate them.
//: The method buyFavoriteSnack propagates the Error

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//Initializers can also throw Errors

//Handling Errors Using Do-Catch

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// Prints "Insufficient funds. Please insert an additional 2 coins."


//:## Converting Errors to Optional Values

//: You use try? to handle an error by converting it to an optional value. 
//: If an error is thrown while evaluating the try? expression, the value of the expression is nil. 
//: For example, in the following code x and y have the same value and behavior:

func someThrowingFunction() throws -> Int {
    // ...
    return 1
}
//: eventhough the return type of someThrowingFunction is 'Int', the type of x is Optional<Int>
let x = try? someThrowingFunction()

//: Identical to the code above.
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//: another example
struct Data {
    
}
func fetchDataFromDisk() throws -> Data? {
    return nil
}
func fetchDataFromServer() throws -> Data? {
    return nil
}
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}


//:## Disabling Error Propagation
//: You know for sure that it won't throw,so you disable it from throwing.
struct Image{
    
}
func loadImage(atPath:String) throws ->Image{
    return Image()
}

let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


//:## Specifying Cleanup Actions
//:Use 'defer'
//: You use a defer statement to execute a set of statements just before code execution leaves the current block of code. This statement lets you do any necessary cleanup that should be performed regardless of how execution leaves the current block of code—whether it leaves because an error was thrown or because of a statement such as return or break
//: A defer statement defers execution until the current scope is exited.

 func exists (_ filename :String) -> Bool{
    return false
}



func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(fname: filename)
        //do some reading, error checking
        //more cod that may return
        //which means you will return before closing the file
        //How to ensure that some will always execute when I leave the this 'scope'?
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}
