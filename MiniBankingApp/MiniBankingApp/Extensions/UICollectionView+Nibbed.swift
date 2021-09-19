//
//  UICollectionView+Utilities.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-14.
//

import UIKit

public extension UICollectionView {

    func registerCell(type: UICollectionViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: identifier ?? cellId)
    }

    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
}

public extension UICollectionReusableView {

    static var identifier: String {
        String(describing: self)
    }
}
