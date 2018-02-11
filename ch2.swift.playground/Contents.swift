//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

var x = 10
for index in 1...20{
    let y = index * x
    x -= 1
}

var nextYear: Int
var nextMil: Int64 // Int8, Int16, Int32, Int64
var bodyTemp: Float //32 bits
var bodyFever : Double //64 bits
var overHeated: Float80
var hasPet: Bool

var f = "hi"
f = String(1)



var uc = "\u{00200}"

var userName = "John"
var inboxCount = 25
let maxCount = 100
var message = "\(userName) has \(inboxCount) message. Message capacity remaining is \(maxCount - inboxCount)"

var a1 = Array(repeating: 1, count: 3)
var a2 = Array(repeating: 11.0, count: 3)

var s1 : Set = ["one", "two"]
