//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Anisha Pareek on 9/19/23.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
