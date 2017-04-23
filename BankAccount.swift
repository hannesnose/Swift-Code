

import UIKit

class BankAccount {
    var currentBalanceChecking: Float
    var currentBalanceSavings: Float
    var transaction: Float
    var transactionDescription: String
    
    
    
    init(currentBalanceChecking: Float, currentBalanceSavings: Float,transaction: Float, transactionDescription:String) {
        self.currentBalanceChecking = currentBalanceChecking
        self.transaction = transaction
        self.transactionDescription = transactionDescription
        self.currentBalanceSavings = currentBalanceSavings
    }
    
    //Making purchase with funds from checking account
    
    func withdrawalTransaction (transaction: Float, transactionDescription: String){
        
        if transaction <= currentBalanceChecking {
            let deductedAmount = currentBalanceChecking - transaction
            currentBalanceChecking = deductedAmount
            print("Item: \(transactionDescription). Amount: $\(transaction). You have $\(currentBalanceChecking) left in your checking account")
        } else {
            print("You have insufficient Funds")
            currentBalanceChecking
        }
        
    }
    // Prevent negative deposits
    
    func checkIfNumberIsNegative(input:Float) -> Float {
        if input < 0 {
            print("You can not have negative input. Please check deposit amount")
        }
        return input
    }
    
    // Depositing money into your checking account
    
    func depositFundsInChecking(currentCheckingBalance: Float, transaction: Float)->Float {
        
        let deposit = currentBalanceChecking + checkIfNumberIsNegative(input: transaction)
        currentBalanceChecking = deposit
        return currentBalanceChecking
    }
    
    // Depositing money into your savings account
    
    func depositFundsInSavings(currentSavingBalance: Float, transaction: Float)->Float {
        
        let deposit = currentBalanceSavings + checkIfNumberIsNegative(input: transaction)
        currentBalanceSavings = deposit
        return currentBalanceSavings
    }
    
    // Transferring money from checking account to savings account
    
    func transferFundstoSavings(currentCheckingBalance: Float, transaction: Float) -> Float{
        let transferFromCheckingtoSavings = currentBalanceChecking - transaction
        let transfer = -transferFromCheckingtoSavings + currentBalanceSavings
        currentBalanceSavings = currentBalanceSavings + transfer
        currentBalanceChecking  = transferFromCheckingtoSavings
        return currentBalanceSavings
    }
    // Transferring money from savings account to checking account
    
    func transferFundstoChecking(currentSavingsBalance: Float, transaction: Float) -> Float{
        let transferFromSavingstoChecking = currentBalanceSavings - transaction
        let transfer = -transferFromSavingstoChecking + currentBalanceChecking
        currentBalanceChecking = currentBalanceChecking + transfer
        currentBalanceSavings  = transferFromSavingstoChecking
        return currentBalanceChecking
    }
    
}










