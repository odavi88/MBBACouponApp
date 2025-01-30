//
//  Models.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import Foundation

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

struct Business: Identifiable /*, Codable*/ {
    var id = UUID()
    var accName: String // business name
    var memberStatus: String // Maybe Custom Type:
    var subscriptionStatus: Bool // (live/not live)
    var county: String // Enum of County
    var primaryIndustry: String // Industry type:
    var primaryEmail: String
    var address: Address
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

