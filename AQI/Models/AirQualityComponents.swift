//
//  AirQualityComponents.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import Foundation

struct AirQualityComponents: Decodable {
    let co: Float
    let no: Float
    let o3: Float
    let so2: Float
    let pm2_5: Float
    let pm10: Float
    let nh3: Float
}
