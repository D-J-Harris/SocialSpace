//
//  MembersViewController.swift
//  SocialSpace
//
//  Created by Daniel Harris on 01/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import UIKit

class MembersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //value to save to userDefaults
    var username: String = ""
    

    
    //change userValue depending on user selection
    @IBAction func mainButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            username = "Alfie"
        case 1:
            username = "Dan"
        case 2:
            username = "Jacob"
        case 3:
            username = "Theo"
        default:
            username = ""
        }
        
        //save value to userDefaults
        UserDefaults.standard.set(username, forKey: "username")
        
        //segue to new storyboard
        let storyboard = UIStoryboard(name: "Interaction", bundle: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
}
