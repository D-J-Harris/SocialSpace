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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set username based on userDefaults
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        welcomeLabel.text = "Welcome back, \(username)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
