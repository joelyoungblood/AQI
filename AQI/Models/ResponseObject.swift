//
//  ResponseObject.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import Foundation

struct ResponseObject: Decodable {
    let coordinates: ResponseCoordinates
    let responseArray: [ResponseArray]
    
    private enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case responseArray = "list"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        coordinates = try container.decode(ResponseCoordinates.self, forKey: .coordinates)
        responseArray = try container.decode([ResponseArray].self, forKey: .responseArray)
    }
}
