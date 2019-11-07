//
//  Task.swift
//  Networking
//
//  Created by Nikita Velichkin on 07/11/2019.
//

import Foundation

enum Task {
    case requestWithParameters([String: Any], encoding: URLEncoding)
    case requestWithEncodable(Encodable)
}
