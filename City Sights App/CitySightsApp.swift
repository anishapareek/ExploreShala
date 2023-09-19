//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Anisha Pareek on 8/25/23.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
