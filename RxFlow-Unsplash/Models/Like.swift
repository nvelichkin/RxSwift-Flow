//
//  Like.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Like: Decodable {
    let photo: Photo?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case photo
        case user
    }
}
