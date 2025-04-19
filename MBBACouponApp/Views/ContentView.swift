//
//  ContentView.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var bm = BusinessManager() // Your business manager
    @Query var businesses: [Business] // Query businesses data
    
    var body: some View {
        ScrollView(.horizontal) {
            if let firstBusiness = businesses.first {
                FavBusinessCell(business: firstBusiness)
            } else {
                Text("No businesses available")
                    .foregroundColor(.gray)
            }
        }
        Spacer()

        NavigationStack {
            BusinessView(bm: bm) // BusinessView should use bm
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: BusinessProfileView()) {
                            Image(systemName: "person.fill") // Icon for the button
                                .foregroundColor(.primary) // Customize color if needed
                        }
                    }
                }
        }
        .searchable(text: $bm.searchText, tokens: $bm.selectedTokens, suggestedTokens: $bm.suggestedTokens) { token in
            Label {
                Text("\(Image(systemName: "\(token.businessCategoryToken?.businessSearchToken.icon ?? "❓")"))  \(token.name)")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(token.businessCategoryToken?.businessSearchToken.tagColor ?? Color.gray)
                    .clipShape(Capsule())
            } icon: {
                // Optional icon here
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Business.self]) // Ensure the preview works with your data model
    return ContentView().modelContainer(preview.container)
}

