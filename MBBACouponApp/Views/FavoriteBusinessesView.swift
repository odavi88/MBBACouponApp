import SwiftUI

struct FavoriteBusinessesView: View {
    @StateObject private var businessManager = BusinessManager()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(businessManager.favBusinesses) { business in
                    FavBusinessCell(business: business)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FavoriteBusinessesView()
} 