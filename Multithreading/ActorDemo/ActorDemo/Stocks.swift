//
//  Stocks.swift
//  ActorDemo
//
//  Created by Harsimrat on 24/01/23.
//

import Foundation

actor Stocks {
    
    var phoneList = ["iphone 12","iphone x","iphone 13","iphone 14"]
    let barrier = DispatchQueue(label: "barrier")
    
    func getAllAvailablePhones(){
      //  barrier.sync {
            print("The Available Phone: \(phoneList)")
    //    }
        
    }
    
    func purchasePhone(phoneName: String){
        
       // barrier.async(flags: .barrier) {
            guard let index = self.phoneList.firstIndex(of: phoneName) else {
                print("\(phoneName) is out of stock")
                return
            }
            self.phoneList.remove(at: index)
            print("You have purchased \(phoneName) successfully")
     //  }
        
    }
}
