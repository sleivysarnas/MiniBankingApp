//
//  PINCodeRouter.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-19.
//

import Foundation

protocol PINCodeRouterInput {
    func routeToTransactions()
}

final class PINCodeRouter {
    weak var viewController: PINCodeViewController!
}

// MARK: - PINCodeRouterInput methods

extension PINCodeRouter: PINCodeRouterInput {

    func routeToTransactions() {
        let transactionsViewController: TransactionsViewController = .fromNib()
        viewController.navigationController?.pushViewController(transactionsViewController, animated: true)
    }
}
