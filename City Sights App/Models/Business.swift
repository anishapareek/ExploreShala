//
//  Business.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/19/23.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject, Hashable, Equatable {
    static func == (lhs: Business, rhs: Business) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
        
    }
    
    func getImageData() async {
        // Check that image url isn't nil
        guard let imageUrl else { return }
        
        // Download the data for the image
        if let url = URL(string: imageUrl) {
            // Get a session
            let session = URLSession.shared
            
            do {
                let (data, _) = try await session.data(from: url)
                DispatchQueue.main.async {
                    // Set the image data
                    self.imageData = data
                }
            } catch {
                // could not fetch the image
                print(error.localizedDescription)
            }
        }
    }
}

struct Location: Decodable, Hashable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
    }
}

struct Coordinate: Decodable, Hashable {
    var latitude: Double?
    var longitude: Double?
}

struct Category: Decodable, Hashable {
    var alias: String?
    var title: String?
}
