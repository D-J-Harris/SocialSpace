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
    
    let user = CoreDataHelper.retrieveUser()
    let locationManager = CLLocationManager()
    
    func determineCurrentLocation() {
        
        //location manager setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.allowsBackgroundLocationUpdates = true
        print("authorization Status: \(CLLocationManager.authorizationStatus().rawValue)")
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.distanceFilter = 20
            locationManager.startMonitoringSignificantLocationChanges()

        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new location received")
        
        //get location when update is pinged
        if let location = manager.location {
            let la2 = location.coordinate.latitude
            let lo2 = location.coordinate.longitude
            
            
            
            //check if the distance from house is above a threshold
            if HaversineDistance.haversineDistance(la1: 52.211059, lo1: 0.113483, la2: la2, lo2: lo2) < 20 && user?.locationValue == 0 {
                
                CoreDataHelper.updateUserLocationValue(1)
                
                let databaseService = DatabaseService()
                databaseService.postLocationValue(user!)
                
            }
            else if HaversineDistance.haversineDistance(la1: 52.211059, lo1: 0.113483, la2: la2, lo2: lo2) > 20 && user?.locationValue == 1 {
                
                CoreDataHelper.updateUserLocationValue(0)
                
                let databaseService = DatabaseService()
                databaseService.postLocationValue(user!)
            }
        }
        else {
            print("no location found")
        }
        

    }
}
