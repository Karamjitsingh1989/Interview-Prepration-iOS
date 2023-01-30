import UIKit

struct Person {
    
    var name: String
    let age: Int // Constant value cannot be changed
    
}
/*
let person1 = Person(name: "Karamjit Singh", age: 30) In mutable Object in the case Structure
person1.name  = "Harsimrat"
person1.age = 32


var person2 = Person(name: "Amit", age: 35) // Mutating object
person2.name = "Harsimrat"
person2.age = 34

*/


class Employee {
    
    var name: String
    let age: Int // Constant value cannot be changed
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}
/*
let employee1 = Employee(name: "Karamjit Singh", age: 30) // Classes are mutable object
employee1.name  = "Harsimrat"
employee1.age = 32

var employee2 = Employee(name: "Amit", age: 35)
employee2.name = "Harsimrat"
employee2.age = 34

*/
