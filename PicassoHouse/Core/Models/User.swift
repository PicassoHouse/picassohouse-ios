//
//  User.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 20/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    let username : String
    let displayName : String
    //let mail : String
}


//MARK: - JSONAbleType
extension User : JSONAbleType {
    static func fromJSON(_ json:[String: Any]) -> User? {
        let json = JSON(json)
        
        return User(username: json["username"].stringValue,
                    displayName: json["displayName"].stringValue)
    }
}
