//
//  ImageURLs.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct ImageURLs: Codable {
    let full: String?
    let raw: String?
    let regular: String?
    let small: String?
    let thumb: String?

    enum CodingKeys: String, CodingKey {
        case full
        case raw
        case regular
        case small
        case thumb
    }
}
