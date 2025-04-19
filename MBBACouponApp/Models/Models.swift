//
//  Models.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import Foundation
import SwiftUI
import SwiftData
import FirebaseFirestore

enum BusinessSearchToken: String, Codable, CaseIterable, Identifiable {
    case automotive = "Automotive"
    case construction = "Construction"
    case education = "Education"
    case financialInsurance = "Financial/Insurance"
    case healthCare = "Health Care"
    case hospitality = "Hospitality"
    case itTech = "IT/Technology"
    case landscaping = "Landscaping"
    case legal = "Legal"
    case realEstate = "Real Estate"
    case restaurant = "Restaurant"
    case retail = "Retail"
    case veterinary = "Veterinary"
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
            case .landscaping:
                return "tree.fill"
            case .legal:
                return "books.vertical.fill"
            case .realEstate:
                return "house.fill"
            case .restaurant:
                return "fork.knife.circle.fill"
            case .retail:
                return "cart.fill"
        case .veterinary:
            return "pawprint.fill"
            case .selfCare:
                return "figure.run.circle.fill"
        }
    }
    
    var tagColor: Color {
        switch self {
        case .automotive, .construction, .legal, .itTech, .landscaping, .education, .hospitality, .restaurant, .retail, .selfCare, .financialInsurance, .healthCare, .realEstate, .veterinary:
            return .black
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
    var billingStreet: String
    var billingCity: String
    var billingState: String // enum
    var billingZipCode: String
    var billingCountry: String?
    var imageUrl: String
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
    
    init(accName: String, memberStatus: MemberStatusType, subscriptionStatus: Bool, county: String, primaryIndustry: String, primaryEmail: String, billingStreet: String, billingCity: String, billingState: String, billingZipCode: String, billingCountry: String, imageUrl: String, businessCategory: BusinessSearchToken) {
        self.accName = accName
        self.membershipStatusRaw = memberStatus.rawValue
        self.subscriptionStatus = subscriptionStatus
        self.county = county
        self.primaryIndustry = primaryIndustry
        self.primaryEmail = primaryEmail
        self.billingStreet = billingStreet
        self.billingCity = billingCity
        self.billingState = billingState
        self.billingZipCode = billingZipCode
        self.billingCountry = billingCountry
        self.imageUrl = imageUrl
        self.businessCategoryRaw = businessCategory.rawValue
    }
}

@Model
class Person: Identifiable, Codable {
    var id = UUID()
    var surname: String
    var forename: String
    var salutation: String
    
    init(surname: String, forename: String, salutation: String) {
        self.surname = surname
        self.forename = forename
        self.salutation = salutation
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case surname
        case forename
        case salutation
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        surname = try container.decode(String.self, forKey: .surname)
        forename = try container.decode(String.self, forKey: .forename)
        salutation = try container.decode(String.self, forKey: .salutation)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(surname, forKey: .surname)
        try container.encode(forename, forKey: .forename)
        try container.encode(salutation, forKey: .salutation)
    }
}

@Model
final class Coupon: Identifiable, Codable {
    var firestoreId: String?  // Stored property to hold Firestore document ID
    var status: String
    var expiryDate: String
    var person: Person?
    var title: String
    var content: String
    var businessName: String {
        didSet {
            // Trim whitespace and ensure it's not empty
            let trimmed = businessName.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty {
                businessName = "Unknown Business"
            }
        }
    }
    
    // Custom initializer for your class
    init(firestoreId: String? = nil, status: String, expiryDate: String, person: Person? = nil, title: String = "", content: String = "", businessName: String = "") {
        self.firestoreId = firestoreId
        self.status = status
        self.expiryDate = expiryDate
        self.person = person
        self.title = title
        self.content = content
        self.businessName = businessName.isEmpty ? "Unknown Business" : businessName
    }
    
    // Coding keys to match Firestore document fields
    enum CodingKeys: String, CodingKey {
        case firestoreId = "id"
        case status
        case expiryDate
        case person
        case title
        case content
        case businessName
    }
    
    // Required initializer for decoding from Firestore
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firestoreId = try container.decodeIfPresent(String.self, forKey: .firestoreId)
        status = try container.decode(String.self, forKey: .status)
        expiryDate = try container.decode(String.self, forKey: .expiryDate)
        person = try container.decodeIfPresent(Person.self, forKey: .person)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        businessName = try container.decode(String.self, forKey: .businessName)
    }
    
    // Encoding to Firestore
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firestoreId, forKey: .firestoreId)
        try container.encode(status, forKey: .status)
        try container.encode(expiryDate, forKey: .expiryDate)
        try container.encodeIfPresent(person, forKey: .person)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(businessName, forKey: .businessName)
    }
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

import FirebaseFirestore

//struct Coupon: Identifiable, Codable {
//    @DocumentID var id: String?
//    var title: String
//    var content: String
//}
