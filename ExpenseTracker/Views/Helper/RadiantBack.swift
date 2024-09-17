//
//  RadiantBack.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct RadiantBack: View {
    static let color0 = Color(red: 85/255, green: 55/255, blue: 180/255)

    static let color1 = Color(red: 125/255, green: 77/255, blue: 190/255)

    let gradient = Gradient(colors: [color0, color1])

    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: gradient,
                startPoint: .init(x: 0.50, y: 0.00),
                endPoint: .init(x: 0.50, y: 1.00)
            ))
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RadiantBack()
}
