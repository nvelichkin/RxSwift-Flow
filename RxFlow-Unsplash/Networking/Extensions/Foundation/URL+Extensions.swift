//
//  URL+Extensions.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 13.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

internal extension URL {
    func appendingQueryParameters(_ parameters: [String: Any], encoding: URLEncoding) -> URL? {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)
        let urlComponentsCopy = urlComponents
        
        urlComponents?.query = urlComponentsCopy?.percentEncodedQuerySubComponents ?? "" + encoding.query(parameters)

        return urlComponents?.url
    }

}
