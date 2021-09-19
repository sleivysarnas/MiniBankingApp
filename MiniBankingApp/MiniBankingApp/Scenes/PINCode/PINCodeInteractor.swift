//
//  PINCodeInteractor.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-19.
//

import Foundation

protocol PINCodeInteractorInput {

    func pinCodeViewController(
        _ pinCodeViewController: PINCodeViewController,
        didPressKeyboardCell cell: PINCodeKeyboardCell
    )
}

final class PINCodeInteractor {

    private var currentPINCode = [Int]()

    var presenter: PINCodePresenterInput!
}

extension PINCodeInteractor: PINCodeInteractorInput {

    func pinCodeViewController(
        _ pinCodeViewController: PINCodeViewController,
        didPressKeyboardCell cell: PINCodeKeyboardCell
    ) {
        guard let digit = cell.digit else { return }
        currentPINCode.append(digit)

        let indexPath = IndexPath(item: currentPINCode.count - 1, section: 1)
        presenter.pinCodeInteractor(self, didUpdatePINCodeAtIndexPath: indexPath)
    }
}
