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
        Business(accName: "PC Builders Enterprises", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "pcbuilders@business.com", isFavorite: true, businessCategory: .itTech),
           Business(accName: "Swift Industries", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "swift@industries.com", isFavorite: false, businessCategory: .itTech),
           Business(accName: "AutoMasters", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "automasters@business.com", isFavorite: false, businessCategory: .automotive),
           Business(accName: "ConstructCo", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "constructco@business.com", isFavorite: false, businessCategory: .construction),
           Business(accName: "EduTech Solutions", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "edutech@business.com", isFavorite: false, businessCategory: .education),
        Business(accName: "Financial Advisors Inc.", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "finance@advisors.com", isFavorite: false, businessCategory: .financialInsurance),
        Business(accName: "HealthFirst Clinic", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "healthfirst@clinic.com", isFavorite: false, businessCategory: .healthCare),
        Business(accName: "Hospitality Haven", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "hospitality@haven.com", isFavorite: false, businessCategory: .hospitality),
        Business(accName: "Legal Experts LLC", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legalexperts@business.com", isFavorite: false, businessCategory: .legal),
        Business(accName: "Real Estate Pros", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "realestate@pros.com", isFavorite: false, businessCategory: .realEstate),
        Business(accName: "Tasty Bites Restaurant", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "tastybites@restaurant.com", isFavorite: false, businessCategory: .restaurant),
        Business(accName: "Retail Therapy", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "retail@therapy.com", isFavorite: false, businessCategory: .retail),
        Business(accName: "SelfCare Solutions", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "selfcare@solutions.com", isFavorite: false, businessCategory: .selfCare),
        Business(accName: "Precision Auto Care", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@precisionauto.com", isFavorite: false, businessCategory: .automotive),
        Business(accName: "BuildRight Contractors", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "info@buildright.com", isFavorite: false, businessCategory: .construction),
        Business(accName: "NextGen Learning", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@nextgenlearning.com", isFavorite: false, businessCategory: .education),
        Business(accName: "Elite Financial Group", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@elitefinance.com", isFavorite: false, businessCategory: .financialInsurance),
        Business(accName: "Vitality Health Center", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@vitalityhealth.com", isFavorite: false, businessCategory: .healthCare),
        Business(accName: "Blue Haven Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "reservations@bluehaven.com", isFavorite: false, businessCategory: .hospitality),
        Business(accName: "Tech Innovations LLC", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@techinnovations.com", isFavorite: false, businessCategory: .itTech),
        Business(accName: "Trust & Associates Law", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@trustassociates.com", isFavorite: false, businessCategory: .legal),
        Business(accName: "Metro Realty Experts", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "sales@metrorealty.com", isFavorite: false, businessCategory: .realEstate),
        Business(accName: "Gourmet Delights", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@gourmetdelights.com", isFavorite: false, businessCategory: .restaurant),
        Business(accName: "ShopEase Retail", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@shopease.com", isFavorite: false, businessCategory: .retail),
        Business(accName: "Holistic Wellness Spa", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@wellnessspa.com", isFavorite: false, businessCategory: .selfCare),
        Business(accName: "Fast Track Auto Repairs", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "service@fasttrackauto.com", isFavorite: false, businessCategory: .automotive),
        Business(accName: "Skyline Construction Co.", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@skylineconstruct.com", isFavorite: false, businessCategory: .construction),
        Business(accName: "Bright Futures Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "admin@brightfutures.com", isFavorite: false, businessCategory: .education),
        Business(accName: "Gold Shield Insurance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@goldshield.com", isFavorite: false, businessCategory: .financialInsurance),
        Business(accName: "CarePoint Medical", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@carepointmed.com", isFavorite: false, businessCategory: .healthCare),
        Business(accName: "Urban Retreat Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "bookings@urbanretreat.com", isFavorite: false, businessCategory: .hospitality),
        Business(accName: "FutureTech Solutions", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "hello@futuretech.com", isFavorite: false, businessCategory: .itTech),
        Business(accName: "Justice League Law Firm", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@justiceleague.com", isFavorite: false, businessCategory: .legal),
        Business(accName: "Road King Auto", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@roadkingauto.com", isFavorite: false, businessCategory: .automotive),
            Business(accName: "Solid Foundation Builders", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@solidfoundation.com", isFavorite: false, businessCategory: .construction),
            Business(accName: "SmartLearn Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@smartlearn.com", isFavorite: false, businessCategory: .education),
            Business(accName: "Secure Future Finance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@securefuture.com", isFavorite: false, businessCategory: .financialInsurance),
            Business(accName: "Lifeline Health Services", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "contact@lifelinehealth.com", isFavorite: false, businessCategory: .healthCare),
            Business(accName: "Grand Stay Resorts", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "reservations@grandstay.com", isFavorite: false, businessCategory: .hospitality),
            Business(accName: "ByteCraft Technologies", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@bytecrafttech.com", isFavorite: false, businessCategory: .itTech),
            Business(accName: "Legacy Legal Group", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@legacylaw.com", isFavorite: false, businessCategory: .legal),
            Business(accName: "Prime Properties Realty", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "sales@primeproperties.com", isFavorite: false, businessCategory: .realEstate),
            Business(accName: "Savor & Spice Restaurant", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@savorandspice.com", isFavorite: false, businessCategory: .restaurant),
            Business(accName: "TrendSetter Retail", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@trendsetter.com", isFavorite: false, businessCategory: .retail),
            Business(accName: "Zen Haven Spa", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "contact@zenhaven.com", isFavorite: false, businessCategory: .selfCare),
            Business(accName: "TurboFix Auto Repair", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "service@turbofixauto.com", isFavorite: false, businessCategory: .automotive),
            Business(accName: "Everest Construction", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "info@everestbuilds.com", isFavorite: false, businessCategory: .construction),
            Business(accName: "Excel Minds Academy", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "admin@excelminds.com", isFavorite: false, businessCategory: .education),
            Business(accName: "Platinum Shield Insurance", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "services@platinumshield.com", isFavorite: false, businessCategory: .financialInsurance),
            Business(accName: "WellSpring Medical", memberStatus: .nonPremium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "support@wellspringmed.com", isFavorite: false, businessCategory: .healthCare),
            Business(accName: "Summit View Hotels", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "bookings@summitview.com", isFavorite: false, businessCategory: .hospitality),
            Business(accName: "Neon Pixel Software", memberStatus: .nonPremium, subscriptionStatus: false, county: "", primaryIndustry: "", primaryEmail: "hello@neonpixel.com", isFavorite: false, businessCategory: .itTech),
            Business(accName: "Verdict Law Firm", memberStatus: .premium, subscriptionStatus: true, county: "", primaryIndustry: "", primaryEmail: "legal@verdictlaw.com", isFavorite: false, businessCategory: .legal)
    ]
    @Published var favoriteBusinesses: [Business] = []
    @Published var selectedTokens = [Token]()
    @Published var suggestedTokens = [
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
        }
    }
    
    //   MARK: Function that appends a favorited business into the favBusinesses array:
        func toggleFavorite(selectedBusiness: Business) {
            if let index = mainFeedBusinesses.firstIndex(of: selectedBusiness) {
                favoriteBusinesses.append(selectedBusiness)
            }
            print("Favorite Business array: \(favoriteBusinesses)")
        }
    
    func isFavorite(selectedBusiness: Business) -> Bool {
        mainFeedBusinesses.contains(selectedBusiness)
    }
}
