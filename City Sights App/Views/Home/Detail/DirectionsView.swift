//
//  DirectionsView.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/20/23.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var encodedBusinessName: String? {
        if let name = business.name {
            var encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return encodedName
        }
        return nil
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Business title
                BusinessTitle(business: business)
                
                Spacer()
                
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = encodedBusinessName {
                    Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name)")!)
                }
            }
            .padding()
            
            // Directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

