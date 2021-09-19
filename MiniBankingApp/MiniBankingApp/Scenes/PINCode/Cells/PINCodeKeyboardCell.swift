//
//  PINCodeKeyboardCell.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-14.
//

import UIKit

final class PINCodeKeyboardCell: UICollectionViewCell {

    @IBOutlet private weak var digitLabel: UILabel!

    var digit: Int? {
        guard let digitText = digitLabel.text else { return nil }
        return Int(digitText)
    }

    func setupCell(index: Int) {
        digitLabel.text = "\(index)"
    }
}
