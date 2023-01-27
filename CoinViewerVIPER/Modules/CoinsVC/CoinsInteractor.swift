//
//  CoinsInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsInteractor: PresenterToInteractorCoinsProtocol {

    let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=48.8534&lon=2.3488&appid=208febed9f28a657758f1654191cc5e7"
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCoinsProtocol?
    var coins: [List]?
    
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
        
        NetworkDataFetcher.shared.fetchCoins(urlString: urlString) { [weak self] (searchResponse) in
            guard let searchResponse = searchResponse else { return }
            guard let listOfCoins = searchResponse.list else { return }
            self?.presenter?.fetchCoinsSuccess(coins: listOfCoins)
            
            // не нужен                   self?.presenter?.fetchQuotesFailure(error: error)
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


