//
//  UITableView+EmptyView.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.thin)
        messageLabel.sizeToFit()

        backgroundView = messageLabel
    }

    func removeEmptyMessage() {
        backgroundView = nil
    }
}
