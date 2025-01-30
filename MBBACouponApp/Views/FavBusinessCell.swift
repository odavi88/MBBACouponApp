//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct FavBusinessCell: View {
    @State private var favBusinesses = [
        Business(accName: "Business 1", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 2", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 3", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 4", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 5", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 6", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 7", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage()),
        Business(accName: "Business 8", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage())
    ]
    var body: some View {
        HStack(spacing: 45) {
            ForEach(favBusinesses) { business in
                VStack {
                    Image(uiImage: business.imageUrl)
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
