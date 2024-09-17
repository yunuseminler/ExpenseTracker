//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Yunus Emre Eminler on 17.09.2024.
//

import SwiftUI

struct MainPage: View {
    @State var tabSelected = 0
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            Categories()
                .tabItem {
                    Image(systemName: "archivebox")
                    Text("Category")
                }
                .tag(1)
            
            Text("sa")
                .tabItem {
                    Image(systemName: "plus.viewfinder")
                }
                .tag(2)
            
            Text("sa")
                .tabItem {
                    Image(systemName: "message")
                    Text("Chart")
                }
                .tag(3)
            
            Text("sa")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.pink)
    }
}

#Preview {
    MainPage().environment(\.font, Font.custom("Nunito", size: 16))
}
