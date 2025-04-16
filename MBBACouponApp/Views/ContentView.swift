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
    @State private var settingsSheet = false
    var body: some View {
        Button(action: {
            settingsSheet.toggle()
        }) {
            Image(systemName: "gearshape.fill")
                .imageScale(.large)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
        
        .sheet(isPresented: $settingsSheet) {
            SettingsView()
        }
        ScrollView(.horizontal) {
            FavBusinessCell()
                .padding()
        }
        Spacer()
        NavigationStack {
            BusinessView(bm: bm)
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
