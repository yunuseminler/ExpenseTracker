//
//  OperationController.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 18.09.2024.
//

import CoreData
import Foundation

class OperationController {
    static let shared = OperationController()
    
    private init() {}
    
    private let context = PersistenceController.shared.container.viewContext
    
    public func createCategory(value: Double, title: String, date: Date,category: Category) {
        let ope = Operation(context: context)
        ope.value = value
        ope.title = title
        ope.date = date
        ope.category = category
        
        do {
            try context.save()
            print("Operation saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
    
    // Read
    func fetchAllOperations() -> [Operation] {
        let fetchRequest: NSFetchRequest<Operation> = Operation.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch Operations: \(error)")
            return []
        }
    }
}
