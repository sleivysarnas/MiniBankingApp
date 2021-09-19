//
//  PINCodeSymbolCell.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-14.
//

import UIKit

final class PINCodeSymbolCell: UICollectionViewCell {

    @IBOutlet private weak var symbolImageView: UIImageView!

    private var toggled = false

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    private func setupCell() {
        symbolImageView.backgroundColor = .clear
        symbolImageView.layer.cornerRadius = symbolImageView.frame.width / 4

        symbolImageView.layer.borderWidth = 1
        symbolImageView.layer.borderColor = UIColor.black.cgColor
    }

    func toggleCell() {
        toggled.toggle()
        symbolImageView.backgroundColor = toggled ? .black : .clear
    }
}
