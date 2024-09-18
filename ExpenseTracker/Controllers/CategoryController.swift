//
//  CategoryController.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 18.09.2024.
//

import CoreData
import Foundation

class CategoryController {
    static let shared = CategoryController()

    private init() {}

    private let context = PersistenceController.shared.container.viewContext

    public func createCategory(_cat: Category) {
        let cat = Category(context: context)
        cat.color = _cat.color
        cat.name = _cat.name
        cat.icon = _cat.icon

        do {
            try context.save()
            print("Category saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }

    // Read
    func fetchAllCategories() -> [Category] {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch Categories: \(error)")
            return []
        }
    }
}
