//
//  ResourceType.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 29.03.18.
//

import Foundation

protocol Resource {
    var baseURL: URL { get }
    var endpoint: Endpoint { get }
    var task: Task { get }
    var headers: [HTTPHeader] { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}
