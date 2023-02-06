//
//  CoinPresenter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinDetailPresenter: ViewToPresenterCoinDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewCoinDetailProtocol?
    var interactor: PresenterToInteractorCoinDetailProtocol?
    var router: PresenterToRouterCoinDetailProtocol?
    
    func viewDidLoad() {
        interactor?.getCoinData()
    }
    
    func logoutButtonTapped() {
        interactor?.logoutButtonTapped()
    }
    
}

// MARK: - Outputs to view
extension CoinDetailPresenter: InteractorToPresenterCoinDetailProtocol {
    func getTappedCoinSuccess(coin: CoinData) {
        view?.onGetCoinSuccess(for: coin)
    }
    
    func getTappedCoinFailure() {
        view?.onGetCoinFailure()
    }
    
    func didLogoutButtonTapped() {
        router?.pushToAuthViewController()
    }
}


