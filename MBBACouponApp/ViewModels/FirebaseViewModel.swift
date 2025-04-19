//
//  FirebaseViewModel.swift
//  MBBACouponApp
//
//  Created by Steven Alexander on 4/17/25.
//
import FirebaseFirestore
import SwiftData

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    @Published var coupons = [Coupon]()
    
    // Create Coupon
    func addCoupon(title: String, content: String, status: String = "active", expiryDate: String, businessName: String, completion: @escaping (Error?) -> Void) {
        var newCoupon = Coupon(
            status: status,
            expiryDate: expiryDate,
            title: title,
            content: content,
            businessName: businessName
        )
        
        do {
            let docRef = try db.collection("coupons").addDocument(from: newCoupon)
            newCoupon.firestoreId = docRef.documentID
            completion(nil)
        } catch {
            completion(error)
        }
    }


    
    // Read Coupons
    func getCoupons(completion: @escaping (Error?) -> Void) {
        db.collection("coupons").order(by: "title").addSnapshotListener { [weak self] snapshot, error in
            if let error = error {
                completion(error)
                return
            }
            
            self?.coupons = snapshot?.documents.compactMap { document in
                var coupon = try? document.data(as: Coupon.self)
                coupon?.firestoreId = document.documentID
                return coupon
            } ?? []
            completion(nil)
        }
    }
    
    // Update Coupon
    func updateCoupon(coupon: Coupon, completion: @escaping (Error?) -> Void) {
        guard let documentId = coupon.firestoreId else {
            let error = NSError(domain: "FirestoreManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Coupon ID is missing"])
            completion(error)
            return
        }
        
        do {
            try db.collection("coupons").document(documentId).setData(from: coupon)
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    // Delete Coupon
    func deleteCoupon(_ coupon: Coupon, completion: @escaping (Error?) -> Void) {
        guard let couponId = coupon.firestoreId else {
            completion(NSError(domain: "FirestoreManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Coupon ID is missing"]))
            return
        }
        
        // Use the explicitly set firestoreId for deletion
        db.collection("coupons").document(couponId).delete { error in
            completion(error)
        }
    }


}
