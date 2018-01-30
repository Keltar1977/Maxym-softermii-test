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
        ID <- map["data.id"]
        username <- map["data.username"]
        fullName <- map["data.full_name"]
        profilePicture <- map["data.profile_picture"]
        bio <- map["data.bio"]
        website <- map["data.website"]
        isBusiness <- map["data.is_business"]
        mediaCount <- map["data.counts.media"]
        followsCount <- map["data.counts.follows"]
        followedByCount <- map["data.counts.followed_by"]
    }

}
