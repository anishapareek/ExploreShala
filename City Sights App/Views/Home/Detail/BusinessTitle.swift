//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/20/23.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        VStack(alignment: .leading) {
            // Business Name
            Text(business.name ?? "")
                .font(.title2)
                .bold()
            
            // Address
            if let displayAddress = business.location?.displayAddress {
                ForEach(displayAddress, id: \.self) {displayLine in
                    Text(displayLine)
                }
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

