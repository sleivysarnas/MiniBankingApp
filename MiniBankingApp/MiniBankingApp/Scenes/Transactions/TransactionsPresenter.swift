//
//  TransactionsPresenter.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import Foundation

protocol TransactionsPresenterInput {
    func transactionsInteractor(
        _ transactionsInteractor: TransactionsInteractor,
        didDownloadTransactions transactions: [Transaction],
        balance: String
    )
}

final class TransactionsPresenter {
    weak var viewController: TransactionsViewControllerInput!
}

// MARK: - TransactionsPresenterInput methods

extension TransactionsPresenter: TransactionsPresenterInput {

    func transactionsInteractor(
        _ transactionsInteractor: TransactionsInteractor,
        didDownloadTransactions transactions: [Transaction],
        balance: String
    ) {
        viewController.transactionsPresenter(self, didReceiveTransactions: transactions, balance: balance)
    }
}
