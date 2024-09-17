//
//  ColorHexExtension.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        if hexColor.count == 6 {
            hexColor += "FF" // Opaklık
        }

        if let int = Int(hexColor, radix: 16) {
            let red = Double((int >> 24) & 0xFF) / 255.0
            let green = Double((int >> 16) & 0xFF) / 255.0
            let blue = Double((int >> 8) & 0xFF) / 255.0
            let alpha = Double(int & 0xFF) / 255.0

            self.init(red: red, green: green, blue: blue, opacity: alpha)
        } else {
            self.init(red: 0, green: 0, blue: 0) // Varsayılan renk
        }
    }
}
