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
            BusinessView()
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
