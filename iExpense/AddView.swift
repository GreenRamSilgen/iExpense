//
//  AddView.swift
//  iExpense
//
//  Created by Kiran Shrestha on 3/22/25.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext)  var modelContext
    
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Expense Type", selection: $type) {
                    Text("Personal").tag("Personal")
                    Text("Business").tag("Business")
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let expense = Expense(name: name, type: type, amount: amount)
                    modelContext.insert(expense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expense.self, configurations: config)
        return AddView().modelContainer(container)
    } catch {
        return Text("Something went wrong. Error: \(error)")
    }
}
