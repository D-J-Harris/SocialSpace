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
        
        //get location when update is pinged
        if let location = locationManager.location {
            let la2 = location.coordinate.latitude
            let lo2 = location.coordinate.longitude
            
            
            
            //check if the distance from house is above a threshold
            if HaversineDistance.haversineDistance(la1: 52.211059, lo1: 0.113483, la2: la2, lo2: lo2) > 20 {
                
                let databaseService = DatabaseService()
                databaseService
                
            }
        }
        else {
            print("no location found")
        }
        

    }
}
