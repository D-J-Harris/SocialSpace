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
        
        let param: [String: Any]? = ["port":8000]
        Alamofire.request("http://\(ipAddress)", method: .get, parameters: param, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
