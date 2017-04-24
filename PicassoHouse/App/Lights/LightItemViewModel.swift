//
//  LightItemViewModel.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 26/03/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct LightItemViewModel : ViewModel {
    
    fileprivate var disposeBag = DisposeBag()
    
    fileprivate let room : Variable<Room>
    
    //inputs
    let didChangeLightStatusTo = PublishSubject<Bool>()
    
    //outputs
    var roomType : RoomType {
        return room.value.type
    }
    var roomTitle : String {
        return room.value.title
    }
    var isLightOn : Bool {
        return room.value.isLightOn
    }
    
    
    init(room : Room) {
        self.room = Variable(room)
        
        didChangeLightStatusTo
            .bindNext { status in
                print(status)
            }.disposed(by: disposeBag)
        
    }
    
}
