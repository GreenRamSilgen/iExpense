//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Kiran Shrestha on 3/14/25.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
