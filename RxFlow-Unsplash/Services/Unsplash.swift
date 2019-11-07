//
//  Unsplash.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

struct Unsplash {
    static var baseURL: URL {
        guard let url = URL(string: "https://api.unsplash.com") else {
            fatalError("FAILED: https://api.unsplash.com")
        }
        return url
    }
    
    static var headers: [HTTPHeader] {
        let clientId = UNSPLASH_ACCESS_KEY
        guard
            let token = UserDefaults.standard.string(forKey: clientId)
            else { return [HTTPHeader(key: "Authorization", value: "Client-ID \(clientId)")] }
        
         return [HTTPHeader(key: "Authorization", value: "Bearer \(token)")]
    }
    
    static let cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
}

extension URLEncoding {
    static var noBracketsAndLiteralBool: URLEncoding {
        return URLEncoding(arrayEncoding: .noBrackets, boolEncoding: .literal)
    }
}
