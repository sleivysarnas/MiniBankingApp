//
//  TransactionsInteractor.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import Foundation

protocol TransactionsInteractorInput {
    func transactionsViewControllerDidRequestTransactions(_ transactionsViewController: TransactionsViewController)
}

final class TransactionsInteractor {
    var presenter: TransactionsPresenterInput!
}

// MARK: - TransactionsInteractorInput methods

extension TransactionsInteractor: TransactionsInteractorInput {

    func transactionsViewControllerDidRequestTransactions(_ transactionsViewController: TransactionsViewController) {
        TransactionsDownloadWorker.downloadTransactions { [weak self] transactions in
            guard let self = self else { return }

            let transactionsSum = transactions?.reduce(0) { $0 + (Float($1.amount) ?? 0) } ?? 0

            self.presenter.transactionsInteractor(
                self,
                didDownloadTransactions: transactions ?? [],
                balance: "\(transactionsSum)"
            )
        }
    }
}
