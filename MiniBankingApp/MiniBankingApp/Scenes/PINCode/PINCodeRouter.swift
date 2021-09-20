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

extension PINCodeRouter: PINCodeRouterInput {

    func routeToTransactions() {
//        let transactionsViewController = TransactionsViewController()
//        viewController.navigationController?.pushViewController(transactionsViewController, animated: true)
    }
}
