//
//  FetchDataViewController.swift
//  SocialSpace
//
//  Created by Daniel Harris on 01/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import UIKit

class InteractionsViewController: UIViewController {
    
    
    var currentLocation: (Double,Double)?
    let user = CoreDataHelper.retrieveUser()
    let locationManager = LocationManager()
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var pushLocationButton: UIButton!
    @IBOutlet weak var contactDatabaseButton: UIButton!
    @IBOutlet weak var updateLocationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.determineCurrentLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pushLocationButtonTapped(_ sender: Any) {
        //get current location using CoreLocation
        let locationService = LocationService()
        currentLocation = locationService.getCurrentLocation()
        
        //display result of current location
        if currentLocation != nil {
            locationLabel.text = "Your location is \(currentLocation!)"
        }
        else {
            print("current location not found")
        }
    }
    
    @IBAction func contactDatabaseButtonTouched(_ sender: Any) {
        
        let databaseService = DatabaseService()
        databaseService.getLocationValues()
    }
    
    @IBAction func updateLocationButtonTapped(_ sender: Any) {
        let databaseService = DatabaseService()
        databaseService.postLocationValue(user!)
    }
    
}
