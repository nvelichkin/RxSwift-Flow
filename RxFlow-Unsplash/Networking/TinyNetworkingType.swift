//
//  TinyNetworkingType.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 29.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

protocol TinyNetworkingType {

    associatedtype Resource

    func request(resource: Resource,
                 session: TinyNetworkingSession,
                 queue: DispatchQueue,
                 completion: @escaping (Result<Response, TinyNetworkingError>) -> Void)
        -> URLSessionDataTask
}
