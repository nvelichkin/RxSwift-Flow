//
//  UITableView+Identifiable.swift
//
//
//  Created by Velichkin Nikita on 20/06/2019.
//  Copyright © 2019 bytepace. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }

    func register<T: UITableViewCell>(cellType: T.Type) where T: NibIdentifiable & ClassIdentifiable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T
            else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T
            else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return cell
    }
}

fileprivate extension UITableView {
    func dequeueError(reuseId: String) -> String {
        return "Couldn't dequeue cell with identifier \(reuseId)"
    }
}
