//
//  AddCouponView.swift
//  MBBACouponApp
//
//  Created by Steven Alexander on 4/17/25.
//


import SwiftUI

struct AddCouponView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var firestoreManager: FirestoreManager
    @State private var title = ""
    @State private var content = ""
    @State private var status = "active"
    @State private var expiryDate = Date()
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var businessName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Coupon Details")) {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content)
                    TextField("Business Name", text: $businessName)
                        .autocapitalization(.words)
                    DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: .date)
                }
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: saveCoupon) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Save")
                    }
                }
                .disabled(isLoading)
            }
            .navigationTitle("Add Coupon")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveCoupon() {
        guard !title.isEmpty else {
            errorMessage = "Title cannot be empty"
            return
        }
        
        guard !content.isEmpty else {
            errorMessage = "Content cannot be empty"
            return
        }
        
        guard !businessName.isEmpty else {
            errorMessage = "Business name cannot be empty"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let expiryDateString = dateFormatter.string(from: expiryDate)
        
        firestoreManager.addCoupon(
            title: title,
            content: content,
            status: status,
            expiryDate: expiryDateString,
            businessName: businessName
        ) { error in
            isLoading = false
            if let error = error {
                errorMessage = "Failed to save coupon: \(error.localizedDescription)"
            } else {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
