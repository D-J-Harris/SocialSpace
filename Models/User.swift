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
    
    init(username: String, latitude: Double, longitude: Double) {
        
        self.username = username
        self.latitude = latitude
        self.longitude = longitude
        self.locationValue = 0
    }
}
