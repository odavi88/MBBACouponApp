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
    @Published var mainFeedBusinesses: [Business] = [
        Business(accName: "Auto Masters", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "Automotive", primaryEmail: "contact@automasters.com", billingStreet: "123 Main St", billingCity: "Detroit", billingState: "MI", billingZipCode: "48201", billingCountry: "USA", imageUrl: "automotive", businessCategory: .automotive),
        
        Business(accName: "Green Earth Landscaping", memberStatus: .nonPremium, subscriptionStatus: true, county: "Oakland", primaryIndustry: "Landscaping", primaryEmail: "info@greenearth.com", billingStreet: "456 Oak Rd", billingCity: "Royal Oak", billingState: "MI", billingZipCode: "48067", billingCountry: "USA", imageUrl: "landscaping", businessCategory: .construction),
        
        Business(accName: "Tech Haven", memberStatus: .premium, subscriptionStatus: true, county: "Washtenaw", primaryIndustry: "Technology", primaryEmail: "support@techhaven.com", billingStreet: "789 Innovation Way", billingCity: "Ann Arbor", billingState: "MI", billingZipCode: "48104", billingCountry: "USA", imageUrl: "itTech", businessCategory: .itTech),
        
        Business(accName: "Smith & Sons Plumbing", memberStatus: .nonPremium, subscriptionStatus: false, county: "Macomb", primaryIndustry: "Plumbing", primaryEmail: "help@smithplumbing.com", billingStreet: "321 Pipe St", billingCity: "Sterling Heights", billingState: "MI", billingZipCode: "48310", billingCountry: "USA", imageUrl: "construction", businessCategory: .construction),
        
        Business(accName: "Detroit Coffee Co.", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "Food & Beverage", primaryEmail: "orders@detroitcoffee.com", billingStreet: "852 Brew Ave", billingCity: "Detroit", billingState: "MI", billingZipCode: "48226", billingCountry: "USA", imageUrl: "restaurant", businessCategory: .restaurant),
        
        Business(accName: "Modern Builders", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "Construction", primaryEmail: "contact@modernbuilders.com", billingStreet: "159 Build Ln", billingCity: "Detroit", billingState: "MI", billingZipCode: "48202", billingCountry: "USA", imageUrl: "construction", businessCategory: .construction),
        
        Business(accName: "Lilly's Spa", memberStatus: .premium, subscriptionStatus: false, county: "Oakland", primaryIndustry: "Self Care", primaryEmail: "info@lillys.com", billingStreet: "753 Workout Blvd", billingCity: "Troy", billingState: "MI", billingZipCode: "48084", billingCountry: "USA", imageUrl: "selfCare", businessCategory: .selfCare),
        
        Business(accName: "Luxury Auto Detailing", memberStatus: .nonPremium, subscriptionStatus: true, county: "Macomb", primaryIndustry: "Automotive", primaryEmail: "service@luxuryautodetailing.com", billingStreet: "369 Shine Dr", billingCity: "Warren", billingState: "MI", billingZipCode: "48088", billingCountry: "USA", imageUrl: "automotive", businessCategory: .automotive),
        
        Business(accName: "Bluewave Marketing", memberStatus: .premium, subscriptionStatus: true, county: "Washtenaw", primaryIndustry: "Marketing", primaryEmail: "hello@bluewave.com", billingStreet: "147 Digital Ln", billingCity: "Ann Arbor", billingState: "MI", billingZipCode: "48103", billingCountry: "USA", imageUrl: "realEstate", businessCategory: .realEstate),
        
        Business(accName: "PureTech Solutions", memberStatus: .premium, subscriptionStatus: false, county: "Wayne", primaryIndustry: "IT Services", primaryEmail: "support@puretech.com", billingStreet: "852 Network Ct", billingCity: "Detroit", billingState: "MI", billingZipCode: "48207", billingCountry: "USA", imageUrl: "itTech", businessCategory: .itTech),
        
        Business(accName: "The Art House", memberStatus: .premium, subscriptionStatus: true, county: "Oakland", primaryIndustry: "Art & Design", primaryEmail: "gallery@thearthouse.com", billingStreet: "654 Creative Blvd", billingCity: "Birmingham", billingState: "MI", billingZipCode: "48009", billingCountry: "USA", imageUrl: "education", businessCategory: .education),
        
        Business(accName: "Metro Movers", memberStatus: .nonPremium, subscriptionStatus: false, county: "Macomb", primaryIndustry: "Logistics", primaryEmail: "contact@metromovers.com", billingStreet: "321 Haul Rd", billingCity: "Clinton Township", billingState: "MI", billingZipCode: "48038", billingCountry: "USA", imageUrl: "hospitality", businessCategory: .hospitality),
        
        Business(accName: "EcoClean Services", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "Cleaning Services", primaryEmail: "support@ecoclean.com", billingStreet: "456 Green St", billingCity: "Dearborn", billingState: "MI", billingZipCode: "48124", billingCountry: "USA", imageUrl: "hospitality", businessCategory: .hospitality),
        
        Business(accName: "Pet Haven Veterinary", memberStatus: .premium, subscriptionStatus: true, county: "Oakland", primaryIndustry: "Veterinary", primaryEmail: "help@pethaven.com", billingStreet: "741 Paw Dr", billingCity: "Southfield", billingState: "MI", billingZipCode: "48076", billingCountry: "USA", imageUrl: "veterinary", businessCategory: .veterinary),
        
        Business(accName: "Gourmet Bites Catering", memberStatus: .premium, subscriptionStatus: true, county: "Washtenaw", primaryIndustry: "Catering", primaryEmail: "events@gourmetbites.com", billingStreet: "258 Feast St", billingCity: "Ypsilanti", billingState: "MI", billingZipCode: "48197", billingCountry: "USA", imageUrl: "restaurant", businessCategory: .restaurant),
        
        Business(accName: "Sunset Realty", memberStatus: .premium, subscriptionStatus: true, county: "Wayne", primaryIndustry: "Real Estate", primaryEmail: "info@sunsetrealty.com", billingStreet: "369 Dream Ave", billingCity: "Livonia", billingState: "MI", billingZipCode: "48150", billingCountry: "USA", imageUrl: "realEstate", businessCategory: .realEstate),
        
        Business(accName: "Elite Auto Sales", memberStatus: .premium, subscriptionStatus: false, county: "Macomb", primaryIndustry: "Automotive Sales", primaryEmail: "sales@eliteautos.com", billingStreet: "951 Fast Ln", billingCity: "Shelby Township", billingState: "MI", billingZipCode: "48315", billingCountry: "USA", imageUrl: "automotive", businessCategory: .automotive),
        
        Business(accName: "Evergreen Legal Services", memberStatus: .premium, subscriptionStatus: true, county: "Washtenaw", primaryIndustry: "Legal", primaryEmail: "law@evergreenlegal.com", billingStreet: "123 Justice Rd", billingCity: "Ann Arbor", billingState: "MI", billingZipCode: "48108", billingCountry: "USA", imageUrl: "legal", businessCategory: .legal),
        
        Business(accName: "Moonlight Events", memberStatus: .premium, subscriptionStatus: false, county: "Oakland", primaryIndustry: "Event Planning", primaryEmail: "info@moonlightevents.com", billingStreet: "951 Party St", billingCity: "Farmington Hills", billingState: "MI", billingZipCode: "48331", billingCountry: "USA", imageUrl: "hospitality", businessCategory: .hospitality)
    ]

    @Published var favBusinesses: [Business] = []
    @Published var selectedTokens = [Token]()
    @Published var suggestedTokens = [
        Token(name: "Automotive", businessCategoryToken: BusinessCategoryToken(name: "Automotive", businessSearchToken: .automotive)),
        Token(name: "Construction", businessCategoryToken: BusinessCategoryToken(name: "Construction", businessSearchToken: .construction)),
        Token(name: "Education", businessCategoryToken: BusinessCategoryToken(name: "Education", businessSearchToken: .education)),
        Token(name: "Financial/Insurance", businessCategoryToken: BusinessCategoryToken(name: "Financial/Insurance", businessSearchToken: .financialInsurance)),
        Token(name: "Health Care", businessCategoryToken: BusinessCategoryToken(name: "Health Care", businessSearchToken: .healthCare)),
        Token(name: "Hospitality", businessCategoryToken: BusinessCategoryToken(name: "Hospitality", businessSearchToken: .hospitality)),
        Token(name: "IT/Tech", businessCategoryToken: BusinessCategoryToken(name: "IT/Tech", businessSearchToken: .itTech)),
        Token(name: "Landscaping", businessCategoryToken: BusinessCategoryToken(name: "Landscaping", businessSearchToken: .landscaping)),
        Token(name: "Legal", businessCategoryToken: BusinessCategoryToken(name: "Legal", businessSearchToken: .legal)),
        Token(name: "Real Estate", businessCategoryToken: BusinessCategoryToken(name: "Real Estate", businessSearchToken: .realEstate)),
        Token(name: "Restaurant", businessCategoryToken: BusinessCategoryToken(name: "Restaurant", businessSearchToken: .restaurant)),
        Token(name: "Retail", businessCategoryToken: BusinessCategoryToken(name: "Retail", businessSearchToken: .retail)),
        Token(name: "Veterinary", businessCategoryToken: BusinessCategoryToken(name: "Veterinary", businessSearchToken: .veterinary)),
        Token(name: "Self Care", businessCategoryToken: BusinessCategoryToken(name: "Self Care", businessSearchToken: .selfCare))
    ]
    
    var filteredBusinesses: [Business] {
        mainFeedBusinesses.filter { business in
            (searchText.isEmpty || business.accName.localizedCaseInsensitiveContains(searchText)) &&
            
            (selectedTokens.isEmpty || selectedTokens.contains { token in
                business.businessCategory.rawValue.localizedCaseInsensitiveContains(token.name)
            })
        }
    }
    
    //   MARK: Function that appends a favorited business into the favBusinesses array:
    func favoriteBusiness() {
        let business = Business.init(accName: "", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", billingStreet: "", billingCity: "", billingState: "", billingZipCode: "", billingCountry: "", imageUrl: "", businessCategory: BusinessSearchToken.automotive)
        favBusinesses.append(business)
        print(favBusinesses)
    }
}
