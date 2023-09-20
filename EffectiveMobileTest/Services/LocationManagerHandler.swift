//
//  LocationManagerHandler.swift
//  EffectiveMobileTest
//
//  Created by Vadim Krylov on 20.09.2023.
//

import UIKit
import CoreLocation

final class LocationManagerHandler: NSObject {
    
    private let locationManager: CLLocationManager
    private let geocoder: CLGeocoder
    weak var delegate: NavigationViewDelegate?
    
    init(locationManager: CLLocationManager = CLLocationManager(), geocoder: CLGeocoder = CLGeocoder()) {
        self.locationManager = locationManager
        self.geocoder = geocoder
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManagerHandler: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let error = error {
                self?.delegate?.didFailToUpdateLocation(error: error)
                return
            }
            
            if let placemark = placemarks?.first, let city = placemark.locality {
                self?.delegate?.didUpdateLocation(city: city)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didFailToUpdateLocation(error: error)
    }
}
