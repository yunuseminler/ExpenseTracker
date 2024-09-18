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
    
    public func createCategory(_ope: Operation) {
        let ope = Operation(context: context)
        ope.value = _ope.value
        ope.title = _ope.title
        ope.date = _ope.date
        
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
