//
//  Response.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 30.03.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

final class Response: CustomDebugStringConvertible {
    let urlRequest: URLRequest
    let data: Data?
    let httpURLResponse: HTTPURLResponse?

    var description: String {
        return """
        Requested URL: \(urlRequest.url?.absoluteString ?? "nil"),
        Status Code: \(httpURLResponse?.statusCode ?? -999),
        Data Count: \(data?.count ?? -999)
        """
    }

    var debugDescription: String {
        return description
    }

    var prettyJSONString: String? {
        return data?.prettyJSONString
    }

    var json: Any? {
        return data?.json
    }

    init(urlRequest: URLRequest,
                data: Data?,
                httpURLResponse: HTTPURLResponse?) {
        self.urlRequest = urlRequest
        self.data = data
        self.httpURLResponse = httpURLResponse
    }

    func map<D: Decodable>(to type: D.Type,
                                  decoder: JSONDecoder = JSONDecoder()) throws -> D {
        guard let data = data else { throw TinyNetworkingError.noData(self) }

        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw TinyNetworkingError.decoding(error, self)
        }
    }
}

private extension Data {
    var prettyJSONString: String? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let prettyPrintedData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            else { return nil }

        return String(bytes: prettyPrintedData, encoding: .utf8)
    }

    var json: Any? {
        return try? JSONSerialization.jsonObject(with: self, options: .allowFragments)
    }
}
