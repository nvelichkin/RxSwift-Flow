//
//  ProfileImage.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct ProfileImage: Codable {
    let small: String?
    let medium: String?
    let large: String?

    enum CodingKeys: String, CodingKey {
        case small
        case medium
        case large
    }
}
