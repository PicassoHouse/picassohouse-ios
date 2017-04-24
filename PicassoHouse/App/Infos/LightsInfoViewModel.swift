//
//  LightsInfoViewModel.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 17/04/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//

import RxSwift
import RxCocoa
import NSObject_Rx

struct LightsInfoViewModel {
    
    fileprivate var disposeBag = DisposeBag()
    
    fileprivate let history = Variable<[LightHistory]>([])
    fileprivate let currentMonthLightInfo = Variable<CurrentMonthLightInfo>(CurrentMonthLightInfo(hoursOn:0,hoursOff:0))
    
    
    //outputs
    var lightHistory : Observable<[LightHistory]> {
        return history.asObservable()
    }
    
    var timeOn : Observable<String> {
        return currentMonthLightInfo.asObservable()
            .map { "\(String($0.hoursOn)) hr" }
    }
    var timeOff : Observable<String> {
        return currentMonthLightInfo.asObservable()
            .map { "\(String($0.hoursOff)) hr" }
    }
    
    init() {
        loadHistory()
        loadCurrentMonthInfo()
    }
}



// MARK - Networking
extension LightsInfoViewModel {
    
    fileprivate func loadHistory() {
        PHApiProvider
            .request(.lightHistory())
            .mapJSON()
            .mapTo(arrayOf: LightHistory.self)
            .subscribe { (event) in
                switch event {
                case .next(let element):
                    self.history.value = element
                case .error(let error):
                    print(error)
                default:
                    break
                }
            }.disposed(by: disposeBag)
    }
    
    fileprivate func loadCurrentMonthInfo() {
        PHApiProvider
            .request(.currentMonthLightInfo())
            .mapJSON()
            .mapTo(object: CurrentMonthLightInfo.self)
            .subscribe { (event) in
                switch event {
                case .next(let element):
                    self.currentMonthLightInfo.value = element
                case .error(let error):
                    print(error)
                default:
                    break
                }
            }.disposed(by: disposeBag)
    }
    
}
