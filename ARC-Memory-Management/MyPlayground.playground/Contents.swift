import UIKit

class Employee {
    
   var employeeName: String?
   unowned var employeeProfile: Profile?
   
    
    init(_ name: String) {
        print("intialise function of Employee is called")
        self.employeeName = name
    }
    
    func printData() {
        print("Employee name: \(self.employeeName)")
    }
    
    deinit {
        print("deinit function of Employee is called")
    }
    
}

class Profile {
    
    var address: String
    var employee:Employee?
    
    init(_ address: String) {
        print("intialise function of Profile is called")
        self.address = address
    }
    
    func printData() {
        print("Address name: \(self.address)")
    }
    
    deinit {
        print("deinit function of Profile is called")
    }
}


// Create scope
var employee1:Employee?
var employee2:Employee?
/*
func intialseObjects() {
    
  let employee = Employee("Sonic")

      employee.printData()
      employee1 = employee /* will it  deinitalise or not  as we are assiging employee oject to other employee object*/
      employee2 = employee
      
      //employee2 = nil
     // employee1 = nil
    
}
intialseObjects()
*/


/* Strong Referance Cycle */

//How can identify strong reference cycles in Swift?
/* A strong reference cycle is when two instances of classes reference each other without the proper safeties.
 */

func strongRefereceCyle(){
    
    let employee = Employee("Karamjit")
    let profile = Profile("Chandigarh,India")
    
    employee.employeeProfile = profile
    profile.employee = employee
    
}

strongRefereceCyle()
 
// To Avoid the strong reference cycle we should use the [weak , unowned] while declaring properties
