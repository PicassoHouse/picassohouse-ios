//
//  PHApi.swift
//  PicassoHouse
//
//  Created by Antony Alkmim on 16/04/17.
//  Copyright © 2017 CoderUP. All rights reserved.
//
import Foundation
import Moya
import RxMoya


let PHApiProvider = RxMoyaProvider<PHApi>(stubClosure: MoyaProvider.immediatelyStub) // swiftlint:disable:this variable_name

enum PHApi {
    //rooms
    case rooms()
    case turnLight(on: Bool, roomId: String)
    case currentMonthLightInfo()
    case lightHistory()
}


extension PHApi : TargetType {
    
    var baseURL: URL {
        return URL(string: "http://localhost:3000/api")!
    }
    
    var path: String {
        switch self {
        case .rooms():
            return "/rooms"
        case .turnLight(let isLightOn, let roomId):
            return "/rooms/light/?on\(isLightOn)&room_id\(roomId)"
        case .currentMonthLightInfo() :
            return "/reports/currentmonthlightinfo"
        case .lightHistory() :
            return "/reports/monthlighthistory"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .rooms:
            return .get
        case .turnLight:
            return .post
        case .currentMonthLightInfo:
            return .get
        case .lightHistory:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .currentMonthLightInfo():
            return "{\"hoursOn\":356,\"hoursOff\":158}".data(using: String.Encoding.utf8)!
        case .lightHistory():
            return "[{\"label\":\"Dezembro\",\"value\":27},{\"label\":\"Janeiro\",\"value\":29},{\"label\":\"Fevereiro\",\"value\":33},{\"label\":\"Março\",\"value\":30},{\"label\":\"Abril\",\"value\":28},{\"label\":\"Maio\",\"value\":31}]".data(using: String.Encoding.utf8)!
        default:
            return Data()
        }
    }
    
    var task: Task {
        return .request
    }

}
