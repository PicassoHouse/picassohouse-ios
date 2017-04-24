//
//  CurrentMonthLightInfo.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 24/04/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//


import Foundation
import SwiftyJSON

struct CurrentMonthLightInfo {
    let hoursOn: Int
    let hoursOff: Int
}

//MARK: - JSONAbleType
extension CurrentMonthLightInfo : JSONAbleType {
    
    static func fromJSON(_ json:[String: Any]) -> CurrentMonthLightInfo? {
        let json = JSON(json)
        return CurrentMonthLightInfo(hoursOn: json["hoursOn"].intValue, hoursOff: json["hoursOff"].intValue)
    }
    
}
