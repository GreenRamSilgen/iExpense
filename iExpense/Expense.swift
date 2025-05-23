//
//  Expense.swift
//  iExpense
//
//  Created by Kiran Shrestha on 5/23/25.
//
import SwiftData
import Foundation

@Model
class Expense {
    var name: String = ""
    var type: String = "Personal"
    var amount: Double = 0.0
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
