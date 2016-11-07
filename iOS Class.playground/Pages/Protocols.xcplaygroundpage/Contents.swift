//: [Previous](@previous)


/*:
 # Protocols
 ---
 Protocols are used extensively in Swift.  There are multiple ways people define Swift protocols.  Some see protocols as intefaces such as Java, or abstract classes.  Others define Swift protocols as Traits / Mixins like ruby.
 
 Protocols are influenced by all of these concepts and are a little bit of everything.  Protocols were originally used to create the Delegation pattern which is used extensively in iOS.
 
 In Swift conforming to a protocol will force the conforming object to adhere to all properties and methods defined.  Then instead of referencing conrete types, we can reference objects through protocol types.
 
 */

protocol Animal {
    func talk() -> String
}

struct Cat: Animal {
    func talk() -> String {
        return "Meow"
    }
}

struct Dog: Animal {
    func talk() -> String {
        return "Woof!"
    }
}

let cat = Cat()
let dog = Dog()

cat.talk()
dog.talk()

let animalCat: Animal = Cat()
let animalDog: Animal = Dog()

animalCat.talk()
animalDog.talk()

/*:
 ## Delegation Pattern
 ---
 This pattern is used to "delegate" responsibility to another object.  In the case of iOS, the most common use of the delegation pattern is used in table views.  A table view uses a delegate to allow any object to configure a table view.
 
 We can use this pattern to create a service that will send network requests.
 
 */

import Foundation

protocol NetworkRequestDelegate {
    func complete(successful: Bool, and data: Data)
}

class Service {
    func sendNetworkRequest(with delegate: NetworkRequestDelegate) {
        makeRequest(with: delegate.complete)
    }
    
    private func makeRequest(with completion: (Bool, Data) -> Void) {
        // details don't matter
        completion(true, "Hello".data(using: .utf8)!)
    }
}

class MyObject: NetworkRequestDelegate {
    var service = Service()
    
    func getData() {
        service.sendNetworkRequest(with: self)
    }
    
    func complete(successful: Bool, and data: Data) {
        // This will be called everytime a network request completes
        print("Was Successful: \(successful) with Data: \(data)")
    }
}

let obj = MyObject()
obj.getData()


//: [Next](@next)
