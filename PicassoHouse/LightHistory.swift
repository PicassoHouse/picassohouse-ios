//
//  LightHistory.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 24/04/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LightHistory {
    let label: String
    let value: Int
}

//MARK: - JSONAbleType
extension LightHistory : JSONAbleType {
    
    static func fromJSON(_ json:[String: Any]) -> LightHistory? {
        let json = JSON(json)
        return LightHistory(label: json["label"].stringValue,
                            value: json["value"].intValue)
    }
    
}
