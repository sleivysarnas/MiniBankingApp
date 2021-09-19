//
//  PINCodePresenter.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-19.
//

import Foundation

protocol PINCodePresenterInput {
    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didUpdatePINCodeAtIndexPath indexPath: IndexPath)
}

final class PINCodePresenter {
    weak var viewController: PINCodeViewControllerInput!
}

extension PINCodePresenter: PINCodePresenterInput {

    func pinCodeInteractor(_ pinCodeInteractor: PINCodeInteractor, didUpdatePINCodeAtIndexPath indexPath: IndexPath) {
        viewController.togglePINCodeCell(indexPath: indexPath)
    }
}
