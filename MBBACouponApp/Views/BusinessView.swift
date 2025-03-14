//
//  BusinessView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 2/19/25.
//

import SwiftUI

struct BusinessView: View {
    @ObservedObject var bm = BusinessManager()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(bm.filteredBusinesses) { business in
                    Image(business.imageUrl)
                        .resizable()
                        .frame(width: 365, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Text(business.accName)
                        .font(.custom("Montserrat-Regular", size: 24))
                        .fontWeight(.bold)
                    
                    Text(business.billingCity)
                        .font(.custom("Montserrat-Light", size: 16))
                    Text(business.primaryIndustry)
                        .font(.custom("Montserrat-Light", size: 16))
                    
                    HStack {
                        Text("5.0")
                            .font(.custom("Montserrat-SemiBold", size: 16))
                        Image(systemName: "star.fill")
                        Text("(25+)")
                            .font(.custom("Montserrat-Light", size: 16))
                    }
                }
                .onTapGesture {
                    bm.businessSheet.toggle()
                }
                .sheet(isPresented: $bm.businessSheet) {
                    CouponCellView()
                }
            }
            .padding()
        }
    }
}

#Preview {
    BusinessView()
}
