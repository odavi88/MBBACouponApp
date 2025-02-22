//
//  BusinessManager.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 2/20/25.
//

import Foundation
import SwiftUI


class BusinessManager: ObservableObject {
    @Published var searchText = ""
    @Published var favBusinesses = [
        Business(accName: "Construction & Co.", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "", primaryEmail: "constructco@us.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .construction),
        Business(accName: "Self Care Inc.", memberStatus: .nonPremium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "", primaryEmail: "takecare@business.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .selfCare),
        Business(accName: "Education R Us", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "", primaryEmail: "teachSomething@edu.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .education),
        Business(accName: "For the Future", memberStatus: .nonPremium, subscriptionStatus: true, county: "Clinton", primaryIndustry: "", primaryEmail: "were4thefuture@edu.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .education),
        Business(accName: "We Know Tocos", memberStatus: .premium, subscriptionStatus: true, county: "Clinton", primaryIndustry: "", primaryEmail: "tacos80@comcast.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .restaurant),
        Business(accName: "Techie Tech Shop", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "", primaryEmail: "techietechshop@io.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .itTech),
        Business(accName: "Finance It Up", memberStatus: .nonPremium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "", primaryEmail: "financeitup@money.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .financialInsurance),
        Business(accName: "The Real Estate Inc.", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .realEstate),
        Business(accName: "We Build It Inc.", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "buildit@business.com", /*address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(),*/ businessCategory: .construction),
    ]
    @Published var selectedTokens = [Token]()
    @Published var suggestedTokens = [
        Token(name: "Premium", membershipStatusToken: MemberStatusToken(name: "Premium")),
        Token(name: "Non-Premium", membershipStatusToken: MemberStatusToken(name: "Non-Premium")),
        
        Token(name: "Automotive", businessCategoryToken: BusinessCategoryToken(name: "Automotive")),
        Token(name: "Construction", businessCategoryToken: BusinessCategoryToken(name: "Construction")),
    ]
    
    var filteredBusinesses: [Business] {
        favBusinesses.filter { business in
            (searchText.isEmpty || business.accName.localizedCaseInsensitiveContains(searchText)) &&
            
            (selectedTokens.isEmpty || selectedTokens.contains { token in
                business.businessCategory.rawValue.localizedCaseInsensitiveContains(token.name)
            }) ||
            
            (selectedTokens.isEmpty || selectedTokens.contains { token in
                business.membershipStatus.rawValue.localizedCaseInsensitiveContains(token.name)
            })
        }
    }
}
