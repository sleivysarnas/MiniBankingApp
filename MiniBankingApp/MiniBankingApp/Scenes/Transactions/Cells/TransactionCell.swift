//
//  TransactionCell.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import UIKit

final class TransactionCell: UITableViewCell {

    @IBOutlet private weak var nameSurnameLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    func configure(transaction: Transaction) {
        nameSurnameLabel.text = transaction.counterPartyName
        amountLabel.text = transaction.amount
        dateLabel.text = transaction.date
        descriptionLabel.text = transaction.transactionDescription
    }
}
