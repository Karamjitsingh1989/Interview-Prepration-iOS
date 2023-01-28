import UIKit

/*
 
 EQUATABLE
 Types that conform to the Equatable protocol can be compared for equality using the equal-to-operator (==) or inequality using the not-equal-to operator (!=). Many types in swift conform to equitable protocol by default, like integer, string, double, float, array, double.
 
 COMPARABLE
 This protocol you can compare your custom type. The comparable protocol allows users to use the <, >, < =, and > = operators with conforming data types. Most of Swift’s built-in types support comparable like Int, Float, String, etc, out of the box, but if you want your type to conform to them
 
 Hashable
 It is another protocol that is inherited from equatable, by conforming to which you will get a hash value of integer type for a particular instance, any type that conforms to Hashable must also conform to Equatable.
 Hashable is one of Swift’s most important protocols, but it often goes unnoticed. You use it every time you create dictionaries or sets because those types create hashes of your data to figure out where it should be stored.
 Hashes are unique strings or numbers that are highly convenient when you want to identify or compare things rather than comparing the data in its original form.

 */

struct Student: Comparable {
   
    let studentName: String
    let rollNo:Int
    let section: String
    let marks: Int
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return  lhs.section == rhs.section
    }
   
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.marks < rhs.marks
    }
}

let student1 = Student(studentName: "Ravi", rollNo: 23, section: "A", marks: 85)
let student2 = Student(studentName: "Amit", rollNo: 26, section: "A", marks: 60)


if student1 == student2 {
    print("Student are from same section")
    
    if student1 > student2 {
        print("Student have the highest marks: \(student1)")
    }
    
}




