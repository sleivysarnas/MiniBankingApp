//
//  PINCodePresenter.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-19.
//

import Foundation

protocol PINCodePresenterInput {
    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didUpdatePINCodeAtIndexPath indexPath: IndexPath)
    func pinCodeInteractorDidSubmitPINCode(_ pinCodeInteractor: PINCodeInteractor)
    func pinCodeInteractorDidSaveFirstPINCode(_ pinCodeInteractor: PINCodeInteractor)
    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didThrowErrorMessage message: String)
    func pinCodeInteractorDidHandleErrorAlert(_ pinCodeInteractor: PINCodeInteractor)
}

final class PINCodePresenter {
    weak var viewController: PINCodeViewControllerInput!
}

extension PINCodePresenter: PINCodePresenterInput {

    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didUpdatePINCodeAtIndexPath indexPath: IndexPath) {
        viewController.pinCodePresenter(self, didTogglePINCodeCellAtIndexPath: indexPath)
    }

    func pinCodeInteractorDidSubmitPINCode(_ pinCodeInteractor: PINCodeInteractor) {
        viewController.pinCodePresenterDidReqestRoutingToTransactions(self)
    }

    func pinCodeInteractorDidSaveFirstPINCode(_ pinCodeInteractor: PINCodeInteractor) {
        viewController.pinCodePresenterDidHandleFirstPINCodeSaving(self)
    }

    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didThrowErrorMessage message: String) {
        viewController.pinCodePresenter(self, didThrowErrorMessage: message)
    }

    func pinCodeInteractorDidHandleErrorAlert(_ pinCodeInteractor: PINCodeInteractor) {
        viewController.pinCodePresenterDidHandleErrorAlert(self)
    }
}
