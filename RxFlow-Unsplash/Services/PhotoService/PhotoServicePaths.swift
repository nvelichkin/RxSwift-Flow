//
//  PhotoServicePaths.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 07/11/2019.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation

enum PhotoServicePath {
    case like(
        id: String,
        currentStatus: Bool)
    
    case photo(
        id: String,
        width: Int?,
        height: Int?,
        rect: [Int]?)
    
    case photos(
        page: Int?,
        perPage: Int?,
        orderBy: OrderBy)
    
    case downloadLink(id: String)
    
    case randomPhoto(
        collections: [String]?,
        isFeatured: Bool?,
        username: String?,
        query: String?,
        width: Int?,
        height: Int?,
        orientation: Orientation?,
        count: Int?)
}

extension PhotoServicePath: Resource {
    var baseURL: URL {
        return Unsplash.baseURL
    }
    
    var basePath: String {
        return "/photos/"
    }
    
    var endpoint: Endpoint {
        switch self {
        case .like(let id, let isLikedByUser):
            switch isLikedByUser {
            case true:
                return .delete(path: "\(basePath)\(id)/like")
            case false:
                return .post(path: "\(basePath)\(id)/like")
            }
        case .photo(let id):
            return .get(path: "\(basePath)\(id)")
        case .photos:
            return .get(path: "\(basePath)")
        case .downloadLink(let id):
            return .get(path: "\(basePath)\(id)/download")
        case .randomPhoto:
            return .get(path: "\(basePath)random")
        }
    }
    
    var task: Task {
        switch self {
        case .photo(let data):
            
            var params: [String: Any] = [:]
            params["w"] = data.width
            params["h"] = data.height
            params["rect"] = data.rect
            
            return .requestWithParameters(params, encoding: .noBracketsAndLiteralBool)
            
        case .photos(let data):
            
            var params: [String: Any] = [:]
            params["page"] = data.page
            params["per_page"] = data.perPage
            params["order_by"] = data.orderBy
            
            return .requestWithParameters(params, encoding: URLEncoding())
        
        case .randomPhoto(let data):
            
            var params: [String: Any] = [:]
            params["collections"] = data.collections
            params["featured"] = data.isFeatured
            params["username"] = data.username
            params["query"] = data.query
            params["w"] = data.width
            params["h"] = data.height
            params["orientation"] = data.orientation?.rawValue
            params["count"] = data.count
            
            return .requestWithParameters(params, encoding: .noBracketsAndLiteralBool)
            
        default:
            return .requestWithParameters([:], encoding: URLEncoding())
        }
    }
    
    var headers: [HTTPHeader] {
        return Unsplash.headers
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return Unsplash.cachePolicy
    }
}
