//: [Previous](@previous)

/*:
 # Classes
 ---
 Classes in Swift are known as reference types.  A class is passed around by reference and held by memory reference.  This means that methods can have side effects when given classes.
 
 */

class C_Thing {
    var a: Int = 2
}

var thing1 = C_Thing()
let thing2 = thing1

thing2.a = 5

thing1.a
thing2.a

//: `thing1` and `thing2` hold the same reference, so when the value of `a` on `thing2` is modified, `thing1` is also modified.  Also, thing2 was declared as a constant, but the inner value can still be mutated.


/*:
 # Structs
 ---
 Structs in Swift are known as value types.  Enums and tuples are also value types.  Value types are safer than reference types since they are passed and held by value instead of references.  This means they are thread safe and are more efficient than refernence types.
 
 */

struct S_Thing {
    var a: Int = 2
}

var anotherThing1 = S_Thing()
var anotherThing2 = anotherThing1

// Not allowed since we are mutating the value of a within anotherThing2
//let anotherThing2 = anotherThing1

anotherThing2.a = 5

anotherThing1.a
anotherThing2.a

/*:
 Now that we have used a struct instead of a class, the values are kept intact because when the line

`var anotherThing2 = anotherThing1`
 
 is run, the value of `anotherThing1` is copied into `anotherThing2` instead of a reference being shared.  We also cannot declare `anotherThing2` as a constant because we are mutating the value of `a` within `anotherThing2`
 */


//: [Next](@next)
