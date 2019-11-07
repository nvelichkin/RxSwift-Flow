//
//  URLEncoding.swift
//  TinyNetworking
//
//  Created by Nikita Velichkin on 22.11.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

struct URLEncoding {

    enum ArrayEncoding {
        case brackets
        case noBrackets

        func encode(key: String) -> String {
            switch self {
            case .brackets:
                return "\(key)[]"
            case .noBrackets:
                return key
            }
        }
    }

    enum BoolEncoding {
        case numeric
        case literal

        func encode(flag: Bool) -> String {
            switch self {
            case .numeric:
                return flag ? "1" : "0"
            case .literal:
                return flag.description
            }
        }
    }

    let arrayEncoding: ArrayEncoding
    let boolEncoding: BoolEncoding

    init(arrayEncoding: ArrayEncoding = .brackets, boolEncoding: BoolEncoding = .literal) {
        self.arrayEncoding = arrayEncoding
        self.boolEncoding = boolEncoding
    }

    func query(_ parameters: [String: Any]) -> String {
        return parameters
            .flatMap { queryComponents(fromKey: $0.key, value: $0.value) }
            .map { "\($0)=\($1)" }
            .joined(separator: "&")
    }

    private func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components = [(String, String)]()

        if let dictionary = value as? [String: Any] {
            for (innerKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(innerKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: arrayEncoding.encode(key: key), value: value)
            }
        } else if let flag = value as? Bool {
            components.append((key, boolEncoding.encode(flag: flag)))
        } else {
            components.append((key, "\(value)"))
        }

        return components
    }
}
