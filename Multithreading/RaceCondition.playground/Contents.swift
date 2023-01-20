import UIKit

var accountBalance: Int = 5000
var lock  = NSLock()


struct Bank {
    
    let withDrawMethod:String
    
    func doTranscation(amount: Int) {
        lock.lock()
        if amount <= accountBalance {
            debugPrint("amount is sufficient proceed with transaction")
            Thread.sleep(forTimeInterval:Double.random(in: 0...4))
            accountBalance -= amount
            debugPrint("\(self.withDrawMethod): The amount with \(amount) is done")
            debugPrint(("\(self.withDrawMethod): Current Balance \(accountBalance)"))
            
        } else {
            debugPrint("Insufficient amount, cannot proceed with transaction")
        }
        lock.unlock()
    }
}

func raceCondition() {

 let queue = DispatchQueue(label:"WithdrawalQueue", attributes: .concurrent)
    queue.async {
        let netBanking = Bank(withDrawMethod: "NetBanking")
        netBanking.doTranscation(amount: 2000)
    }
    queue.async {
        let atmBanking = Bank(withDrawMethod: "ATM Machine")
        atmBanking.doTranscation(amount: 4000)
    }
}


func main() {
   raceCondition()
}
main()
