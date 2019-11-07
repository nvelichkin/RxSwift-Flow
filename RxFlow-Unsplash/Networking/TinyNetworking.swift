//
//  TinyNetworking.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 02.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

class TinyNetworking<R: Resource>: TinyNetworkingType {

    init() {}

    @discardableResult
    func request(resource: R,
                 session: TinyNetworkingSession = URLSession.shared,
                 queue: DispatchQueue = .main,
                 completion: @escaping (Result<Response, TinyNetworkingError>) -> Void)
        -> URLSessionDataTask {
            
        let request = URLRequest(resource: resource)
            
        return session.loadData(with: request, queue: queue) { response, error in
            if let error = error {
                completion(.failure(.underlying(error, response)))
                return
            }

            guard let httpURLResponse = response.httpURLResponse,
                200..<300 ~= httpURLResponse.statusCode
                else {
                    completion(.failure(.statusCode(response)))
                    return
            }

            completion(.success(response))
        }
    }
}
