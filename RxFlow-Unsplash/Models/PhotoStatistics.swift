//
//  PhotoStatistics.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Stats: Decodable {
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case total
    }
}

struct PhotoStatistics: Decodable {
    let id: String?
    let downloads: Stats?
    let views: Stats?
    let likes: Stats?

    enum CodingKeys: String, CodingKey {
        case id
        case downloads
        case views
        case likes
    }
}

struct UserStatistics: Decodable {
    let username: String?
    let downloads: Stats?
    let views: Stats?
    let likes: Stats?

    enum CodingKeys: String, CodingKey {
        case username
        case downloads
        case views
        case likes
    }
}
