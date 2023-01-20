import UIKit

struct OperationQueueDemo {
   
  func  performTask(){
       
       let blockOperation = BlockOperation()
       
       blockOperation.addExecutionBlock {
           print("perform Operation:1")
       }
       
       blockOperation.addExecutionBlock {
           print("perform Operation:2")
       }
       
       blockOperation.addExecutionBlock {
           print("perform Operation:3")
       }
       
       blockOperation.addExecutionBlock {
           print("perform Operation:4")
       }
       
      
      let blockOperation2 = BlockOperation()
      blockOperation2.addExecutionBlock {
          print("perform 2 Operation:1")
      }
      blockOperation2.addExecutionBlock {
          print("perform 2 Operation:2")
      }
      
      blockOperation2.addExecutionBlock {
          print("perform 2 Operation:3")
      }
      // blockOperation.start()
      
      let operationQueue = OperationQueue()
      operationQueue.addOperations([blockOperation,blockOperation2], waitUntilFinished: true)
      
   }
}

func main() {
    let operationQueue = OperationQueueDemo()
    operationQueue.performTask()
}

main()

