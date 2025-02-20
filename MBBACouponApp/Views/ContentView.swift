//
//  ContentView.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var bm = BusinessManager()
    @Query var businesses: [Business]
    var body: some View {
        ScrollView(.horizontal) {
            FavBusinessCell()
        }
        Spacer()
        
        NavigationStack {
            Text("Search \(bm.searchText)")
        }
        .searchable(text: $bm.searchText)
        
        TabView {
            Text("Search")
                .imageScale(.small)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Add Business")
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
    var filteredBusinesses: [Business] {
        businesses.filter { business in
            (bm.searchText.isEmpty || business.accName.localizedCaseInsensitiveContains(bm.searchText)) &&
            
            (bm.selectedTokens.isEmpty || bm.selectedTokens.contains { token in
                business.businessCategory.rawValue.localizedCaseInsensitiveContains(token.name)
            })
        }
    }

    
}

#Preview {
    ContentView()
}
