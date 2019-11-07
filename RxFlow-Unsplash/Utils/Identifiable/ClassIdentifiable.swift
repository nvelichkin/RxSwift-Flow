//
//  ClassIdentifiable.swift
//
//
//  Created by Velichkin Nikita on 20/06/2019.
//  Copyright © 2019 bytepace. All rights reserved.
//

import UIKit

protocol ClassIdentifiable: class {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}
