//
//  PINCodeViewController.swift
//  MiniBankingApp
//
//  Created by Arnas Sleivys on 2021-09-14.
//

import UIKit

protocol PINCodeViewControllerInput: AnyObject {
    func togglePINCodeCell(indexPath: IndexPath)
}

final class PINCodeViewController: UIViewController {

    private let NumberOfPINCodeSymbolCells = 4
    private let NumberOfKeyboardCells = 10
    private let PINCodeSymbolCellsSpacing = 20

    @IBOutlet private weak var pinCodeCollectionView: UICollectionView!
    @IBOutlet private weak var keyboardCollectionView: UICollectionView!

    lazy var pinCodeSymbolCellSize: CGSize = {
        let height = pinCodeCollectionView.bounds.height / 2
        return CGSize(width: height, height: height)
    }()

    lazy var keyboardCellSize: CGSize = {
        let width = keyboardCollectionView.bounds.width / 3
        return CGSize(width: width, height: width)
    }()

    private var interactor: PINCodeInteractorInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionViews()
    }

    // MARK: Configuration & setup

    private func configure() {
        let interactor = PINCodeInteractor()
        let presenter = PINCodePresenter()

        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }

    private func setupCollectionViews() {
        pinCodeCollectionView.delegate = self
        pinCodeCollectionView.dataSource = self
        keyboardCollectionView.delegate = self
        keyboardCollectionView.dataSource = self

        pinCodeCollectionView.registerCell(type: PINCodeSymbolCell.self)
        keyboardCollectionView.registerCell(type: PINCodeKeyboardCell.self)
    }
}

// MARK: - PINCodeViewControllerInput methods

extension PINCodeViewController: PINCodeViewControllerInput {

    func togglePINCodeCell(indexPath: IndexPath) {
        guard let cell = pinCodeCollectionView.cellForItem(at: indexPath) as? PINCodeSymbolCell else { return }
        cell.toggleCell()
    }
}

// MARK: - UICollectionViewDataSource methods

extension PINCodeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView === pinCodeCollectionView ? NumberOfPINCodeSymbolCells : NumberOfKeyboardCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === pinCodeCollectionView {
            return makeSymbolCell(collectionView: collectionView, indexPath: indexPath)
        } else {
            return makeKeyboardCell(collectionView: collectionView, indexPath: indexPath)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout methods

extension PINCodeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        collectionView === pinCodeCollectionView ? pinCodeSymbolCellSize : keyboardCellSize
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        guard collectionView === pinCodeCollectionView else { return .zero }

        let totalCellWidth = pinCodeSymbolCellSize.width * CGFloat(NumberOfPINCodeSymbolCells)
        let totalSpacingWidth = PINCodeSymbolCellsSpacing * (NumberOfPINCodeSymbolCells - 1)

        let leftInset = (collectionView.bounds.width - totalCellWidth - CGFloat(totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}

// MARK: - Helpers

private extension PINCodeViewController {

    func makeSymbolCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueCell(withType: PINCodeSymbolCell.self, for: indexPath) ?? UICollectionViewCell()
    }

    func makeKeyboardCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PINCodeKeyboardCell? = collectionView.dequeueCell(withType: PINCodeKeyboardCell.self, for: indexPath)

        guard let keyboardCell = cell else { return UICollectionViewCell() }

        keyboardCell.setupCell(index: indexPath.item)
        return keyboardCell
    }
}
