//
//  BusinessSectionHeader.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/19/23.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 45)
            Text(title)
                .font(.headline)
        }
    }
}

