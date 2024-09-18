//
//  NewOperation.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 18.09.2024.
//

import SwiftUI

struct NewOperation: View {
    @State private var operationTitle: String = ""
    @State private var valueString: String = ""
    @State private var value: Double = 0.0
    @State private var isExpense: Bool = false
    @State private var selectedCategory: Category = .init()
    @State private var cats: [Category] = []
    @State private var showingAlert = false
    @State private var selectedFruit: String = "Apple"

    let fruits = ["Apple", "Banana", "Cherry", "Date"]
    var body: some View {
        Form {
            Section(header: Text("Operation Title")) {
                TextField(" Title", text: $operationTitle).autocorrectionDisabled()
                    .autocapitalization(.words)
            }
            Section(header: Text("Value")) {
                TextField("Value", text: $valueString)
                Toggle(isOn: $isExpense) {
                    Text("İs Expense")
                }
                .toggleStyle(SwitchToggleStyle(tint: .pink))
            }

            Section(header: Text("Category")) {
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(cats, id: \.self) { category in
                        HStack {
                            Image(systemName: category.icon ?? "pill")
                            Text(category.name ?? "Unknown").foregroundColor(.pink).tag(category).background(Color.blue)
                        }
                    }
                }.pickerStyle(MenuPickerStyle())
            }

            Section(header: Text("")) {
                Button(action: {
                    createCategory()
                }) {
                    Text("Add Category")
                }
                .disabled(operationTitle.isEmpty) // Boşsa butonu devre dışı bırak
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Success"), message: Text("Category added successfully."), dismissButton: .default(Text("OK")))
        }.onAppear {
            getCats()
        }
        .navigationTitle("Add Category")
    }

    private func getCats() {
        cats = CategoryController.shared.fetchAllCategories()
    }

    private func createCategory() {
        value = Double(valueString) ?? 0.0
        OperationController.shared.createCategory(value: isExpense ? -1 * value : value, title: operationTitle, date: Date(), category: selectedCategory)

        /*
         let newCategory = Category(context: viewContext)
         newCategory.id = UUID()
         newCategory.name = categoryName

         do {
             try viewContext.save()
             showingAlert = true
             categoryName = "" // Formu temizle
         } catch {
             // Hata yönetimi
             print("Failed to save category: \(error)")
         }*/
    }
}

#Preview {
    NewOperation()
}
