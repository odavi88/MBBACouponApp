//
//  SettingsView.swift
//  MBBACouponApp
//
//  Created by Aaron Preston on 4/11/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle("Dark Mode", isOn: $isDarkModeEnabled)
            }
            .navigationTitle("Settings")
        }
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}
