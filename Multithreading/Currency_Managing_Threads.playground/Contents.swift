import UIKit


class HeavyWork {
    
    static func runUserInitiatedTask(seconds: UInt32) {
        Task(priority: .userInitiated) {
            print("🥸 userInitiated: \(Date())")
            sleep(seconds)
        }
    }
    
    static func runUtilityTask(seconds: UInt32) {
        Task(priority: .utility) {
            print("☕️ utility: \(Date())")
            sleep(seconds)
        }
    }
    
    static func runBackgroundTask(seconds: UInt32) {
        Task(priority: .background) {
            print("⬇️ background: \(Date())")
            sleep(seconds)
        }
    }
}



// Execution:
for _ in 1...150 {
  HeavyWork.runUserInitiatedTask(seconds: 3)
}

for _ in 1...150 {
  HeavyWork.runUtilityTask(seconds: 3)
}

for _ in 1...150 {
  HeavyWork.runBackgroundTask(seconds: 3)
}
