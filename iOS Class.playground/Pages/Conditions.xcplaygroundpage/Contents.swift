//: [Previous](@previous)

/*:
 # Conditions
 ---
 
 There are two types of conditional statements: `if` and `guard`:
 
 `if` statements work exactly the same as in other languages.
 
 `guard` statements, however, are a bit different.  The `guard` statement is meant to insure the condition is true at the same scope level.  Unlike `if` statements where the inner scope is the true branch, a `guard` statement's inner scope is the negative case.
 */
func testIf(with condition: Bool) -> String {
    if condition {
        return "hello"
    }
    else {
        return "Goodbye"
    }
}
testIf(with: true)
testIf(with: false)


func testGuard(with condition: Bool) -> String {
    guard condition else {
        return "Goodbye"
    }
    return "Hello"
}
testGuard(with: true)
testGuard(with: false)
/*:
 
 The purpose of the `guard` statement is to clean up the branch structure so the positive case is kept at the same scope level for clarity.
 
 ## Working with Optionals
 ---
 
 As discussed in Data types, optionals can be `nil`.  The convention in Swift is to unwrap optionals through `if` and `guard` statements instead of traditional `nil` checks.  The two operators `?` and `!` are used to unwrap optionals.  The `!` operator forces the unwrap and will therefore crash if the value is actually `nil`.
 */
func testOptionalIf(with value: String?) -> String {
    if let val = value {
        return val
    }
    return "Nil Value"
}
testOptionalIf(with: "Hello")
testOptionalIf(with: nil)

func testOptionalGuard(with value: String?) -> String {
    guard let val = value else {
        return "Nil Value"
    }
    return val
}
testOptionalGuard(with: "Hello")
testOptionalGuard(with: nil)

//: [Next](@next)
