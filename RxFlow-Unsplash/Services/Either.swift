//
//  Either.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 27.04.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

enum Either<T, E> {
    case left(T)
    case right(E)
}
