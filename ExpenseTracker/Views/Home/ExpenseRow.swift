//
//  ExpenseRow.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct ExpenseRow: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.white).frame(height: 85).shadow(color: .gray, radius: 2).overlay(
        HStack{
            Image(systemName: "figure.walk.circle.fill").symbolRenderingMode(.palette).foregroundStyle(.white, .green).font(.system(size: 50))
            VStack (alignment: .leading){
                Text("Fly to Paris")
                Text("May 12 at 9:30 pm").font(.subheadline).foregroundStyle(.gray)
            }
            Spacer()
            Text("- $523").foregroundStyle(.red)
        }.padding()
        )
    }
}

#Preview {
    ExpenseRow()
}
