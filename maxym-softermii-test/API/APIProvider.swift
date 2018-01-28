//
//  APIProvider.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import Moya

struct APIProvider {
    static func provider() -> MoyaProvider<InstagramAPI> {
        let endpointClosure = { (target: InstagramAPI) -> Endpoint<InstagramAPI> in
            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
            let sampleResponse: Endpoint.SampleResponseClosure = { .networkResponse(200, target.sampleData) }
            var endpoint: Endpoint<InstagramAPI> = Endpoint<InstagramAPI>(url: url,
                                                                        sampleResponseClosure: sampleResponse,
                                                                        method: target.method,
                                                                        task: target.task,
                                                                        httpHeaderFields: nil)
            endpoint = endpoint.adding(newHTTPHeaderFields: ["access_token": KeychainService.token])
            return endpoint
        }
        
        let plugins: [PluginType] = [NetworkLoggerPlugin(verbose: true)]
        
        return MoyaProvider<InstagramAPI>(endpointClosure: endpointClosure, plugins: plugins)
    }
}
