//
//  BusinessView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 2/19/25.
//

import SwiftUI

struct BusinessView: View {
    @State private var business = [Business]()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(business) { businesses in
                    Image(uiImage: businesses.imageUrl)
                        .resizable()
                        .frame(width: 365, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Text(businesses.accName)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Detroit, MI")
                    Text(businesses.primaryIndustry)
                    
                    HStack {
                        Text("5.0")
                        Image(systemName: "star.fill")
                        Text("(25+)")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    BusinessView()
}
