//
//  YelpAttribution.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/20/23.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
    }
}

