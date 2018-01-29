//
//  Media.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/29/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import Realm

class Media: Object, Mappable {
    
    @objc dynamic var ID: String = ""
    @objc dynamic var comments: Int = 0
    @objc dynamic var likes: Int = 0
    @objc dynamic var lowResImage: String = ""
    @objc dynamic var thumbImage: String = ""
    @objc dynamic var originalImage: String = ""
    
    
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
        ID <- map["id"]
        comments <- map["comments.count"]
        likes <- map["likes.count"]
        lowResImage <- map["images.low_resolution.url"]
        originalImage <- map["images.standard_resolution.url"]
        thumbImage <- map["images.thumbnail.url"]
    }
    
}
