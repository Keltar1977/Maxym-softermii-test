//
//  User.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import Realm

class User: Object, Mappable {

    
    @objc dynamic var ID: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var fullName: String = ""
    @objc dynamic var profilePicture: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var website: String = ""
    @objc dynamic var isBusiness: Bool = false
    @objc dynamic var mediaCount: Int = 0
    @objc dynamic var followsCount: Int = 0
    @objc dynamic var followedByCount: Int = 0

    
    required init?(map: Map) {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    // MARK: - Mapping
    
    func mapping(map: Map) {
        
//        {
//            "data": {
//                "id": "1574083",
//                "username": "snoopdogg",
//                "full_name": "Snoop Dogg",
//                "profile_picture": "http://distillery.s3.amazonaws.com/profiles/profile_1574083_75sq_1295469061.jpg",
//                "bio": "This is my bio",
//                "website": "http://snoopdogg.com",
//                "is_business": false,
//                "counts": {
//                    "media": 1320,
//                    "follows": 420,
//                    "followed_by": 3410
//                }
//            }
//        }
        
        var data = [String: Any]()
        data <- map["data"]
        ID <- map["data"]["id"]

        
    }

}
