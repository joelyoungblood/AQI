//
//  Network.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import Foundation
import Combine

final class Network {
    
    func request(latitude: Double, longitude: Double) -> AnyPublisher<ResponseObject, Error> {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(latitude)&lon=\(longitude)&appid=af6e0afb9855939af363b3f57e88bf28")!
        let request = URLRequest(url: url)
        return URLSession.shared.dataTaskPublisher(for: request.url!)
                    .map { $0.data }
                    .decode(type: ResponseObject.self, decoder: JSONDecoder())
                    .eraseToAnyPublisher()
    }
}
