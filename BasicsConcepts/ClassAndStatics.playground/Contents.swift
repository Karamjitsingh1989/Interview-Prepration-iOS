import UIKit

/*
 
 Class vs statics
 
 static variable are declared as stored property where as class variable declared as computed property.
 
 
 
 */

class Person {
    
  static  var name: String = "Karamjit Singh"
    
  class var address: String  {
        return "Mohali"
    }
    
    static func printMyAddress(){
        
    }
    
    class func printMyRole(){
        
    }
}


class Employee: Person {
    
    /*
     Static function cannot be override and inherit
     it show compliation error
     
     override static func printMyAddress(){
            
    }
     Class method can be inerit
     */
    
    override class func printMyRole() {
        
    }
}


struct Person1 {
    
    static var name: String = "Karamjit Singh"
   
   /* static property allowed in struct not class properties
    class var address: String = "Chandigarh"
    */
}

protocol Person2 {
    
    static var name: String? { get set }
    
    static func updateName()
    /*
     class func updateAddress()
     class methods are only allowed within classes; use 'static' to declare a requirement fulfilled by either a static or class method
     */
}
