//
//  LightsViewModel.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 26/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import RxSwift


protocol LightsViewModelDelegate : class {
    
}

class LightsViewModel : ViewModel {
    
    public weak var delegate : LightsViewModelDelegate?
    
    fileprivate let rooms = Variable<[Room]>([])
    
    var roomsViewModels : [LightItemViewModel] {
        return rooms.value.map(LightItemViewModel.init)
    }
    
    
    init(delegate : LightsViewModelDelegate?) {
        self.delegate = delegate
        
        loadRooms()
    }
    
}


// MARK - Networking

extension LightsViewModel {
    
    fileprivate func loadRooms() {
        //TODO: load and save locally the rooms
        
        rooms.value.append(Room(id: "1234", title: "Quarto", type: RoomType.bedRoom, isLightOn: true))
        rooms.value.append(Room(id: "1234", title: "Sala de Estar", type: RoomType.livingRoom, isLightOn: false))
        rooms.value.append(Room(id: "1234", title: "Cozinha", type: RoomType.kitchen, isLightOn: false))
        rooms.value.append(Room(id: "1234", title: "Garagem", type: RoomType.garage, isLightOn: true))
        
        
    }
    
}
