//
//  ContentView.swift
//  iExpense
//
//  Created by Kiran Shrestha on 3/14/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingAddExpense = false
    @State private var filterType = "All"
    @Query() var expenses : [Expense]
    
    @State var sortType = [
        SortDescriptor(\Expense.amount, order: .reverse)
    ]
    
    var body: some View {
        NavigationStack{
            ExpenseView(filterBy: filterType, sortType: sortType)
            .navigationTitle("iExpense")
            .toolbar {
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle"){
                    Picker("Filter", selection: $filterType) {
                        Text("All")
                            .tag("All")
                        Text("Personal")
                            .tag("Personal")
                        Text("Business")
                            .tag("Business")
                    }
                }

                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortType) {
                        Text("Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount, order: .reverse),
                                SortDescriptor(\Expense.type)
                            ])
                        Text("Amount")
                            .tag([
                                SortDescriptor(\Expense.amount, order: .reverse),
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.type)
                            ])
                        if filterType == "All" {
                            Text("Type")
                                .tag([
                                    SortDescriptor(\Expense.type),
                                    SortDescriptor(\Expense.name),
                                    SortDescriptor(\Expense.amount, order: .reverse)
                                ])
                        }
                    }
                }
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
    

}

#Preview {
    ContentView()
}
