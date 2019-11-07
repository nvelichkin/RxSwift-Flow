//
//  URLComponents+Extensions.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 08/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

extension URLComponents {
    var percentEncodedQuerySubComponents: String? {
        return percentEncodedQuery.map { $0 + "&" }
    }
}
