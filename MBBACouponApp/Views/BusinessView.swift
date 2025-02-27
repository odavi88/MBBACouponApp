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
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(business.billingCity)
                    Text(business.primaryIndustry)
                    
                    HStack {
                        Text("5.0")
                        Image(systemName: "star.fill")
                        Text("(25+)")
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
