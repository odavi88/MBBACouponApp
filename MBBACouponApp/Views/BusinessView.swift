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
                        .font(.montserrat(24))
                        .fontWeight(.bold)
                        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                    
                    Text(business.billingCity)
                        .font(.montserrat(16))
                        .fontWeight(.light)
                        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
                    
                    Text(business.primaryIndustry)
                        .font(.montserrat(16))
                        .fontWeight(.light)
                        .dynamicTypeSize(...DynamicTypeSize.xxLarge)

                    
                    HStack {
                        Text("5.0")
                            .font(.montserrat(16))
                            .fontWeight(.bold)
                            .dynamicTypeSize(...DynamicTypeSize.xxLarge)

                        Image(systemName: "star.fill")
                            .dynamicTypeSize(...DynamicTypeSize.xxLarge)
                        
                        Text("(25+)")
                            .font(.montserrat(16))
                            .fontWeight(.light)
                            .dynamicTypeSize(...DynamicTypeSize.xxLarge)

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
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 80))
                .frame(maxWidth:.infinity)
                .background(.ultraThinMaterial)
                .onTapGesture {
                    // code goes here
                }
        }
    }
}

#Preview {
    BusinessView()
}
