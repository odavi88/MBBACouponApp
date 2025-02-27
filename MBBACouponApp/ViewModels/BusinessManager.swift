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
        Business(accName: "PC Builders Enterprises", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "pcbuilders@business.com", businessCategory: .itTech),
           Business(accName: "Swift Industries", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "swift@industries.com", businessCategory: .itTech),
           Business(accName: "AutoMasters", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "automasters@business.com", businessCategory: .automotive),
           Business(accName: "ConstructCo", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "constructco@business.com", businessCategory: .construction),
           Business(accName: "EduTech Solutions", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "edutech@business.com", businessCategory: .education),
           Business(accName: "Financial Advisors Inc.", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "finance@advisors.com", businessCategory: .financialInsurance),
           Business(accName: "HealthFirst Clinic", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "healthfirst@clinic.com", businessCategory: .healthCare),
           Business(accName: "Hospitality Haven", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "hospitality@haven.com", businessCategory: .hospitality),
           Business(accName: "Legal Experts LLC", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legalexperts@business.com", businessCategory: .legal),
           Business(accName: "Real Estate Pros", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "realestate@pros.com", businessCategory: .realEstate),
           Business(accName: "Tasty Bites Restaurant", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "tastybites@restaurant.com", businessCategory: .restaurant),
           Business(accName: "Retail Therapy", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "retail@therapy.com", businessCategory: .retail),
           Business(accName: "SelfCare Solutions", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "selfcare@solutions.com", businessCategory: .selfCare),
        Business(accName: "Precision Auto Care", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@precisionauto.com", businessCategory: .automotive),
        Business(accName: "BuildRight Contractors", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "info@buildright.com", businessCategory: .construction),
        Business(accName: "NextGen Learning", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@nextgenlearning.com", businessCategory: .education),
        Business(accName: "Elite Financial Group", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@elitefinance.com", businessCategory: .financialInsurance),
        Business(accName: "Vitality Health Center", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@vitalityhealth.com", businessCategory: .healthCare),
        Business(accName: "Blue Haven Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "reservations@bluehaven.com", businessCategory: .hospitality),
        Business(accName: "Tech Innovations LLC", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@techinnovations.com", businessCategory: .itTech),
        Business(accName: "Trust & Associates Law", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@trustassociates.com", businessCategory: .legal),
        Business(accName: "Metro Realty Experts", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "sales@metrorealty.com", businessCategory: .realEstate),
        Business(accName: "Gourmet Delights", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@gourmetdelights.com", businessCategory: .restaurant),
        Business(accName: "ShopEase Retail", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@shopease.com", businessCategory: .retail),
        Business(accName: "Holistic Wellness Spa", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@wellnessspa.com", businessCategory: .selfCare),
        Business(accName: "Fast Track Auto Repairs", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "service@fasttrackauto.com", businessCategory: .automotive),
        Business(accName: "Skyline Construction Co.", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@skylineconstruct.com", businessCategory: .construction),
        Business(accName: "Bright Futures Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "admin@brightfutures.com", businessCategory: .education),
        Business(accName: "Gold Shield Insurance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@goldshield.com", businessCategory: .financialInsurance),
        Business(accName: "CarePoint Medical", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@carepointmed.com", businessCategory: .healthCare),
        Business(accName: "Urban Retreat Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "bookings@urbanretreat.com", businessCategory: .hospitality),
        Business(accName: "FutureTech Solutions", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "hello@futuretech.com", businessCategory: .itTech),
        Business(accName: "Justice League Law Firm", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@justiceleague.com", businessCategory: .legal),
        Business(accName: "Road King Auto", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@roadkingauto.com", businessCategory: .automotive),
            Business(accName: "Solid Foundation Builders", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@solidfoundation.com", businessCategory: .construction),
            Business(accName: "SmartLearn Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@smartlearn.com", businessCategory: .education),
            Business(accName: "Secure Future Finance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@securefuture.com", businessCategory: .financialInsurance),
            Business(accName: "Lifeline Health Services", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "contact@lifelinehealth.com", businessCategory: .healthCare),
            Business(accName: "Grand Stay Resorts", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "reservations@grandstay.com", businessCategory: .hospitality),
            Business(accName: "ByteCraft Technologies", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@bytecrafttech.com", businessCategory: .itTech),
            Business(accName: "Legacy Legal Group", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@legacylaw.com", businessCategory: .legal),
            Business(accName: "Prime Properties Realty", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "sales@primeproperties.com", businessCategory: .realEstate),
            Business(accName: "Savor & Spice Restaurant", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@savorandspice.com", businessCategory: .restaurant),
            Business(accName: "TrendSetter Retail", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@trendsetter.com", businessCategory: .retail),
            Business(accName: "Zen Haven Spa", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@zenhaven.com", businessCategory: .selfCare),
            Business(accName: "TurboFix Auto Repair", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "service@turbofixauto.com", businessCategory: .automotive),
            Business(accName: "Everest Construction", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@everestbuilds.com", businessCategory: .construction),
            Business(accName: "Excel Minds Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "admin@excelminds.com", businessCategory: .education),
            Business(accName: "Platinum Shield Insurance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@platinumshield.com", businessCategory: .financialInsurance),
            Business(accName: "WellSpring Medical", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@wellspringmed.com", businessCategory: .healthCare),
            Business(accName: "Summit View Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "bookings@summitview.com", businessCategory: .hospitality),
            Business(accName: "Neon Pixel Software", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "hello@neonpixel.com", businessCategory: .itTech),
            Business(accName: "Verdict Law Firm", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@verdictlaw.com", businessCategory: .legal)
    ]
    @Published var favBusinesses: [Business] = []
    @Published var selectedTokens = [Token]()
    @Published var suggestedTokens = [
//        Token(name: "Premium", membershipStatusToken: MemberStatusToken(name: "Premium")),
//        Token(name: "Non-Premium", membershipStatusToken: MemberStatusToken(name: "Non-Premium")),
        
        Token(name: "Automotive", businessCategoryToken: BusinessCategoryToken(name: "Automotive", businessSearchToken: .automotive)),
        Token(name: "Construction", businessCategoryToken: BusinessCategoryToken(name: "Construction", businessSearchToken: .construction)),
        Token(name: "Education", businessCategoryToken: BusinessCategoryToken(name: "Education", businessSearchToken: .education)),
        Token(name: "Financial/Insurance", businessCategoryToken: BusinessCategoryToken(name: "Financial/Insurance", businessSearchToken: .financialInsurance)),
        Token(name: "Health Care", businessCategoryToken: BusinessCategoryToken(name: "Health Care", businessSearchToken: .healthCare)),
        Token(name: "Hospitality", businessCategoryToken: BusinessCategoryToken(name: "Hospitality", businessSearchToken: .hospitality)),
        Token(name: "IT/Tech", businessCategoryToken: BusinessCategoryToken(name: "IT/Tech", businessSearchToken: .itTech)),
        Token(name: "Legal", businessCategoryToken: BusinessCategoryToken(name: "Legal", businessSearchToken: .legal)),
        Token(name: "Real Estate", businessCategoryToken: BusinessCategoryToken(name: "Real Estate", businessSearchToken: .realEstate)),
        Token(name: "Restaurant", businessCategoryToken: BusinessCategoryToken(name: "Restaurant", businessSearchToken: .restaurant)),
        Token(name: "Retail", businessCategoryToken: BusinessCategoryToken(name: "Retail", businessSearchToken: .retail)),
        Token(name: "Self Care", businessCategoryToken: BusinessCategoryToken(name: "Self Care", businessSearchToken: .selfCare))
    ]
    
    var filteredBusinesses: [Business] {
        mainFeedBusinesses.filter { business in
            (searchText.isEmpty || business.accName.localizedCaseInsensitiveContains(searchText)) &&
            
            (selectedTokens.isEmpty || selectedTokens.contains { token in
                business.businessCategory.rawValue.localizedCaseInsensitiveContains(token.name)
            })
            
//            (selectedTokens.isEmpty || selectedTokens.contains { token in
//                business.membershipStatus.rawValue.localizedCaseInsensitiveContains(token.name)
//            })
        }
    }
    
//   MARK: Function that appends a favorited business into the favBusinesses array:
    func favoriteBusiness() {
        let business = Business.init(accName: "", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "", businessCategory: .automotive)
        favBusinesses.append(business)
        print(favBusinesses)
    }
}
