//
//  ExpenseView.swift
//  iExpense
//
//  Created by Kiran Shrestha on 5/23/25.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses : [Expense]
    
    
    var body: some View {
        List{
            ForEach(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        Text(expense.type)
                    }
                    Spacer()
                    Text(expense.amount, format: .currency(code: "USD"))
                }
            }
            .onDelete(perform: removeItems )
        }
    }
    
    init(filterBy: String, sortType: [SortDescriptor<Expense>]) {
        _expenses = Query(filter: #Predicate<Expense> { expense in
            expense.type == filterBy || filterBy == "All"
        }, sort: sortType)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expenseToRemove = expenses[offset]
            modelContext.delete(expenseToRemove)
        }
    }
}

#Preview {
    ExpenseView(filterBy: "Personal", sortType: [SortDescriptor(\Expense.name)])
        .modelContainer(for: Expense.self)
}
