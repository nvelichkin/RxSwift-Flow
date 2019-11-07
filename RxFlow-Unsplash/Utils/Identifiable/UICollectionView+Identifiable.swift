//
//  UICollectionView+Identifiable.swift
//
//
//  Created by Velichkin Nikita on 20/06/2019.
//  Copyright © 2019 bytepace. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<C: UICollectionViewCell>(cellType: C.Type) where C: ClassIdentifiable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseId)
    }

    func register<C: UICollectionViewCell>(cellType: C.Type) where C: NibIdentifiable & ClassIdentifiable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseId)
    }

    func register<C: UICollectionReusableView>(cellType: C.Type, ofKind kind: String) where C: NibIdentifiable & ClassIdentifiable {
        register(cellType.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: cellType.reuseId)
    }

    func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, forIndexPath indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseId, for: indexPath) as? C
            else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return cell
    }

    func dequeueReusableSupplementaryView<C: UICollectionReusableView>(withViewType type: C.Type = C.self, ofKind kind: String, forIndexPath indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.reuseId, for: indexPath) as? C
            else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return view
    }
}

fileprivate extension UICollectionView {
     func dequeueError(reuseId: String) -> String {
        return "Couldn't dequeue item with identifier \(reuseId)"
    }
}
