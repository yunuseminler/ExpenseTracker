//
//  CategoriesRow.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct CategoriesRow: View {
    var body: some View {
        HStack{
            Image(systemName: "pill.circle").font(.largeTitle).symbolRenderingMode(.palette).foregroundStyle(.green)
            Text("Sağlık")
            Spacer()
            Image(systemName: "greaterthan").foregroundStyle(.gray).padding(.horizontal,10)
        }.padding(.horizontal).font(.title3)
    }
}

#Preview {
    CategoriesRow()
}
