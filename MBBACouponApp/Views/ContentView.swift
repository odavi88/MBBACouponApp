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
                ForEach(bm.filteredBusinesses) { business in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(business.accName)
                                .font(.title2)
                            Spacer()
                            Button {
                                bm.toggleFavorite(selectedBusiness: business)
                            } label: {
                                Image(systemName: bm.isFavorite(selectedBusiness: business) ? "heart.fill" : "heart")
                                    .foregroundStyle(bm.isFavorite(selectedBusiness: business) ? .red : .gray)
                                    .font(.title3)
                            }.buttonStyle(.borderless)
                        }
                        Text("Category: \(business.businessCategory.rawValue)").font(.subheadline)
                        Text("Member Status: \(business.membershipStatus.rawValue)").font(.caption)
                        Text(business.primaryEmail).font(.caption)
                    }
                }
            }
        }
        .searchable(text: $bm.searchText, tokens: $bm.selectedTokens, suggestedTokens: $bm.suggestedTokens) { token in
                Label {
                    Text("\(Image(systemName: "\(token.businessCategoryToken?.businessSearchToken.icon ?? "❓")"))  \(token.name)")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(token.businessCategoryToken?.businessSearchToken.tagColor)
                    .clipShape(Capsule())
                } icon: {
                            
                }
        }
    }
}

#Preview {
    let preview = PreviewContainer([Business.self])
    return ContentView().modelContainer(preview.container)
}
