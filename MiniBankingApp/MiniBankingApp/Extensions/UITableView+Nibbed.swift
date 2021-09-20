//
//  UITableView+Nibbed.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import UIKit

public extension UITableView {

    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }

    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }

    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
}

public extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
