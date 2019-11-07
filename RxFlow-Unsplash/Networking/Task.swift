//
//  Task.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 31.03.18.
//

import Foundation

enum Task {
    case requestWithParameters([String: Any], encoding: URLEncoding)
    case requestWithEncodable(Encodable)
}
