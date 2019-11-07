//
//  TinyNetworkingError.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 12.09.19.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

enum TinyNetworkingError: Error {
    case noData(Response)
    case statusCode(Response)
    case decoding(Error, Response)
    case underlying(Error, Response?)
}

extension TinyNetworkingError {
    var response: Response? {
        switch self {
        case let .noData(response):
            return response
        case let .statusCode(response):
            return response
        case let .decoding(_, response):
            return response
        case let .underlying(_, response):
            return response
        }
    }
}

extension TinyNetworkingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noData:
            return "The request gave no data."
        case .statusCode:
            return "Status code didn't fall within the given range."
        case .decoding:
            return "Failed to map data to a Decodable object."
        case let .underlying(error, _):
            return error.localizedDescription
        }
    }
}
