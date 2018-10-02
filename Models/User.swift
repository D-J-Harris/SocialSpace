//
//  User.swift
//  SocialSpace
//
//  Created by Daniel Harris on 02/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let username: String
    var locationValue: Int
    
    init(username: String) {
        
        self.username = username
        self.locationValue = 0
    }
}
