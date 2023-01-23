//
//  CoinsPresenter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsPresenter: ViewToPresenterCoinsProtocol {
    
    
    // MARK: Properties
    var coins: [List]?
    weak var view: PresenterToViewCoinsProtocol?
    var interactor: PresenterToInteractorCoinsProtocol?
    var router: PresenterToRouterCoinsProtocol?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.loadCoins()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadCoins()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let coins = self.coins else {
            return 0
        }
        
        return coins.count
    }
    
    func textLabelText(indexPath: IndexPath) -> List? {
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
    
}

// MARK: - Outputs to view
extension CoinsPresenter: InteractorToPresenterCoinsProtocol {
    
    func fetchCoinsSuccess(coins: [List]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.coins = coins
        view?.onFetchCoinsSuccess()
    }
    
    func fetchQuotesFailure(error: Error) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onFetchCoinsFailure(error: "Couldn't fetch quotes: \(error)")
    }
    
    func getCoinSuccess(_ coin: List) {
            router?.pushToCoinDetail(on: view!, with: coin)
    }
    
    func getCoinFailure() {
        print("Couldn't retrieve quote by index")
    }
}


