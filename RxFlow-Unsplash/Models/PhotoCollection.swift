//
//  PhotoCollection.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct PhotoCollection: Codable {
    let id: Int?
    let coverPhoto: Photo?
    let isCurated: Bool?
    let isFeatured: Bool?
    let title: String?
    let description: String?
    let totalPhotos: Int?
    let isPrivate: Bool?
    let publishedAt: String?
    let updatedAt: String?
    let user: User?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id
        case coverPhoto = "cover_photo"
        case isCurated = "curated"
        case isFeatured = "featured"
        case title
        case description
        case totalPhotos = "total_photos"
        case isPrivate = "private"
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case user
        case links
    }
}

struct CollectionResponse: Decodable {
    let photo: Photo?
    let collection: PhotoCollection?
    let user: User?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case photo
        case collection
        case user
        case createdAt = "created_at"
    }
}
