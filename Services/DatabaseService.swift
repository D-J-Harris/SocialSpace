//
//  DatabaseService.swift
//  SocialSpace
//
//  Created by Daniel Harris on 02/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//

import Foundation
import Alamofire

class DatabaseService {
    
    let ipAddress = "82.69.63.203"
    
    func getLocationValues() {
        
        Alamofire.request("http:\(ipAddress)").validate().responseJSON { (response) in
            switch response.result {
            case .success:
                
            case .failure(let error):
                
            }
        }
    }
}
