//
//  BusinessCellView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 1/30/25.
//

import SwiftUI

struct CouponCellView: View {
    @State private var business = [Business]()
    
        var body: some View {
            Image("coffee-bar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Business Name")
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

            ScrollView {
                ForEach(1..<21, id: \.self) { _ in
                    ZStack(alignment: .topLeading) {
                        Image("coffee")
                            .resizable()
                            .frame(width: 365, height: 180)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Color.yellow
                            .frame(width: 275, height: 25)
                            .overlay {
                                Text("Coffee Happy Hour (4pm - 6pm)")
                                    .multilineTextAlignment(.leading)
                                
                            }
                            .padding()
                    }
                }
            }
            Spacer()
        }
}

#Preview {
    CouponCellView()
}
