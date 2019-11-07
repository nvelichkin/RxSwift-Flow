//
//  Category.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Category: Codable {
    let id: Int?
    let title: String?
    let photoCount: Int?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "exposure_time"
        case photoCount = "photo_count"
        case links
    }
}
