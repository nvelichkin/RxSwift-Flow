//
//  ResourceType.swift
//  Networking
//
//  Created by Nikita Velichkin on 07/11/2019.
//

import Foundation

protocol Resource {
    var baseURL: URL { get }
    var endpoint: Endpoint { get }
    var task: Task { get }
    var headers: [HTTPHeader] { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}
