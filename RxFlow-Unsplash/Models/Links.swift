//
//  Links.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Link: Decodable {
    let url: String?

    enum CodingKeys: String, CodingKey {
        case url
    }
}

struct Links: Codable {
    let selfLink: String?
    let html: String?
    let photos: String?
    let likes: String?
    let portfolio: String?
    let download: String?
    let downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case html
        case photos
        case likes
        case portfolio
        case download
        case downloadLocation = "download_location"
    }
}
