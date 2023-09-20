//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/19/23.
//

import SwiftUI

struct BusinessSection: View {
    
    @EnvironmentObject var model: ContentModel
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                NavigationLink(value: business) {
                    BusinessRow(business: business)
                }
            }
            .navigationDestination(for: Business.self) { business in
                BusinessDetail(business: business)
            }
        }
    }
}

