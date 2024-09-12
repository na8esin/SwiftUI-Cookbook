import UIKit

var greeting = "Hello, playground"

let c = Car()
print(c.wheels)

class Car {
  var wheels: String {
    get {
      // return self.wheels // これも無限ループになるから、kotlinのBacking fieldsみたいに使うんだろうな

      return "hello"
    }
    set {}
  }
}
