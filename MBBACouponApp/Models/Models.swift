//
//  Models.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import Foundation
import SwiftUI
import SwiftData

enum BusinessCategory: String, Codable, CaseIterable, Identifiable {
    case automotive = "Automotive"
    case construction = "Construction"
    case education = "Education"
    case financialInsurance = "Financial/Insurance"
    case healthCare = "Health Care"
    case hospitality = "Hospitality"
    case itTech = "IT/Technology"
    case legal = "Legal"
    case realEstate = "Real Estate"
    case restaurant = "Restaurant"
    case retail = "Retail"
    case selfCare = "Self-care"
    
    var id: Self { self }
    
}

private var businessCategory: BusinessCategory.RawValue = BusinessCategory.automotive.rawValue


struct User: Identifiable {
    var id = UUID()
    var username: String
    var password: String
    var favBusiness: [Business]?
    var coupons: [Coupon]
    var isBusinessOwner: Bool
    var ownedBusiness: Business? // if the user is a business owner
}

struct Address: Identifiable {
    var id = UUID()
    var bilingStreet: String
    var billingCity: String
    var billingState: String // enum
    var billingZipCode: String
    var bilingCountry: String?
}

@Model
class Business: Identifiable /*, Codable*/ {
    var id: String { accName }
    var accName: String // business name
    var memberStatus: String // Maybe Custom Type:
    var subscriptionStatus: Bool // (live/not live)
    var county: String // Enum of County
    var primaryIndustry: String // Industry type:
    var primaryEmail: String
    var address: Address
    var imageUrl: UIImage
    private var businessCategoryRaw: BusinessCategory.RawValue = BusinessCategory.automotive.rawValue
    
    var businessCategory: BusinessCategory {
        get{ .init(rawValue: businessCategoryRaw) ?? .automotive}
        set{ businessCategoryRaw = newValue.rawValue }
    }
    
    init(accName: String, memberStatus: String, subscriptionStatus: Bool, county: String, primaryIndustry: String, primaryEmail: String, address: Address, imageUrl: UIImage, businessCategory: BusinessCategory) {
        self.accName = accName
        self.memberStatus = memberStatus
        self.subscriptionStatus = subscriptionStatus
        self.county = county
        self.primaryIndustry = primaryIndustry
        self.primaryEmail = primaryEmail
        self.address = address
        self.imageUrl = imageUrl
        self.businessCategoryRaw = businessCategory.rawValue
    }
}

// Person that has the Coupon (for PassKit API)
struct Person: Identifiable {
    var id = UUID()
    var surname: String
    var forename: String
    var salutation: String
}

// PassKit API:
struct Coupon: Identifiable /*, Codable*/ {
    var id = UUID()
    var status: String
    var expiryDate: String
    var person: Person
}

struct Token: Identifiable {
    var id: String { name }
    var name: String
    var businessCategory: BusinessCategoryToken?
}

struct BusinessCategoryToken: Identifiable {
    var id: String { name }
    var name: String
}
