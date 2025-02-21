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
            List {
                ForEach(filteredBusinesses) { business in
                    VStack(alignment: .leading) {
                        Text(business.accName)
                            .font(.title2)
                        Text("Category: \(business.businessCategory.rawValue)").font(.subheadline)
                        Text("Member Status: \(business.membershipStatus.rawValue)").font(.caption)
                        Text(business.primaryEmail).font(.caption)
                    }
                }
            }
        }
        .searchable(text: $bm.searchText, tokens: $bm.selectedTokens, suggestedTokens: $bm.allTokens) { token in
            Text(token.name)
        }
    }
    var filteredBusinesses: [Business] {
        bm.favBusinesses.filter { business in
            (bm.searchText.isEmpty || business.accName.localizedCaseInsensitiveContains(bm.searchText)) &&
            
            (bm.selectedTokens.isEmpty || bm.selectedTokens.contains { token in
                business.businessCategory.rawValue.localizedCaseInsensitiveContains(token.name)
            }) ||
            
            (bm.selectedTokens.isEmpty || bm.selectedTokens.contains { token in
                business.membershipStatus.rawValue.localizedCaseInsensitiveContains(token.name)
            })
            
        }
    }
}

#Preview {
    let preview = PreviewContainer([Business.self])
    return ContentView().modelContainer(preview.container)
}
