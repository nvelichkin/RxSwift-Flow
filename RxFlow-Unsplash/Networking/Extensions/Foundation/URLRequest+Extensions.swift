//
//  URLRequest+Extensions.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 02.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

internal extension URLRequest {
    init(resource: Resource) {
        var url = resource.baseURL.appendingPathComponent(resource.endpoint.path)

        if case let .requestWithParameters(parameters, encoding) = resource.task,
            let urlWithParams = url.appendingQueryParameters(parameters, encoding: encoding) {
            url = urlWithParams
        }

        self.init(url: url)

        httpMethod = resource.endpoint.method.rawValue

        resource.headers
            .forEach { addValue($0.key, forHTTPHeaderField: $0.value) }

        if resource.endpoint.method == .post || resource.endpoint.method == .put,
            case let .requestWithEncodable(encodable) = resource.task {
            httpBody = encodable.data
        }
        
        cachePolicy = resource.cachePolicy
    }
}
