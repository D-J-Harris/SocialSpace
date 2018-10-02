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
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var pushLocationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set User based on userDefaults
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        let user = User(username: username)
        welcomeLabel.text = "Welcome back, \(user.username)"
        locationLabel.text = "Your location is \(user.locationValue)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pushLocationButtonTapped(_ sender: Any) {
        
    }
    
}
