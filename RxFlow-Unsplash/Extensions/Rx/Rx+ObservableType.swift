//
//  Rx+ObservableType.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 08/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import RxSwift

extension ObservableType {
    func unwrap<T>() -> Observable<T> where Element == T? {
        return compactMap { $0 }
    }
}
