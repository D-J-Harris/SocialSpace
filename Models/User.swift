//
//  User.swift
//  SocialSpace
//
//  Created by Daniel Harris on 02/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import UIKit

class User: Codable {
    
    let username: String
    var locationValue: Int
    var latitude: Double
    var longitude: Double
    
    init(username: String) {
        
        self.username = username
        self.latitude = 0
        self.longitude = 0
        self.locationValue = 0
    }
}
