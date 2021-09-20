//
//  TransactionsViewController.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-20.
//

import UIKit

protocol TransactionsViewControllerInput: AnyObject {
    func transactionsPresenter(
        _ transactionsPresenter: TransactionsPresenter,
        didReceiveTransactions transactions: [Transaction],
        balance: String
    )
}

final class TransactionsViewController: UIViewController {

    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var transactionsTableView: UITableView!

    private var transactions = [Transaction]()
    private var interactor: TransactionsInteractorInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupTableView()
    }

    // MARK: Configuration & setup

    private func configure() {
        let interactor = TransactionsInteractor()
        let presenter = TransactionsPresenter()

        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    private func setupTableView() {
        transactionsTableView.registerCell(type: TransactionCell.self)
        transactionsTableView.setEmptyMessage(Localisation.loadingTransactions)
        transactionsTableView.tableFooterView = UIView()
        interactor.transactionsViewControllerDidRequestTransactions(self)
    }
}

// MARK: - TransactionsViewControllerInput methods

extension TransactionsViewController: TransactionsViewControllerInput {

    func transactionsPresenter(
        _ transactionsPresenter: TransactionsPresenter,
        didReceiveTransactions transactions: [Transaction],
        balance: String
    ) {
        self.transactions = transactions
        transactionsTableView.removeEmptyMessage()
        balanceLabel.text = balance

        if !transactions.isEmpty {
            transactionsTableView.reloadData()
        } else {
            transactionsTableView.setEmptyMessage(Localisation.noTransactions)
        }
    }
}

// MARK: - UITableViewDataSource methods

extension TransactionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell: TransactionCell = tableView.dequeueCell(withType: TransactionCell.self),
            indexPath.row < transactions.count
        else {
            return UITableViewCell()
        }
        cell.configure(transaction: transactions[indexPath.row])
        return cell
    }
}
