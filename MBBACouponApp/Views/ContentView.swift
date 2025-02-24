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
            
            HStack(spacing: 45) {
                ForEach(1..<21) { index in
                    Text("Business \(index)")
                }
                .frame(width: 100, height: 100)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.circle)
            }
            
            HStack(spacing: 57) {
                ForEach(1..<21) { index in
                    Text("Business \(index)")
                }
            }
            .padding()
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
