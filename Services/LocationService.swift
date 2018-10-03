//
//  LocationService.swift
//  SocialSpace
//
//  Created by Daniel Harris on 02/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService {
    
    //location variables
    let locationManager = CLLocationManager()
    
    func getCurrentLocation() -> (Double, Double)? {
        
        //if authorised, get current location
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            if let location = locationManager.location {
                let latitude: Double = location.coordinate.latitude
                let longitude: Double = location.coordinate.longitude
                return (latitude, longitude)
            }
            else {
                print("no location found")
                return nil
            }
            
        }
        else {
            print("location services not enabled")
            return nil
        }
    }
}
