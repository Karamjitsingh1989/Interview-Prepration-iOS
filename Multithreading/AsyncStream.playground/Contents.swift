import UIKit


class BitCoinPriceMonitor {
    
    var price: Double = 0.0
    var timer: Timer?
    var priceHandler: (Double) -> Void = { _ in }
    
    func startUpdate() {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getPrice), userInfo: nil, repeats: true)
        
    }
    @objc func getPrice(){
        priceHandler(Double.random(in: 10000...20000))
    }
    
    func stopUpdating(){
        timer?.invalidate()
    }
}
/*
let bitCoinPriceMonitor = BitCoinPriceMonitor()
bitCoinPriceMonitor.priceHandler = {
    print($0)
}

bitCoinPriceMonitor.startUpdate()
*/


let bitCoinStream =  AsyncStream(Double.self) { continuation in
    
    let bitCoinPriceMonitor = BitCoinPriceMonitor()
    bitCoinPriceMonitor.priceHandler = {
        continuation.yield($0)
    }
    bitCoinPriceMonitor.startUpdate()
}

Task {
    for try await bitCoinPrice in bitCoinStream {
        print(bitCoinPrice)
    }
}
