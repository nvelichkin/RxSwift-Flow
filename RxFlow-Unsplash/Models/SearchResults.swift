//
//  SearchResult.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct PhotoCollectionsResult: Decodable {
    let total: Int?
    let totalPages: Int?
    let results: [PhotoCollection]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct PhotosResult: Decodable {
    let total: Int?
    let totalPages: Int?
    let results: [Photo]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct UsersResult: Decodable {
    let total: Int?
    let totalPages: Int?
    let results: [User]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}
