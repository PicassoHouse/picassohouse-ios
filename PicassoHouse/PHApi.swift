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
}


extension PHApi : TargetType {
    
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }
    
    var path: String {
        switch self {
        case .rooms():
            return "/rooms"
        case .turnLight(let isLightOn, let roomId):
            return "/rooms/light/?on\(isLightOn)&room_id\(roomId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .rooms:
            return .get
        case .turnLight:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        return [:]
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .request
    }

}
