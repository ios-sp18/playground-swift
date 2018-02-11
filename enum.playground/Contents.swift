//: Playground - noun: a place where people can play

import UIKit

//:# Enumeration

enum CompassPoint {
    case north
    case south
    case east
    case west
}

//: Unlike C and Objective-C, Swift enumeration cases are not assigned a default integer value when they are created.
//: In the CompassPoint example above, north, south, east and west do not implicitly equal 0, 1, 2 and 3.
//: Instead, the different enumeration cases are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var dir : CompassPoint
//NOTE: You can only store one value in 'dir'


var directionToHead = CompassPoint.west
//Infer the type
directionToHead = .east


//: Matching Enumeration Values with a Switch Statement

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"

//Remember switches have to be exclusive:
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"

//:Associated values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
//At this point, the original Barcode.upc and its integer values are replaced by the new Barcode.qrCode and its string value.

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

//cleaner way
switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

//: Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//: Here, the raw values for an enumeration called ASCIIControlCharacter are defined to be of type Character, and are set to some of the more common ASCII control characters.
//: Raw values can be strings, characters, or any of the integer or floating-point number types.

//:Implicitly Assigned Raw Values
enum Planet3: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet3.earth.rawValue
//:#### earthsOrder is 3

enum CompassPoint3: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint3.west.rawValue
//:#### sunsetDirection is "west"



