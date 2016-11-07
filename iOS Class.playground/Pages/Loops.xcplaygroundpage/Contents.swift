/*:
 [Previous](@previous)
 # Loops
 ---
 
 - Two styles of looping:
    - Traditional
    - Closure

 ## Traditional
 ---
 Swift 3 removed the C-Style for loop declaring a variable at a specific value, then describing the limit and increment. i.e.
 
    for var i = 0; i < 10; i++ {
 
    }
 
 [SE-0007](@https://github.com/apple/swift-evolution/blob/master/proposals/0007-remove-c-style-for-loops.md)
 
 The style of `for` loops in Swift are "for in" loops.  You can omit the `var` / `let` declaration with a default of `let`.  The second parameter is a Range object.  You can shorthand a range object with `..<` or `...`  i.e.
 
    for i in 0..<10 {
        // This loop will execute 10 times and i is a constant
    }
 
 Exclusive for loop
 */
let range = 0..<10
for i in range {
    i
}

//: Inclusive for loop
for i in 0...10 {
    i
}

//: While loop
func whileLoop() {
    var condition = true
    var i = 0
    var step = 2
    while condition {
        if i >= 100 {
            condition = false
        }
        i += step
        step += 1
    }
}
whileLoop()

//: Repeat While Loop
func repeatWhileLoop() {
    var condition = true
    var i = 0
    var step = 4
    repeat {
        if i >= 100 {
            condition = false
        }
        i += step
        step += 1
    } while condition
}
repeatWhileLoop()


/*:
 ## For in loop with collection types
 ---
 The for in loop can also take collection types instead of ranges.  This allows easy interation on arrays and dictionarys.
 */

var words = ["Hello", "World"]
for word in words {
    print(word)
}

var pairs = ["A": 1, "B": 2]

for (key, value) in pairs {
    print("Key: \(key), Value: \(value)")
}

/*:
 ## Closures
 ---
 
 There is a method on collection types called `forEach`.  The `forEach` method takes a closure to use as a single interation.
 */

var integers = [1, 2, 3, 4, 5]
integers.forEach { integer in
    print(integer)
}

//: Example Implementation
extension Array {
    func myForEach(_ closure: (Element) -> Void) {
        for ele in self {
            closure(ele)
        }
    }
}

integers.myForEach { integer in
    print(integer)
}

//: [Next](@next)
