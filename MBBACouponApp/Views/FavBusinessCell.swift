//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct FavBusinessCell: View {
    @State private var favBusinesses = [
        Business(accName: "Construction & Co.", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .construction),
        Business(accName: "Self Care Inc.", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .selfCare),
        Business(accName: "Education R Us", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .education),
        Business(accName: "For the Future", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .education),
        Business(accName: "We Know Tocos", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .restaurant),
        Business(accName: "CarsRUs", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .automotive),
        Business(accName: "Fine Dining", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .itTech),
        Business(accName: "The Real Estate", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .realEstate)
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
