//
//  Photo.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Photo: Codable {
    let id: String?
    let created: String?
    let updated: String?
    let description: String?
    let color: String?
    var likes: Int?
    var isLikedByUser: Bool?
    let downloads: Int?
    let views: Int?
    let width: Int?
    let height: Int?
    let user: User?
    let urls: ImageURLs?
    let location: Location?
    let exif: Exif?
    let collectionsItBelongs: [PhotoCollection]?
    let links: Links?
    let categories: [Category]?

    enum CodingKeys: String, CodingKey {
        case id
        case created = "created_at"
        case updated = "updated_at"
        case description
        case color
        case likes
        case isLikedByUser = "liked_by_user"
        case downloads
        case views
        case width
        case height
        case user
        case urls
        case location
        case exif
        case collectionsItBelongs = "current_user_collections"
        case links
        case categories
    }
}
