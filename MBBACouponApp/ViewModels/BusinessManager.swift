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
        Business(accName: "Construction & Co.", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .construction),
        Business(accName: "Self Care Inc.", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .selfCare),
        Business(accName: "Education R Us", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .education),
        Business(accName: "For the Future", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .education),
        Business(accName: "We Know Tocos", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .restaurant),
        Business(accName: "Soul Food Central", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .restaurant),
        Business(accName: "Fine Dining", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .itTech),
        Business(accName: "The Real Estate", memberStatus: "", subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", address: Address(bilingStreet: "", billingCity: "", billingState: "", billingZipCode: ""), imageUrl: UIImage(), businessCategory: .realEstate)
    ]
    @Published var selectedTokens = [Token]()
    @Published var allTokens = [
        Token(name: "Automotive", businessCategory: BusinessCategoryToken(name: "Automotive")),
        Token(name: "Construction", businessCategory: BusinessCategoryToken(name: "Construction")),
        Token(name: "Education", businessCategory: BusinessCategoryToken(name: "Education")),
        Token(name: "Financial/Insurance", businessCategory: BusinessCategoryToken(name: "Financial/Insurance")),
        Token(name: "Health Care", businessCategory: BusinessCategoryToken(name: "Health Care")),
        Token(name: "Hospitality", businessCategory: BusinessCategoryToken(name: "Hospitality")),
        Token(name: "IT/Technology", businessCategory: BusinessCategoryToken(name: "IT/Technology")),
        Token(name: "Legal", businessCategory: BusinessCategoryToken(name: "Legal")),
        Token(name: "Real Estate", businessCategory: BusinessCategoryToken(name: "Real Estate")),
        Token(name: "Restaurant", businessCategory: BusinessCategoryToken(name: "Restaurant")),
        Token(name: "Retail", businessCategory: BusinessCategoryToken(name: "Retail")),
        Token(name: "Self-care", businessCategory: BusinessCategoryToken(name: "Self-care"))
    ]
}
