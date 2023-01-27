import UIKit

// Closure are self containing blocks of functionality that can be passed around and used in your code Swift closure declaration

// Closure with Parameter
var message = {
    print("Hello World")
}
message()


// Closure with Parameter
var sayHello = {(name: String) in
    print("Hello \(name)")
}
sayHello("Karamjit Singh")


//Closure with Return Type
var addNumber = {(firstNumber: Int, secondNumber: Int)-> Int in
    return firstNumber + secondNumber
}
let result = addNumber(5,6)
print("\(result)")

// Closure with Function

func subNumber(firstNumber:Int, secondNumber: Int) {
    
    print("Sub: \(firstNumber - secondNumber)")
}
subNumber(firstNumber: 10, secondNumber: 5)

//*********************************************
 //     CAPTURING THE VALUE USING CLOSURE
//*********************************************

var name = "Karamit Singh"

let closure = { [name] in // with "in" / without "in"
    print("my name is \(name)")
}
name = "Harsimrat Singh"
closure()

/*
 In above case if we are using [] sqaure brackit then it reference value means its not creating copy but if [] with in is used then it will create the copy of property and that cannot be change even if we assign any to value it
 */



// Closure are reference type not value type

func excute() -> (Int) -> Int {
    var input = 0
    
    return { output in
       input = input + output
        return input
    }
}

let operation1 = excute()
let a = operation1(4)
let b = operation1(5)
let c = operation1(6)
let d = operation1(7)

print("Result:\(d)")
