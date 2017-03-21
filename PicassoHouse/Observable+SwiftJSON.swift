import Foundation
import Moya
import RxSwift
import SwiftyJSON

enum APIError: String {
    case couldNotParseJSON
    case notLoggedIn
    case missingData
}

extension APIError: Swift.Error { }

extension Observable {
    
    typealias Dictionary = [String: AnyObject]
    
    /// Get given JSONified data, pass back objects
    func mapTo<B: JSONAbleType>(object classType: B.Type) -> Observable<B> {
        return self.map { json in
            guard let dict = json as? Dictionary else {
                throw APIError.couldNotParseJSON
            }
            
            if let object = B.fromJSON(dict) {
                return object
            } else {
                throw APIError.couldNotParseJSON
            }
        }
    }
    
    /// Get given JSONified data, pass back objects as an array
    func mapTo<B: JSONAbleType>(arrayOf classType: B.Type) -> Observable<[B]> {
        return self.map { json in
            guard let array = json as? [AnyObject] else {
                throw APIError.couldNotParseJSON
            }
            
            guard let dicts = array as? [Dictionary] else {
                throw APIError.couldNotParseJSON
            }
            
            return dicts.flatMap { B.fromJSON($0) }
        }
    }
    
}
