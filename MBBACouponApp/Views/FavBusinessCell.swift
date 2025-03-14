//
//  FavBusinessCell.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/30/25.
//

import SwiftUI

struct BusinessSheet: View {
    @ObservedObject var bm = BusinessManager()
    var body: some View {
        VStack {
            BusinessView()
        }
    }
}

struct FavBusinessCell: View {
    @ObservedObject var bm = BusinessManager()
    @State var showBusiness = false
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    showBusiness.toggle()
                } label: {
                    Image(systemName: "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(.circle)
                        .ignoresSafeArea(.all)
                }
                .sheet(isPresented: $showBusiness) {
                    BusinessSheet()
                }
                .padding()
                .frame(width: 150, height: 150)
                .background(Circle().fill(.blue))
                .clipShape(.circle)
                .shadow(color:.gray, radius: 3, x: -2, y: 2)
            }
            
            HStack(spacing: 45) {
                ForEach(bm.favBusinesses) { business in
                    VStack {
                        Image(systemName: "")
                            .frame(width: 100, height: 100)
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(.circle)
                        Text(business.accName)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    let preview = PreviewContainer([Business.self])
    return FavBusinessCell().modelContainer(preview.container)
}
