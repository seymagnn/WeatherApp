//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Seyma Gunonu on 26.12.2024.
//

import Foundation
import CoreLocation // CoreLocation is the framework from Apple, use to get user's current location


// the purpose of this script, requesting the user to share their location every time they launch the app

// first need to add a few protocols for LocationManager class
// NSObject, ObservableObject, CLLocationManagerDelegate (this will allow us to manage everything related to location without running into error)
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // adding manager
    let manager = CLLocationManager()
    
    // adding two published variables
    @Published var location: CLLocationCoordinate2D? // the meaning of '?' is "optional" (maybe user refuses us the access to their location)
    @Published var isLoading = false // default
    
    override init() {
        super.init() // when our class will be initialized, we need to call that
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // need to make two function to make the CLLocationManagerDelegate work
    // didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // assigning the location variable that we created, it will be equal to locations (it's an array of CLLocation)
        location = locations.first?.coordinate // it may be null, so added optional
        isLoading = false // got the location, so the state is not loading anymore
    }
    
    // a function to get handle the error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
