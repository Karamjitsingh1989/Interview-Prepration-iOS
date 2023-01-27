import UIKit
/*

 What are Non-Escaping closures?
 A closure is non-escaping closure by default in swift. With non-escaping means that a closure will not live or remain in memory once the function that calls this closure finish execution. So closure needs to be executed before its calling function finish execution
 
 
 What are Escaping closures?
 Escaping closure are exact opposite of non-escaping closures. Therefore, escaping closures will remain in memory after the function from which they gets called finish execution. You have seen escaping closures in case of API calls where code is running asynchronously and execution time is unknown.
 */

protocol PerformTask {
    typealias  completionBlock = ((Int)->Void)
    func addTwoNumbers(firstNumber: Int, secondNumber: Int, completion: completionBlock)
    func subTwoNumbers(firstNumber: Int, secondNumber: Int, completion:@escaping completionBlock)
}


class ClosureDemo: PerformTask {
    
    // By Default the closure has non-escaping
    
 // let perform addition for non-escaping and escaping for substration func
    
    func addTwoNumbers(firstNumber: Int, secondNumber: Int, completion: (Int) -> Void) {
        print("Step2")
        let result = firstNumber + secondNumber
        print("Step3")
        completion(result)
    }
    
    func subTwoNumbers(firstNumber: Int, secondNumber: Int, completion: @escaping completionBlock) {

        print("Step2")
        let result = firstNumber + secondNumber
        DispatchQueue.main.asyncAfter(deadline: .now() +  5) {
            print("Step3")
            completion(result)
        }
    }
    
    
    func performAddAction(){
        print("Step1")
        addTwoNumbers(firstNumber: 3, secondNumber: 5) { result in
            print("Addition Result: \(result)")
        }
        print("Final Step completed")
        
    }
    func performSubAction() {
       
        print("Step1")
        subTwoNumbers(firstNumber: 10, secondNumber: 3) { result in
            print("Substraction Result: \(result)")
        }
        print("Final Step completed")
        
    }
    
    
}


// OUTPUT for non-escaping closure
/*
Step1
Step2
Step3
Addition Result: 8
Final Step completed
 */


// OUTPUT for escaping closure
/*
 Step1
 Step2
 Final Step completed
 Step3
 Substraction Result: 13
 */


let closureObject = ClosureDemo()
closureObject.performAddAction()
closureObject.performSubAction()
