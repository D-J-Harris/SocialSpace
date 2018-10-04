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
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.distanceFilter = 50
            locationManager.startMonitoringSignificantLocationChanges()

        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new location received")
        print("user value of \(user?.locationValue)")
        
        //get location when update is pinged
        if let location = manager.location {


            let distance = Constants.house.distance(from: location)
            guard let locationValue = user?.locationValue else { return }
            
            print(distance)
            
            //check if the distance from house is above a threshold
            if distance < 100 && locationValue == 0.0 {
                
                CoreDataHelper.updateUserLocationValue(1)
                let databaseService = DatabaseService()
                databaseService.postLocationValue(CoreDataHelper.retrieveUser()!)
                
            }
            else if distance > 100 && user?.locationValue == 1.0 {
                
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
