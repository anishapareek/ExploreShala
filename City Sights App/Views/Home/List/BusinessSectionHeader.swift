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
            Text(title)
                .font(.headline)
        }
    }
}

