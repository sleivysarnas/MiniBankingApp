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
        didPressKeyboardCellAtIndexPath indexPath: IndexPath
    )
    func pinCodeViewControllerDidShowPINCodeErrorAlert(_ pinCodeViewController: PINCodeViewController)
}

final class PINCodeInteractor {

    private let PINCodeLength = 4
    private let PINCodeMismatchErrorMessage = "PIN code mismatch! Please try again"

    private var currentPINCode = ""
    private var temporarySavedPINCode = ""
    private var savedPINCode: String? {
        get {
            KeychainSwift().get("PINCode")
        } set {
            guard let newValue = newValue else { return }
            KeychainSwift().set(newValue, forKey: "PINCode")
        }
    }

    var presenter: PINCodePresenterInput!
}

// MARK: PINCodeInteractorInput methods

extension PINCodeInteractor: PINCodeInteractorInput {

    func pinCodeViewController(
        _ pinCodeViewController: PINCodeViewController,
        didPressKeyboardCellAtIndexPath indexPath: IndexPath
    ) {
        currentPINCode.append("\(indexPath.item)")

        let indexPath = IndexPath(item: currentPINCode.count - 1, section: 0)
        presenter.pinCodeInteractor(self, didUpdatePINCodeAtIndexPath: indexPath)

        if currentPINCode.count == PINCodeLength {
            submitPINCode()
        }
    }

    func pinCodeViewControllerDidShowPINCodeErrorAlert(_ pinCodeViewController: PINCodeViewController) {
        currentPINCode = ""
        temporarySavedPINCode = ""
        presenter.pinCodeInteractorDidHandleErrorAlert(self)
    }
}

// MARK: - Main logic

private extension PINCodeInteractor {

    func submitPINCode() {
        if let _ = savedPINCode {
            login()
        } else {
            register()
        }
    }

    func register() {
        if temporarySavedPINCode.isEmpty {
            temporarySavedPINCode = currentPINCode
            currentPINCode = ""
            presenter.pinCodeInteractorDidSaveFirstPINCode(self)
        } else if temporarySavedPINCode == currentPINCode {
            savedPINCode = currentPINCode
            login()
        } else {
            presenter.pinCodeInteractor(self, didThrowErrorMessage: PINCodeMismatchErrorMessage)
        }
    }

    func login() {
        guard savedPINCode == currentPINCode else {
            presenter.pinCodeInteractor(self, didThrowErrorMessage: PINCodeMismatchErrorMessage)
            return
        }
        presenter.pinCodeInteractorDidSubmitPINCode(self)
    }
}
