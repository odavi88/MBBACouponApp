//
//  BusinessView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 2/19/25.
//

import SwiftUI

struct BusinessView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(1..<4, id: \.self) { _ in
                    Image("garden-bowl")
                        .resizable()
                        .frame(width: 365, height: 180)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Text("Garden Bowl")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Detroit, MI")
                    Text("Recreation")
                    
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
