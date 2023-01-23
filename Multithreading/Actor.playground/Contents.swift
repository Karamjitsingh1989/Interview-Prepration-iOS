import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/* ***********************************
                ACTOR
   ***********************************
 
 What is difference Between Class and Actor ?
 class can be inheritance but actor cannot be inherit
 actor perform to a protocol
 
 MainActor
 A singleton actor whose executor is equivalent to the main dispatch queue.
 
 
 
What is data race different from a race condition?
 
 What are Data Races?
 
 Before we dive into the sanitizer, we first need to know what we’re actually looking for. We’re going to fix something that is called a Data Race.

 Data races occur when the same memory is accessed from multiple threads without synchronization, and at least one access is a write. Data Races can lead to several issues:


 
 As a Data Race is unpredictable, it can be inconsistently occurring when testing your app.
 You might have a crash on startup that is not occurring again the second time you start your app.
 If this is the case, you might be dealing with a Data Race.
 
 Data Race
 1. Multiple threads access shared resource or shared memory location in a concurrent environment
 2. Without any locks or checks
 3. Modify the shared resource or shared memory location
 
 Impact to shared resource due to DATA RACE.
 -Unpredictable behavior
 -Memory corruption
 -Flaky tests
 -Weird crashes
 
 
*/

/* *******************************
         DISPATCH BARRIER
   *******************************
*/

class PhoneStocks {
    
    var stocks = ["Samsung phone 1", "iPhone 13", "iPhone 14", "One Plus"]
    let barrier = DispatchQueue(label: "barrier")
    
    func getPhonesAvailable(){
        barrier.sync {
            print("All smart phones are available: \(self.stocks)")
        }
    }
    
    func purchasePhone(phoneName: String) {
        
        barrier.async(flags: .barrier) {
            guard let index = self.stocks.firstIndex(of: phoneName) else {
                print("The phone is not available")
                return
            }
            self.stocks.remove(at: index)
            print("The new phone is purchased successfully \(phoneName)")
        }
       
    }
}

let phoneStocksObj = PhoneStocks()
let queue = DispatchQueue(label: "RaceDataDemo", attributes: .concurrent)

queue.async {
    phoneStocksObj.purchasePhone(phoneName: "iPhone 13")
}
queue.async {
    phoneStocksObj.getPhonesAvailable()
}



