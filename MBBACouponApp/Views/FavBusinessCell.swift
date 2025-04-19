//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct FavBusinessCell: View {
    let business: Business
    
    var body: some View {
        VStack {
            Group {
                if !business.imageUrl.isEmpty,
                   let url = URL(string: business.imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        Image(systemName: "building.2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                    }
                } else {
                    Image(systemName: "building.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                }
            }
            .background(Color(.systemGray6))
            .clipShape(Circle())
            
            Text(business.accName)
                .font(.caption)
                .fontWeight(.medium)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 120)
    }
}

#Preview {
    // Create a sample business for preview
    let sampleBusiness = Business(
        accName: "Sample Business",
        memberStatus: .premium,
        subscriptionStatus: true,
        county: "Sample County",
        primaryIndustry: "Sample Industry",
        primaryEmail: "sample@email.com",
        billingStreet: "123 Street",
        billingCity: "Sample City",
        billingState: "ST",
        billingZipCode: "12345",
        billingCountry: "USA",
        imageUrl: "",
        businessCategory: .retail
    )
    
    FavBusinessCell(business: sampleBusiness)
}
