//
//  MBBACouponAppApp.swift
//  MBBACouponApp
//
//  Created by Omar Davidson II on 1/16/25.
//

import SwiftUI

@main
struct MBBACouponAppApp: App {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Business.self])
                .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
}
