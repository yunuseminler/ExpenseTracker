//
//  Category.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct Categories: View {
    @State private var searchText: String = ""
    let names = ["Holly", "Josh", "Rhonda", "Ted"]

    var body: some View {
        NavigationStack {
            ZStack {
                RadiantBack(height: 0.25)
                ScrollView {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink {
                            Text(name)
                        } label: {
                            CategoriesRow().padding(.vertical, 5).foregroundColor(.black)
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Categories").font(.largeTitle)
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "plus.circle.fill").symbolRenderingMode(.palette).foregroundStyle(.white, .black).font(.largeTitle)
                            })
                        }.padding(10).padding(.top, 40)
                    }
                }
                .searchable(text: $searchText)
            }
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    Categories()
}
