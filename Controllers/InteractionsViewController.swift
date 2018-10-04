//
//  FetchDataViewController.swift
//  SocialSpace
//
//  Created by Daniel Harris on 01/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class InteractionsViewController: UIViewController, CLLocationManagerDelegate {
    

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
    
    @IBAction func contactDatabaseButtonTouched(_ sender: Any) {
        
        let databaseService = DatabaseService()
        //update this function to return the relevant dictionary for display and push notification
        databaseService.getLocationValues()
    }
    
    @IBAction func updateLocationButtonTapped(_ sender: Any) {
        let databaseService = DatabaseService()
        databaseService.postLocationValue(user!)
        

    }
    
}
