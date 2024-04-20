//
//  LocationManager.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import CoreLocation
import Combine

final class Location: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    let authorizationStatus = PassthroughSubject<CLAuthorizationStatus, Never>()
    let coordinates = PassthroughSubject<CLLocationCoordinate2D, Never>()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            authorizationStatus.send(.authorizedAlways)
            manager.startMonitoringSignificantLocationChanges()
        case .authorizedWhenInUse:
            authorizationStatus.send(.authorizedWhenInUse)
            manager.startMonitoringSignificantLocationChanges()
        case .restricted, .denied:
            authorizationStatus.send(.denied)
        case .notDetermined:
            authorizationStatus.send(.notDetermined)
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        coordinates.send(location.coordinate)
    }
}
