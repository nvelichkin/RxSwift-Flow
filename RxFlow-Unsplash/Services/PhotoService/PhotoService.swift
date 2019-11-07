//
//  PhotoService.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 08.01.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation
import RxSwift

struct PhotoService: PhotoServiceType {

    private let unsplash: TinyNetworking<PhotoServicePath>

    init(unsplash: TinyNetworking<PhotoServicePath> = TinyNetworking<PhotoServicePath>()) {
        self.unsplash = unsplash
    }

    func like(photo: Photo) -> Observable<Either<Photo, NonPublicScopeError>> {
        return unsplash.rx
            .request(resource: .like(id: photo.id ?? "",
                                     currentStatus: photo.isLikedByUser ?? false))
            .map(to: Like.self)
            .map { $0.photo }
            .asObservable()
            .unwrap()
            .map(Either.left)
            .catchErrorJustReturn(.right(NonPublicScopeError.noAccessToken))
    }
    
    func photo(withId id: String) -> Observable<Photo> {
        return unsplash.rx
            .request(resource: .photo(id: id, width: nil, height: nil, rect: nil))
            .map(to: Photo.self)
            .asObservable()
    }
    
    func photos(byPageNumber pageNumber: Int = 1,
                orderBy: OrderBy = .latest,
                curated: Bool = false
        ) -> Observable<[Photo]> {

        return unsplash.rx
            .request(resource: .photos(page: pageNumber, perPage: nil, orderBy: orderBy))
            .map(to: [Photo].self)
            .asObservable()
    }
    
    func photoDownloadLink(withId id: String) -> Observable<String> {
        return unsplash.rx
            .request(resource: .downloadLink(id: id))
            .map(to: Link.self)
            .map { $0.url }
            .asObservable()
            .unwrap()
    }

    func randomPhotos(from collections: [String], isFeatured: Bool, orientation: Orientation) -> Observable<[Photo]> {
        return unsplash.rx
            .request(resource: .randomPhoto(
                collections: collections,
                isFeatured: isFeatured,
                username: nil,
                query: nil,
                width: nil,
                height: nil,
                orientation: orientation,
                count: 30)
            )
            .map(to: [Photo].self)
            .asObservable()
    }
}
