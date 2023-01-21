import UIKit


//
struct OperationQueueDemo {
    
    func  performTask(){
        //MARK: Operation 1
        let blockOperation = BlockOperation()
        blockOperation.addExecutionBlock {
            print("perform Operation:1")
        }
        blockOperation.addExecutionBlock {
            print("perform Operation:2")
        }
       
        //MARK: Operation 2
        let blockOperation2 = BlockOperation()
        blockOperation.qualityOfService = .background
        blockOperation2.addExecutionBlock {
            print("perform 2 Operation:1")
        }
        blockOperation2.addExecutionBlock {
            print("perform 2 Operation:2")
        }
        
        // blockOperation.start() /* if you want to perform only block operation then using the start() function it will perform*/
        
        //*******************************************
         //  we can also add dependency that first
         //  operation need to perform first after that
         //  we can perform second operation by adding
         //  dependancy
        //*******************************************
     //   blockOperation2.addDependency(blockOperation)
        
        
        
        //Perform the operation using QperationQueue
        let operationQueue = OperationQueue()
        operationQueue.addOperations([blockOperation,blockOperation2], waitUntilFinished: false)
    }
}

func main() {
    let operationQueue = OperationQueueDemo()
    operationQueue.performTask()
}

main()

