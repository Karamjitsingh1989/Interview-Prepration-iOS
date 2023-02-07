//
//  ContentView.swift
//  BankActorDemo
//
//  Created by Karamjit Singh on 07/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var bankAccountVM = BankAccountViewModel(balance: 5000)
  //  let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var body: some View {
        VStack {
            Button {
                
              let currentBank = BankAccount(accountNum: 101, accountBalance: 50000)
              let otherBank  = BankAccount(accountNum: 102, accountBalance: 100)
                
                DispatchQueue.concurrentPerform(iterations: 5) { _ in
                    Task {
                        try? await currentBank.transferAmount(amount: 2000, toBeneficiaryBank: otherBank)
                    }
                }
                
                
//                Task {
//                   await bankAccountVM.withdrawalAmount(amount: 1000)
//                }
//               Task {
//                   await bankAccountVM.withdrawalAmount(amount: 500)
//                }
            } label: {
                Text("Withdraw Amount")
            }
            List(bankAccountVM.transaction, id: \.self) { value in
                Text(value)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
