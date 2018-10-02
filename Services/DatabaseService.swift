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
    
    let ipAddress = "192.168.1.71"
    
    func getLocationValues() {
        
        Alamofire.request("http://\(ipAddress):8000/read").validate().responseJSON { (response) in
            switch response.result {
            case .success:
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func postLocationValue(_ locationValue: Int, _ user: User) {
        
        let params: [String: Any]? = ["user_id": user.username, "location_value": locationValue]
        
        Alamofire.request("http://\(ipAddress):8000/set", method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate().responseJSON { (response) in
        }
    }
}
