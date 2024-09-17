//
//  RadiantBack.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct RadiantBack: View {
    @State var height: CGFloat
    static let color0 = Color(.pink)

    static let color1 = Color(.white)

    let gradient = Gradient(colors: [color0, color1])

    var body: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: gradient,
                startPoint: .init(x: 0.50, y: 0.00),
                endPoint: .init(x: 0.50, y: height)
            ))
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RadiantBack(height: 0.75)
}
