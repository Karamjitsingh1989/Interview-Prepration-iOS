//
//  BankViewModel.swift
//  BankActorDemo
//
//  Created by Karamjit Singh on 07/02/23.
//

import Foundation

enum BankError: Error {
    case lowBalance
    case BadURL
    
}




actor BankAccount {
    
    
    private var accountBalance: Double
    
    private var accountNumber: Int
    
    private(set) var transaction: [String] = []
    
    init(accountNum: Int, accountBalance: Double) {
        self.accountBalance = accountBalance
        self.accountNumber = accountNum
    }
    
    func getAccountBalance() ->Double {
        return accountBalance
    }
    
    func depositMoney(amount: Double) {
        
        accountBalance += amount
    }
    
    func transferAmount(amount: Double, toBeneficiaryBank other: BankAccount) async throws{
        
        if amount > accountBalance {
            throw BankError.lowBalance
        }
        
        accountBalance -= amount
        await other.depositMoney(amount: amount)
        
        print("Current Bank account Balance: \(accountBalance) and Other Bank Account:\(await other.accountBalance)")
    }
    
    
    
    func withdrawalAmount(amount: Double) {
        
        if accountBalance > amount {
            
            let proccessingTime = UInt32.random(in: 0...4)
            print("Withdraw amount: \(amount) and Processing Time:\(proccessingTime) seconds")
            transaction.append("Withdraw amount: \(amount) and Processing Time:\(proccessingTime) seconds")
            sleep(proccessingTime)
            self.accountBalance -= amount
            transaction.append("Balance: \(accountBalance)")
        }
    }
    
    
    
    
}
@MainActor
class BankAccountViewModel: ObservableObject {
    
    private var bankAccount: BankAccount
    @Published var currentBalance: Double?
    @Published var transaction: [String] = []
    
    init(balance: Double) {
        self.bankAccount = BankAccount(accountNum: 101, accountBalance: balance)
    }
    
    func withdrawalAmount(amount: Double) async {
       await bankAccount.withdrawalAmount(amount: amount)
          self.currentBalance = await self.bankAccount.getAccountBalance()
         self.transaction = await self.bankAccount.transaction
    }
    
}
