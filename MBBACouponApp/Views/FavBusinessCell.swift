//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct FavBusinessCell: View {
    var bm = BusinessManager()
    var body: some View {
        List {
            ForEach(bm.favoriteBusinesses) { business in
                VStack {
                    Image(systemName: "")
                        .frame(width: 100, height: 100)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(.circle)
                    Text(business.accName)
                }
        }
    }
        .padding()
    }
}

#Preview {
    let preview = PreviewContainer([Business.self])
    return FavBusinessCell().modelContainer(preview.container)
}
