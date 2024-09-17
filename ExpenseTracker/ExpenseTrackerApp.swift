//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage().environment(\.font, Font.custom("Poppins", size: 16))
        }
    }
}
