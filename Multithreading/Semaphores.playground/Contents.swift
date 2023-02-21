import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//******************************************
//         SEMAPHORES
//*****************************************

protocol Banking {
    func withDrawalAmount(amount: Double) throws;
}

enum WithdrawalError: Error {
     case insufficientBalance
}

var accountBalance: Double = 50000

struct AtmMachine: Banking {
    
    func withDrawalAmount(amount: Double) throws {
        
        guard accountBalance > amount else { throw
            WithdrawalError.insufficientBalance
        }
        Thread.sleep(forTimeInterval: Double.random(in: 1...4))
        accountBalance -= amount
    }
    func printMessage(){
        print("The amount from ATM Machine is withdrawal successfully, current Balance:\(accountBalance)")
    }
}

struct NetBanking: Banking {
    
    func withDrawalAmount(amount: Double) throws {
        
        guard accountBalance > amount else { throw
            WithdrawalError.insufficientBalance
        }
        Thread.sleep(forTimeInterval: Double.random(in: 1...4))
        accountBalance -= amount
    }
    
    func printMessage(){
        print("The amount from NetBanking is withdrawal successfully, current Balance:\(accountBalance)")
    }
}

let queue = DispatchQueue(label: "SemaphoresDemo", qos: .utility, attributes: .concurrent)

let semaphores = DispatchSemaphore(value: 1)
/*
queue.async {
    do {
        semaphores.wait()
        let atmMachine = AtmMachine()
        try atmMachine.withDrawalAmount(amount: 30000)
        atmMachine.printMessage()
        semaphores.signal()
        
    }
    catch WithdrawalError.insufficientBalance {
        semaphores.signal()
        print("The Bank withdrawal is failure. Insufficient Balance, Transaction cancelled")
    }
    catch {
        semaphores.signal()
        print("unknown Error")
    }
}

queue.async {
    do {
        semaphores.wait()
        let netBanking = NetBanking()
        try netBanking.withDrawalAmount(amount: 35000)
        netBanking.printMessage()
        semaphores.signal()
        
    }
    catch WithdrawalError.insufficientBalance {
        semaphores.signal()
        print("The Bank withdrawal is failure. Insufficient Balance, Transaction cancelled")
    }
    catch {
        semaphores.signal()
        print("unknown Error")
    }
}
*/
/* *********************************************************
     Priority Inversion with Dispatch Semaphores
   *********************************************************

     What is Priority Inversion ?
     Priority inversion is where a low priority thread blocks a high priority thread.
     
     Semaphores are good but you should also be aware about it's drawbacks
 */


let highPrioirty = DispatchQueue.global(qos: .userInitiated)
let lowPriority = DispatchQueue.global(qos: .utility)
let defaultPriority = DispatchQueue.global(qos: .default)

let semaphoresQueue = DispatchSemaphore(value: 1)

func printName(prorityQueue:DispatchQueue, name: String) {
    
    prorityQueue.async {
        semaphoresQueue.wait()
        for i in 1...10 {
            print("\(name) : \(i)")
        }
        semaphoresQueue.signal()
        
    }
}
/*  Uncomment the code for the execution
printName(prorityQueue: highPrioirty, name: "🚑")
printName(prorityQueue: lowPriority, name: "🚙")
printName(prorityQueue: defaultPriority, name: "🏎️")
*/

/* *********************************************************
              Deadlock with Dispatch Semaphores
   *********************************************************
*/


let highPriorityQueue1 = DispatchQueue.global(qos: .userInitiated)
let lowPriorityQueue2 = DispatchQueue.global(qos: .utility)

let semaphoresForHighPriority = DispatchSemaphore(value: 1)
let semaphoresForLowPriority = DispatchSemaphore(value: 1)

struct RequestResourceModel {
    let firstResource, secondResource, prioritySymbol: String
    let semaphores1, semaphores2: DispatchSemaphore
    let queue: DispatchQueue
}


func requestForResource(resource: String, semphores: DispatchSemaphore, prioritySymbol: String) {
    print("\(prioritySymbol) is waiting for resource \(resource)")
   // semphores.wait()
   
     // To Avoid the deadlock Condition we can use the request timeout
      semphores.wait(timeout: DispatchTime.now() + .seconds(5))
}

func prepareFoodItem(resourceModel: RequestResourceModel) {
    
    resourceModel.queue.async {
        requestForResource(resource: resourceModel.firstResource, semphores: resourceModel.semaphores1, prioritySymbol: resourceModel.prioritySymbol)
        for i in 0...10 {
            if i == 4 {
                requestForResource(resource: resourceModel.secondResource, semphores: resourceModel.semaphores2, prioritySymbol: resourceModel.prioritySymbol)
            }
            debugPrint("\(resourceModel.prioritySymbol): \(i)")
        }
        resourceModel.semaphores1.signal()
        resourceModel.semaphores2.signal()
    }
}

let requestObject1 = RequestResourceModel(firstResource: "PAN", secondResource: "OIL", prioritySymbol: "🍜", semaphores1: semaphoresForHighPriority, semaphores2: semaphoresForLowPriority, queue: highPriorityQueue1)
let requestObject2 = RequestResourceModel(firstResource: "OIL", secondResource: "PAN", prioritySymbol:  "🎂", semaphores1: semaphoresForLowPriority, semaphores2: semaphoresForHighPriority, queue: lowPriorityQueue2)

//Uncomment the code for execution

prepareFoodItem(resourceModel: requestObject1)
prepareFoodItem(resourceModel: requestObject2)





