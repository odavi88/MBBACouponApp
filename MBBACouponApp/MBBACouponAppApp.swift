//
//  MBBACouponAppApp.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/16/25.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct MBBACouponAppApp: App {
    init() {
                FirebaseApp.configure()
                
            }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Business.self, Coupon.self, Person.self])
        }
    }
}
