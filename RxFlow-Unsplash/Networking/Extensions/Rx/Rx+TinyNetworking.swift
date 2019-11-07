//
//  RxTinyNetworking.swift
//  RxTinyNetworking
//
//  Created by Nikita Velichkin on 07.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation
import RxSwift

extension TinyNetworking: ReactiveCompatible {}

extension Reactive where Base: TinyNetworkingType {
    func request(resource: Base.Resource,
                 session: TinyNetworkingSession = URLSession.shared,
                 queue: DispatchQueue = .main)
        -> Single<Response> {
        return Single.create { single in
            let task = self.base.request(resource: resource, session: session, queue: queue) { result in
                switch result {
                case let .failure(error):
                    single(.error(error))
                case let .success(response):
                    single(.success(response))
                }
            }

            return Disposables.create {
                task.cancel()
            }
        }
    }
}

// MARK: Single

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func map<D: Decodable>(to type: D.Type) -> Single<D> {
        return flatMap { Single<D>.just(try $0.map(to: type)) }
    }
}

// MARK: Observable

extension ObservableType where Element == Response {
    func map<D: Decodable>(to type: D.Type) -> Observable<D> {
        return flatMap { Observable<D>.just(try $0.map(to: type)) }
    }
}
