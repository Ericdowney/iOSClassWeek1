/*:
 # Introduction to iOS
 
 ## Swift Data Types
 ---
 - Variables are declared with the __`var`__ keyword.
 - Constants are declared with the __`let`__ keyword.
    - Constants __cannot__ be mutated onced intialized, but internal members of constants can be mutated as long as the constant is a reference type.  If the constant is a value type, however, internal members cannot be mutated.
 
 ## Common Data Types
 ---
 - String, Int, Bool, Double, Float
 */


var integer: Int = 1
var text: String = "Hello World!"
var boolean: Bool = true
var decimal: Double = 0.4
var otherDecimal: Float = 0.9

//: Math is hard.  These two cannot be added because they are two different types.  You must write an operator function for these two types.  Order also matters.  The left hand side and right hand side must be accounted for with separate functions one for (`Double` + `Float`) and one for (`Float` + `Double`)
func +(lhs: Double, rhs: Float) -> Double {
    return lhs + Double(rhs)
}

func +(lhs: Float, rhs: Double) -> Float {
    return lhs + Float(rhs)
}

decimal + otherDecimal
otherDecimal + decimal
integer + integer

/*:
 ## Dictionary + Array
 ---
 Dictionarys are a collection type that hold key value pairs of a specific types.
 
 Arrays are collections that hold a list of specific type
 
    - Both dictionary and array elements can be accessed through the subscript function, i.e.
 
    var array = [1, 2, 3]
    
    array[1] would return 2
 
 
 */

var array: [String] = ["A", "B", "C"]
var dictionary: [String: String] = ["A": "1", "B": "2", "C": "3"]

array[1]
dictionary["B"]


/*:
 ## Type Inference
 ---
 Swift has a powerful type inference system.  The type of a variable / constant can be inferred from right side of the equation.  Therefore, you can omit the type on the left side of the declaration.  However, there are priorities for certain types such as Double vs Floats.
 
    var text: String = "Hello World!"
 
    becomes
 
    var text = "Hello World!"
 
 */

var whatIsThis = 0.5
var thisIsAFloat: Float = 0.5

/*:
 `whatIsThis` has the exact same value as the explicit `Float` except the type is a `Double`
 - [Why does Swift Default to Double](@http://stackoverflow.com/questions/24264360/why-does-swift-default-to-double-floating-point)
 */
type(of: whatIsThis)
type(of: thisIsAFloat)


/*:
 ## Optionals
 ---
 In Swift, there is a concept called optional values.  Optionals allow a variable / constant to be `nil`.  If a variable / constant is not optional, it cannot have a value of nil.  This allows a high level of safety when working with variables / constants.  If any value could be nil, the code would be cluttered with nil checks or potential crashes.  Swift cleans this up by guaranteeing non-nil values or the optional state.
 */

//: This is not allowed since the type is a String
//var text: String = nil

//: To declare a variable as optional, use the `?` operator

var optionalText1: Optional<String> = nil
var optionalText2: String? = "Hello"

/*:
 Once a value is optional, you can still call methods and access properties, however, there two operators that must be used `?` or `!`.
 
 The `!` operator forces the value to be unwrapped.  This would make the value non-optional, if it is present, however, it will crash if the value is nil.
 
 The `?` operator will ask to unwrap the value.  This keeps the line safe from crashes, but will generate cyclomatic complexity and keep any subsequent values as optionals.  There is a concept known as optional chaining where multiple method calls can be strung together with the `?` operator.  At every `?` operator, it asks if there is a value, and if so, it continues, otherwise it bails out safely.
 
 */
let optionalLowercase1 = optionalText1?.lowercased()
optionalLowercase1

let optionalLowercase2 = optionalText2?.lowercased()
optionalLowercase2


//: [Next](@next)
