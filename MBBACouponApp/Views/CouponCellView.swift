//
//  BusinessCellView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 1/30/25.
//

import SwiftUI

struct CouponCellView: View {
    @StateObject private var firestoreManager = FirestoreManager()
    let businessName: String
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            // Business Header
            VStack(alignment: .leading) {
                Text(businessName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Detroit, MI")
                Text("Food/Catering")
                
                HStack {
                    Text("5.0")
                    Image(systemName: "star.fill")
                    Text("(25+)")
                }
            }
            .padding()

            // Coupons List
            ScrollView {
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding()
                } else if firestoreManager.coupons.isEmpty {
                    VStack {
                        Image(systemName: "tag")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        Text("No coupons available")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                } else {
                    ForEach(firestoreManager.coupons.filter { $0.businessName == businessName }) { coupon in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(coupon.title)
                                        .font(.headline)
                                    Text(coupon.content)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Expires: \(coupon.expiryDate)")
                                        .font(.caption)
                                        .foregroundColor(.red)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            loadCoupons()
        }
    }
    
    private func loadCoupons() {
        isLoading = true
        errorMessage = nil
        firestoreManager.getCoupons { error in
            isLoading = false
            if let error = error {
                errorMessage = "Failed to load coupons: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    CouponCellView(businessName: "Sample Business")
}
