//
//  Room.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 26/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import UIKit

enum RoomType {
    case kitchen
    case livingRoom
    case bedRoom
    case garage
    case bathrooms
}


extension RoomType {
    
    var image : UIImage {
        switch self {
        case .kitchen: return #imageLiteral(resourceName: "ic_kitchen")
        case .livingRoom: return #imageLiteral(resourceName: "ic_living_room")
        case .bathrooms: return #imageLiteral(resourceName: "ic_bath")
        case .bedRoom: return #imageLiteral(resourceName: "ic_bed")
        case .garage: return #imageLiteral(resourceName: "ic_garage")
        }
    }
    
}
