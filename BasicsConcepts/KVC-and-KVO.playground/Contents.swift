import UIKit

/*
 ****************
     KVC
 ***************
 Key Vaue Coding is the mechanism for accessing the object properties indirectly, using string to indentify properties, rather than invocation of an accessor method or accessing them directly through variable
 
 ********
  KVO
 *******
 KVO is used to observe the value of properties when value is set.
 */



func main(){
    
   let personObject = Person(name: "Karamjit Singh")
    
   // KEY VALUE CODING
   let name = personObject.value(forKey: "name")
   print("Name: \(String(describing: name))")
    
    // KEY VALUE OBSERVER
    personObject.observe(\.name, options: [.old, .new]) { person, nameValue in
        print("Observed Old :\(nameValue.oldValue)")
        print("Observed New :\(nameValue.newValue)")
    }
    
    personObject.name = "Harsimrat"
}



class Person: NSObject {
    
    @objc dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}

main()
