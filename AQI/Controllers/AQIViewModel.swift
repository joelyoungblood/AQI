//
//  AQIViewModel.swift
//  AQI
//
//  Created by Joel Youngblood on 4/19/24.
//

import Foundation
import Combine

struct AQIViewModel {
    let network = Network()
    
    func request(longitude: Double, latitude: Double) -> AnyPublisher<ResponseObject, Error> {
        return try! network.request(latitude: latitude, longitude: longitude).eraseToAnyPublisher()
    }
}
