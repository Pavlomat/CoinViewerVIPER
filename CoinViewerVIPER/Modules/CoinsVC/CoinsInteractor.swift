//
//  CoinsInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsInteractor: PresenterToInteractorCoinsProtocol {

    
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCoinsProtocol?
    var coins: [List]?
    
    func loadCoins() {
          
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            ApiManager.shared.getDataFromNet { [weak self] result in
                switch result {
                case .success(let data):
                    self?.coins = data.list
                    guard let listOfCoins = self?.coins else { return }
                    self?.presenter?.fetchCoinsSuccess(coins: listOfCoins)
                case .failure(let error):
                    self?.presenter?.fetchQuotesFailure(error: error)
                }
            }
        }
        
    }
    
    func retrieveCoin(at index: Int) {
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            guard
                let coins = self?.coins,
                coins.indices.contains(index)
            else {
                self?.presenter?.getCoinFailure()
                return
            }
            self?.presenter?.getCoinSuccess((coins[index]))
        }
        
    }
}


