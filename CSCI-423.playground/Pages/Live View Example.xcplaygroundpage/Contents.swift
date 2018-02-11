import UIKit
import PlaygroundSupport
let container = UIView(frame: CGRect(x: 0,y: 0,width: 200,height: 200))

PlaygroundPage.current.liveView = container
container.backgroundColor = UIColor.white
let square = UIView(frame: CGRect(x: 50,y: 50,width: 100,height: 100))
square.backgroundColor = UIColor.red
container.addSubview(square)
UIView.animate(
    withDuration: 5.0, animations: {
        square.backgroundColor = UIColor.blue
        let rotation = CGAffineTransform(rotationAngle: 3.14)
        square.transform = rotation
})

print ("Float Min = \(Int32.min)")
let  d = Double(0.00000000000000000000000000000000000000000000000000000000000000000001)
print(d)
let t = true
print ("\n\n\(t)\n\n")
var mychar = "\u{58}"
mychar = "\u{0059}"
//t = false

let temper = "1"
switch temper {
case "1":
    print ("one")
default:
    break
}