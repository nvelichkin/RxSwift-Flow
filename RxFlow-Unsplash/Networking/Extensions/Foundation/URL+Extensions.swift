//
//  URL+Extensions.swift
//  Networking
//
//  Created by Nikita Velichkin on 07/11/2019.
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
