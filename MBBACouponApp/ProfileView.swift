import SwiftUI
import PhotosUI

struct BusinessProfileView: View {
    @State private var accName = "Business Name"
    @State private var address = "Address, City, and State"
    @State private var category = "Business Type"
    @State private var isEditing = false
    @State private var showImagePicker = false
    @State private var selectedHeaderImage = UIImage()
    @State private var deals: [Deal] = []
    @State private var showAddDiscountView = false
    @StateObject private var firestoreManager = FirestoreManager()
    @State private var showingAddCoupon = false
    @State private var isLoading = false
    @State private var errorMessage: String?
    @State private var showDeleteConfirmation = false
    @State private var couponToDelete: Coupon?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Business Header
                    VStack {
                        Button(action: { showImagePicker = true }) {
                            ZStack(alignment: .bottomTrailing) {
                                if let image = UIImageToSwiftUIImage(selectedHeaderImage) {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 200)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                } else {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.gray.opacity(0.7))
                                        .frame(height: 200)
                                }
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.7))
                                    .clipShape(Circle())
                            }
                        }
                        .padding()
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(selectedImage: $selectedHeaderImage)
                        }
                    }
                    
                    // Editable Business Info
                    VStack(alignment: .leading, spacing: 10) {
                        if isEditing {
                            TextField("Business Name", text: $accName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)
                            TextField("Address", text: $address)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)
                            TextField("Category", text: $category)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)
                            
                            Button("Save") {
                                isEditing = false
                            }
                            .padding()
                        } else {
                            Text(accName)
                                .font(.title)
                                .bold()
                            Text("\(address)\n\(category)")
                            
                            Button("Edit Info") {
                                isEditing = true
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal)
                    
                    // Error Message
                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    // Coupons Section
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Coupons")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Button(action: { showingAddCoupon = true }) {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal)
                        
                        if isLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding()
                        } else if firestoreManager.coupons.isEmpty {
                            VStack {
                                Image(systemName: "tag")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray)
                                Text("No coupons available")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        } else {
                            ForEach(firestoreManager.coupons) { coupon in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(coupon.title)
                                                .font(.headline)
                                            Text(coupon.content)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text("Expires: \(coupon.expiryDate)")
                                                .font(.caption)
                                                .foregroundColor(.red)
                                        }
                                        Spacer()
                                        Button(action: {
                                            couponToDelete = coupon
                                            showDeleteConfirmation = true
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Business Profile")
            .refreshable {
                await refreshCoupons()
            }
            .onAppear {
                refreshCoupons()
            }
            .sheet(isPresented: $showingAddCoupon, onDismiss: {
                refreshCoupons()
            }) {
                AddCouponView(firestoreManager: firestoreManager)
            }
            .alert("Delete Coupon", isPresented: $showDeleteConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    if let coupon = couponToDelete {
                        deleteCoupon(coupon)
                    }
                }
            } message: {
                Text("Are you sure you want to delete this coupon?")
            }
        }
    }
    
    private func refreshCoupons() {
        isLoading = true
        errorMessage = nil
        firestoreManager.getCoupons { error in
            isLoading = false
            if let error = error {
                errorMessage = "Failed to load coupons: \(error.localizedDescription)"
            }
        }
    }
    
    private func deleteCoupon(_ coupon: Coupon) {
        isLoading = true
        errorMessage = nil
        firestoreManager.deleteCoupon(coupon) { error in
            isLoading = false
            if let error = error {
                errorMessage = "Failed to delete coupon: \(error.localizedDescription)"
            } else {
                refreshCoupons()
            }
        }
    }
}

// Helper function to convert UIImage to SwiftUI Image
func UIImageToSwiftUIImage(_ image: UIImage) -> Image? {
    return Image(uiImage: image)
}

#Preview {
    BusinessProfileView()
}
