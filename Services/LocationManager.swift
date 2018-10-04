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
            
            print(la2)
            print(lo2)
            print(HaversineDistance.haversineDistance(la1: 52.210662841796875, lo1: 0.11180670205418473, la2: la2, lo2: lo2))
            guard let locationValue = user?.locationValue else { return }
            //check if the distance from house is above a threshold
            if HaversineDistance.haversineDistance(la1: 52.210662841796875, lo1: 0.11180670205418473, la2: la2, lo2: lo2) < 20 && locationValue == 0.0 {
                
                print("location value \(locationValue)")
                
                CoreDataHelper.updateUserLocationValue(1)
                print("location of lat \(la2) lon \(lo2)")
                
                let databaseService = DatabaseService()
                databaseService.postLocationValue(CoreDataHelper.retrieveUser()!)
                
            }
            else if HaversineDistance.haversineDistance(la1: 52.210662841796875, lo1: 0.11180670205418473, la2: la2, lo2: lo2) > 20 && user?.locationValue == 1.0 {
                
                print("____")
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
