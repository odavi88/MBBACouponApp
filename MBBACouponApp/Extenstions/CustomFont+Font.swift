//
//  CustomFont+Font.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 3/19/25.
//

import Foundation
import SwiftUI


extension Font {
    static func montserrat(_ size: CGFloat) -> Font {
        return Font.custom("Montserrat-Regular", size: size)
    }
}

extension View {
    @ViewBuilder func scaledFont(name: String = UIFont.systemFont(ofSize: 0).familyName, size: CGFloat, weight: Font.Weight = .regular) -> some View {
        if #available(iOS 16.0, *) {
            self.font(.custom(name, size: size, relativeTo: .body))
        } else {
            self.font(.custom(name, size: size, relativeTo: .body).weight(weight))
        }
    }
     
}
