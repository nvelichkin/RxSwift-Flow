//
//  Exif.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

struct Exif: Codable {
    let aperture: String?
    let exposureTime: String?
    let focalLength: String?
    let iso: Int?
    let make: String?
    let model: String?

    enum CodingKeys: String, CodingKey {
        case aperture
        case exposureTime = "exposure_time"
        case focalLength = "focal_length"
        case iso
        case make
        case model
    }
}
