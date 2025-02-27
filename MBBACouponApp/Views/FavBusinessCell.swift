//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct FavBusinessCell: View {
    @State private var favBusinesses: [Business] = [
        Business(accName: "", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", imageUrl:  "garden-bowl", bilingStreet: "", billingCity: "", billingState: "", billingZipCode: "")
    ]
    var body: some View {
        HStack(spacing: 45) {
            ForEach(favBusinesses) { business in
                VStack {
                    Image(systemName:"")
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
    FavBusinessCell()
}
