//
//  ResponseArray.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import Foundation

struct ResponseArray: Decodable {
    let main: AQIHolder
    let components: AirQualityComponents
    let dt: Int
}
