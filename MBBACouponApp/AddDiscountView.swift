//
//  AddDiscountView.swift
//  MBBACouponApp
//
//  Created by Steven Alexander on 2/19/25.
//
import SwiftUI
import PhotosUI

struct AddDiscountView: View {
    @Binding var deals: [Deal]
    @Binding var showAddDiscountView: Bool
    @State private var discountName = ""
    @State private var discountCode = ""
    @State private var description = ""
    @State private var showImagePicker = false
    @State private var selectedImage = UIImage()
    @State private var generateQR = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image Picker
            Button(action: { showImagePicker = true }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 200)
                    
                    if let image = UIImageToSwiftUIImage(selectedImage) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                        VStack {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                            Text("Tap to add photo")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
            }
            
            TextField("Discount Name", text: $discountName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Discount Code", text: $discountCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Add description", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 100)
            
            Toggle("QR Code", isOn: $generateQR)
                .toggleStyle(SwitchToggleStyle(tint: .yellow))
            
            Button("Submit") {
                if let image = UIImageToSwiftUIImage(selectedImage) {
                    deals.append(Deal(name: discountName, image: image))
                }
                showAddDiscountView = false
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}

struct Deal: Identifiable {
    let id = UUID()
    var name: String
    var image: Image
    var isFavorite: Bool = false
}
