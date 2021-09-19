//
//  UIView+Nibbed.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-15.
//

import UIKit

extension UIView {

    class func fromNib<T: UIView>() -> T {
        Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as! T
    }
}

extension UIViewController {

    class func fromNib<T: UIViewController>() -> T {
        T(nibName: String(describing: self), bundle: nil)
    }
}
