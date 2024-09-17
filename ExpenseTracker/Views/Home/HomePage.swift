//
//  HomePage.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack {
            RadiantBack(height: 0.55)
            VStack {
                VStack {
                    Text("Current Balance").font(.title3)
                    Text("$ 23.465").font(.largeTitle)
                    Text("September 2024").font(.headline)
                    HStack {
                        Image(systemName: "arrow.up.forward.app.fill").symbolRenderingMode(.palette).foregroundStyle(.green, .white)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("Income").font(.title3)
                            Text("$ 11.234")
                        }
                        Spacer()
                        Image(systemName: "arrow.down.app.fill").symbolRenderingMode(.palette).foregroundStyle(.red, .white)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("Expense").font(.title3)
                            Text("$ 11.234")
                        }
                    }.padding(20).font(.title2)
                }.font(.title2).padding()
                ScrollView {
                    ExpenseRow()
                    ExpenseRow()
                    ExpenseRow()
                    ExpenseRow()
                    ExpenseRow()
                    ExpenseRow()
                }.padding()

                Spacer()
            }.foregroundStyle(.white)
        }
    }
}

#Preview {
    HomePage()
}
