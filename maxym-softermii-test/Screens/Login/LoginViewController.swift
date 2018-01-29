//
//  LoginViewController.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import Moya
import RxCocoa
import Moya_ObjectMapper

class LoginViewController: UIViewController {

    let provider = APIProvider.provider()
    let disposeBag = DisposeBag()
    @IBOutlet weak var webView: LoginWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.requestForLogin()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleAuth(authToken: String)  {
        KeychainService.token = authToken
        showHome()
    }
    
    func showHome() {
        let homeVC = HomeViewController.loadFromNib
        present(homeVC, animated: true, completion: nil)
    }

}

extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let requestURLString = (webView.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(APIConstants.redirectURI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: String(requestURLString[range.upperBound...]))
            decisionHandler(WKNavigationActionPolicy.cancel)
        } else {
            decisionHandler(WKNavigationActionPolicy.allow)
        }
    }
}

