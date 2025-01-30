//
//  ContentView.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(.horizontal) {
            FavBusinessCell()
        }
        Spacer()
        
        NavigationStack {
            Text("Search \(searchText)")
        }
        .searchable(text: $searchText)
        
        TabView {
            Text("Search")
                .imageScale(.small)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Add Bussiness")
                .imageScale(.small)
                .tabItem {
                    Image(systemName: "plus.circle")
                }
            
            Text("Profile")
                .imageScale(.small)
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
