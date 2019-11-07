//
//  Encodable+Extensions.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 08/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

extension Encodable {
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
}
