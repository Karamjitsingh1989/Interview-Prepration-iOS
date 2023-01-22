import Foundation

class WorkItemDemo {
    var number : Int = 25
    
    func callWorkItem() {
        let workIem = DispatchWorkItem { [weak self] in
            self?.number += 1
        }
        workIem.notify(queue: .main) {
            print("The number calculation is finished \(self.number)")
        }
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workIem)
    }
    
    func printTable(tableNumber: Int){
        
        var workItem:DispatchWorkItem?
        
        workItem  = DispatchWorkItem {
            for i in 1..<11 {
                
               if let workItem = workItem, workItem.isCancelled  {
                    print("The table upto \(i-1) is printed, After that printing is cancelled")
                    break
                }
                debugPrint("\(tableNumber) X \(i) = \(tableNumber*i)")
                sleep(1)
            }
        
        }
        
        workItem?.notify(queue: .main) {
            print("The table is printed ")
        }
        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)
        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            workItem?.cancel()
        }
    }
}

let workItemDemo = WorkItemDemo()
//workItemDemo.callWorkItem()
workItemDemo.printTable(tableNumber: 2)
