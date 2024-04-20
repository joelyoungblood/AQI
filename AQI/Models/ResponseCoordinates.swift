//
//  ResponseCoordinates.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import Foundation

struct ResponseCoordinates: Decodable {
    let longitude: Float
    let latitude: Float
    
    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
