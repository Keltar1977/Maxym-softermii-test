//
//  Constants.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import UIKit

struct APIConstants {
    static let base = "https://api.instagram.com/v1/"
    
    static let authURL = "https://api.instagram.com/oauth/authorize/"
    
    static let clientId  = "766e61542c744eaba923333c8815b800"
    
    static let clientSecret = " 7489407fc9974bb689d5ce5ecd174b5e"
    
    static let redirectURI = "https://maxym.eu.auth0.com/login/callback"
    
    static let scope = "likes+comments+relationships"
}
