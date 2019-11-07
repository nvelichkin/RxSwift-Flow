//
//  URLSession+Extensions.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 07.04.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

protocol TinyNetworkingSession {
    typealias CompletionHandler = (Response, Error?) -> Void
    func loadData(with urlRequest: URLRequest,
                  queue: DispatchQueue,
                  completionHandler: @escaping CompletionHandler)
        -> URLSessionDataTask
}

extension URLSession: TinyNetworkingSession {
    func loadData(with urlRequest: URLRequest,
                         queue: DispatchQueue,
                         completionHandler: @escaping (Response, Error?) -> Void)
        -> URLSessionDataTask {
        let task = dataTask(with: urlRequest) { data, urlResponse, error in
            queue.async {
                let response = Response(urlRequest: urlRequest,
                                        data: data,
                                        httpURLResponse: urlResponse as? HTTPURLResponse)
                completionHandler(response, error)
            }
        }
        task.resume()
        return task
    }
}
