//
//  PhotoServiceType.swift
//  RxFlow-Unsplash
//
//  Created by Nikita Velichkin on 08.01.18.
//  Copyright © 2019 Nikita Velichkin. All rights reserved.
//

import Foundation
import RxSwift

protocol PhotoServiceType {
    func like(photo: Photo) -> Observable<Either<Photo, NonPublicScopeError>>

    func photo(withId id: String) -> Observable<Photo>

    func photos(byPageNumber pageNumber: Int, orderBy: OrderBy, curated: Bool) -> Observable<[Photo]>

    func photoDownloadLink(withId id: String) -> Observable<String>

    func randomPhotos(from collections: [String], isFeatured: Bool, orientation: Orientation) -> Observable<[Photo]>
}
