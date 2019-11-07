//
//  Scope.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 04.11.17.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

enum Scope: String, CaseIterable {
    case pub = "public"
    case readUser = "read_user"
    case writeUser = "write_user"
    case readPhotos = "read_photos"
    case writePhotos = "write_photos"
    case writeLikes = "write_likes"
    case writeFollowers = "write_followers"
    case readCollections = "read_collections"
    case writeCollections = "write_collections"
}
