//
//  Location.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Position: Codable {
    let latitude: Double?
    let longitude: Double?

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}

struct Location: Codable {
    let city: String?
    let country: String?
    let position: Position?

    enum CodingKeys: String, CodingKey {
        case city
        case country
        case position
    }
}
