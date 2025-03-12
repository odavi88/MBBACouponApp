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
            FavBusinessCell(bm: bm)
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
                                bm.favoriteBusiness(selectedBusiness: business)
                            } label: {
                                Image(systemName: business.isFavorite ? "heart.fill" : "heart")
                                    .foregroundStyle(business.isFavorite ? .red : .gray)
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
