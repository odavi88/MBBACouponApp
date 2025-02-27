import SwiftUI
import PhotosUI

struct BusinessProfileView: View {
    @State private var accName = "Business Name"
    @State private var address = "Address, City, and State"
    @State private var category = "Business Type"
//    @State private var rating = "5.0"
//    @State private var reviews = "(25+)"
    @State private var isEditing = false
    @State private var showImagePicker = false
    @State private var selectedHeaderImage = UIImage()
    
    @State private var deals: [Deal] = []
    @State private var showAddDiscountView = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
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
                            ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedHeaderImage)
                        }
                    }
                    
                    // Editable Business Info
                    if isEditing {
                        TextField("Business Name", text: $accName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Address", text: $address)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Category", text: $category)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        TextField("Rating", text: $rating)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                        TextField("Reviews", text: $reviews)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Save") {
                            isEditing = false
                        }
                        .padding()
                    } else {
                        Text(accName).font(.title).bold()
                        Text("\(address)\n\(category)")
//                        Text("\(rating) ★ \(reviews)").bold()
                        
                        Button("Edit Info") {
                            isEditing = true
                        }
                        .padding()
                    }
                    
                    // Add Discount Button
                    HStack {
                        Spacer()
                        Button(action: { showAddDiscountView = true }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding()
                                .background(Color.black)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Deals List
                    ForEach($deals) { $deal in
                        ZStack(alignment: .topTrailing) {
                            deal.image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black.opacity(0.2), lineWidth: 1)
                                )
                            
                            // Favorite Button
                            Button(action: { deal.isFavorite.toggle() }) {
                                Image(systemName: deal.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(deal.isFavorite ? .red : .white)
                                    .padding(10)
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                                    .padding(10)
                            }
                        }
                        .overlay(
                            Text(deal.name)
                                .bold()
                                .foregroundColor(.black)
                                .padding(8)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding(), alignment: .topLeading
                        )
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showAddDiscountView) {
                AddDiscountView(deals: $deals, showAddDiscountView: $showAddDiscountView)
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
