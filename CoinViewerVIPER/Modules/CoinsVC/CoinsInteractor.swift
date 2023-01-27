//
//  CoinsInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsInteractor: PresenterToInteractorCoinsProtocol {

    let urlString = "https://data.messari.io/api/v1/assets/btc/metrics"
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCoinsProtocol?
    var coins = [DataClass]()
    
    func loadCoins() {
          
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//
//            ApiManager.shared.getDataFromNet { [weak self] result in
//                switch result {
//                case .success(let data):
//                    self?.coins = data.list
//                    guard let listOfCoins = self?.coins else { return }
//                    self?.presenter?.fetchCoinsSuccess(coins: listOfCoins)
//                case .failure(let error):
//                    self?.presenter?.fetchQuotesFailure(error: error)
//                }
//            }
//        }
        
//        NetworkDataFetcher.shared.fetchCoins(urlString: urlString) { [weak self] (searchResponse) in
//            guard let searchResponse = searchResponse else { return }
//            guard let listOfCoins = searchResponse.list else { return }
//            self?.presenter?.fetchCoinsSuccess(coins: listOfCoins)
//
//            // не нужен                   self?.presenter?.fetchQuotesFailure(error: error)
//        }
        
        NetworkDataFetcher.shared.fetchCoins(urlString: urlString) { [weak self] (searchResponse) in
            guard let searchResponce = searchResponse else { return }
            guard let oneCoin = searchResponce.data else { return }
            self?.coins.append(oneCoin)
            self?.presenter?.fetchCoinsSuccess(coins: self!.coins)
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


