//
//  LocationManager.swift
//  SocialSpace
//
//  Created by Daniel Harris on 03/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: CLLocationManager, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    func determineCurrentLocation() {
        
        //location manager setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization() //permissions covered in info.plist
        locationManager.allowsBackgroundLocationUpdates = true
        print("authorization Status: \(CLLocationManager.authorizationStatus().rawValue)")
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.distanceFilter = 20
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new location received")
        
        if HaversineDistance.haversineDistance(la1: 52.211059, lo1: 0.113483, la2: 51.4545, lo2: 2.5879) > 20 {
            print("we're in business")
            print(HaversineDistance.haversineDistance(la1: 52.211059, lo1: 0.113483, la2: 51.4545, lo2: -2.5879))
        }
    
    }
}
