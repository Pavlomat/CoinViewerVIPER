//
//  CoinsPresenter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsPresenter: ViewToPresenterCoinsProtocol {
    
    
    // MARK: Properties
    var coins: [CoinData]?
    weak var view: PresenterToViewCoinsProtocol?
    var interactor: PresenterToInteractorCoinsProtocol?
    var router: PresenterToRouterCoinsProtocol?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        interactor?.loadCoins()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let coins = self.coins else {
            return 0
        }
        
        return coins.count
    }
    
    func textLabelText(indexPath: IndexPath) -> CoinData? {
        guard let coins = self.coins else {
            return nil
        }
        
        return coins[indexPath.row]
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveCoin(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
    
    func sortTableViewAscending() {
        interactor?.sortTableViewAscending()
    }
    
    func sortTableViewDescending() {
        interactor?.sortTableViewDescending()
    }
    
    func logoutButtonTapped() {
        interactor?.logoutButtonTapped()
    }
    
    
}

// MARK: - Outputs to view
extension CoinsPresenter: InteractorToPresenterCoinsProtocol {
    
    func fetchCoinsSuccess(coins: [CoinData]) {
        self.coins = coins
        view?.onFetchCoinsSuccess()
    }
    
    func getCoinSuccess(_ coin: CoinData) {
            router?.pushToCoinDetail(on: view!, with: coin)
    }
    
    func getCoinFailure() {
        print("Couldn't retrieve coin by index")
    }
    
    func didLogoutButtonTapped() {
        router?.pushToAuthViewController()
    }
}


