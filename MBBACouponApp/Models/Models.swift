//
//  Models.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import Foundation
import SwiftUI
import SwiftData

enum BusinessSearchToken: String, Codable, CaseIterable, Identifiable {
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
    case selfCare = "Self Care"
    
    var icon: String {
        switch self {
            case .automotive:
                return "car.fill"
            case .construction:
                return "hammer.fill"
            case .education:
                return "graduationcap.fill"
            case .financialInsurance:
                return "dollarsign.circle.fill"
            case .healthCare:
                return "cross.circle.fill"
            case .hospitality:
                return "house.lodge.circle"
            case .itTech:
                return "wrench.and.screwdriver.fill"
            case .legal:
                return "books.vertical.fill"
            case .realEstate:
                return "house.fill"
            case .restaurant:
                return "fork.knife.circle.fill"
            case .retail:
                return "cart.fill"
            case .selfCare:
                return "figure.run.circle.fill"
        }
    }
    
    var tagColor: Color {
        switch self {
        case .automotive, .construction, .legal, .itTech:
            return .black
        case .education, .hospitality, .restaurant, .retail, .selfCare:
            return .blue
        case .financialInsurance, .healthCare, .realEstate:
            return .green
        }
    
    }
    
    var id: Self { self }
    
}

private var businessCategory: BusinessSearchToken.RawValue = BusinessSearchToken.automotive.rawValue

enum MemberStatusType: String, Codable, CaseIterable, Identifiable {
    case premium = "Premium"
    case nonPremium = "Non-Premium"
    
    var id: Self { self }
}


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
    var subscriptionStatus: Bool // (live/not live)
    var county: String // Enum of County
    var primaryIndustry: String // Industry type:
    var primaryEmail: String
    var isFavorite: Bool
//    var address: Address
//    var imageUrl: UIImage
    private var businessCategoryRaw: BusinessSearchToken.RawValue = BusinessSearchToken.automotive.rawValue
    private var membershipStatusRaw: MemberStatusType.RawValue = MemberStatusType.premium.rawValue
    
    var businessCategory: BusinessSearchToken {
        get { .init(rawValue: businessCategoryRaw) ?? .automotive}
        set { businessCategoryRaw = newValue.rawValue }
    }
    
    var membershipStatus: MemberStatusType {
        get { .init(rawValue: membershipStatusRaw) ?? .premium }
        set { membershipStatusRaw = newValue.rawValue }
    }
    
    init(accName: String, memberStatus: MemberStatusType, subscriptionStatus: Bool, county: String, primaryIndustry: String, primaryEmail: String, isFavorite: Bool, /*address: Address, imageUrl: UIImage,*/ businessCategory: BusinessSearchToken) {
        self.accName = accName
        self.membershipStatusRaw = memberStatus.rawValue
        self.subscriptionStatus = subscriptionStatus
        self.county = county
        self.primaryIndustry = primaryIndustry
        self.primaryEmail = primaryEmail
        self.isFavorite = isFavorite
//        self.address = address
//        self.imageUrl = imageUrl
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
    var businessCategoryToken: BusinessCategoryToken?
    var membershipStatusToken: MemberStatusToken?
}

struct BusinessCategoryToken: Identifiable {
    var id: String { name }
    var name: String
    var businessSearchToken: BusinessSearchToken
}

struct MemberStatusToken: Identifiable {
    var id: String { name }
    var name: String
}
