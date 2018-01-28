//
//  LoginWebView.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import WebKit

class LoginWebView: WKWebView {

    
    func requestForLogin() {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [APIConstants.authURL,APIConstants.clientId,APIConstants.redirectURI, APIConstants.scope ])
        let urlRequest =  URLRequest.init(url: URL.init(string: authURL)!)
        load(urlRequest)
    }
}
