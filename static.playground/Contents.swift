//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//# Static
//: * you can define type-level methods for all classes, structures, and enumerations. Each type method is explicitly scoped to the type it supports."
//: * enums and structs use the ***static*** keyword to define type methods.
//: * classes use the keyword **class**
//: * Static functions are invoked by the class itself, not by an instance. This makes it simple to invoke utility functions without having to manage an object to do that work for you.

class AppUtils {
    static func appUtility() {
        print ("HI")
    }
}
AppUtils.appUtility()

enum FoodGroups {
    case Carbohydrates, Proteins, Fats, Fibre, Minerals, Vitamins
}

protocol Food {
    //UC class var varietiez:[String] {get}
    static var varieties:[String] {get}
    static func goesWith(type:FoodGroups) -> Bool
}

struct Rice:Food {
    static var varieties:[String] {
        return ["white","brown"]
    }
    static func goesWith(type:FoodGroups) -> Bool {
        if type == .Carbohydrates {
            return false
        }
        else {
            return true
        }
    }
}

Rice.goesWith(type: .Proteins)
Rice.varieties

//: * static can be used before a stored, (non-computed), property
//: * no init() method to initialize type properties

//: ## Class Functions
//: * Class functions (not instance methods) are also static functions but they are dynamically dispatched and can be overridden by subclasses unlike static functions.
class AppUtilsParent{
    class  func appUtility(){
    //UC class final func appUtility(){
    //UC Or, static func appUtility(){
        print("In AppUtils")
    }
}
class AppOtherUtils: AppUtilsParent{
    override class func appUtility(){
        print("In AppOtherUtils")
    }
}
AppOtherUtils.appUtility()

//:## Global Functions
//: * You can also just do a stand alone function in Swift which is not within a class and access it anywhere in the project.
//: * The global functions can be kept in a separate file that we can import into any project as per requirement.

func imGlobalFunc() {
}

//: * We can just access them as _**imGlobalFunc()**_ anywhere in the project.
//: * In case of `static` functions, if we access one of the static member, entire class gets loaded in memory.
//: * But in case of global function, only that particular function will be loaded in memory.

//: ## So, which one is better to use?
//: It is largly subjective why we pick one over another.
//: * Some prefer static method approach as a form of namespacing.
//:     * For example, using the static method approach also allows us to have a method ClassA.appUtility() and a method named ClassB.appUtility(), which is useful while developing a library or framework.
//: * Global functions are more modular and factor out single tasks for a single function - a good global utility function that does exactly one thing and does it perfectly can also sometimes be abstracted or made generic and used in other context as well.

