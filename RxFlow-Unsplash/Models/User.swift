//
//  User.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct User: Codable {
    let id: String?
    let username: String?
    let firstName: String?
    let lastName: String?
    let fullName: String?
    let email: String?
    let bio: String?
    let location: String?
    let followedByUser: Bool?
    let portfolioURL: String?
    let profileImage: ProfileImage?
    let followersCount: Int?
    let followingCount: Int?
    let photos: [Photo]?
    let totalLikes: Int?
    let totalPhotos: Int?
    let totalCollections: Int?
    let uploadsRemaining: Int?
    let downloads: Int?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case fullName = "name"
        case email
        case bio
        case location
        case followedByUser = "followed_by_user"
        case portfolioURL = "portfolio_url"
        case profileImage = "profile_image"
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case photos
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case totalCollections = "total_collections"
        case uploadsRemaining = "uploads_remaining"
        case downloads
        case links
    }
}
