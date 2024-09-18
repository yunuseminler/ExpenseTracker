//
//  UserController.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 18.09.2024.
//

import CoreData
import Foundation

class UserController {
    static let shared = UserController()

    private init() {}

    private let context = PersistenceController.shared.container.viewContext

    public func createUser(_user: User) {
        let user = User(context: context)
        user.balance = _user.balance
        user.name = _user.name

        do {
            try context.save()
            print("User saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }

    // Read
    func fetchAllUsers() -> [User] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch Users: \(error)")
            return []
        }
    }

    func batchDeleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            let result = try context.execute(batchDeleteRequest) as? NSBatchDeleteResult
            print("Deleted \(result?.result ?? 0) people")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
