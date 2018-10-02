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
    
    var username: String = ""
    var user: User = User(username: "somebody")
    var currentLocation: (Double,Double) = (0,0)
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var pushLocationButton: UIButton!
    @IBOutlet weak var contactDatabaseButton: UIButton!
    @IBOutlet weak var updateLocationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set User based on userDefaults
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        user = User(username: username)
        welcomeLabel.text = "Welcome back, \(user.username)"
        locationLabel.text = "Your location is \(user.locationValue)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pushLocationButtonTapped(_ sender: Any) {
        //get current location using CoreLocation
        let locationService = LocationService()
        currentLocation = locationService.getLocation()
        
        //display result of current location
        locationLabel.text = "Your location is \(currentLocation)"
    }
    
    @IBAction func contactDatabaseButtonTouched(_ sender: Any) {
        
        let databaseService = DatabaseService()
        databaseService.getLocationValues()
    }
    
    @IBAction func updateLocationButtonTapped(_ sender: Any) {
        let databaseService = DatabaseService()
        databaseService.postLocationValue(user.locationValue, user)
    }
    
}
