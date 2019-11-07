//
//  NetworkingType.swift
//  Networking
//
//  Created by Nikita Velichkin on 07/11/2019.
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
