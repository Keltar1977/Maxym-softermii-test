//
//  TestAPI.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import Moya
import RealmSwift
import ObjectMapper

enum InstagramAPI {
    case getUser()
    case getRecentMedia()
    case getMedia(with mediaId: String)
}

extension InstagramAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: APIConstants.base) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "users/self/"
        case .getRecentMedia:
            return "users/self/media/recent/"
        case .getMedia(let mediaId):
            return "media/\(mediaId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["access_token": KeychainService.token], encoding: URLEncoding.default)
    }
    
    var headers: [String: String]? {
        return nil
    }
}
