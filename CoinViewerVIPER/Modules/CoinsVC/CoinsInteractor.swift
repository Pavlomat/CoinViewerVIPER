//
//  CoinsInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinsInteractor: PresenterToInteractorCoinsProtocol {
    
    let urlStrings = ["https://data.messari.io/api/v1/assets/btc/metrics", "https://data.messari.io/api/v1/assets/eth/metrics", "https://data.messari.io/api/v1/assets/tron/metrics", "https://data.messari.io/api/v1/assets/luna/metrics", "https://data.messari.io/api/v1/assets/polcadot/metrics", "https://data.messari.io/api/v1/assets/dogecoin/metrics", "https://data.messari.io/api/v1/assets/tether/metrics", "https://data.messari.io/api/v1/assets/stellar/metrics", "https://data.messari.io/api/v1/assets/cardano/metrics", "https://data.messari.io/api/v1/assets/xrp/metrics"]
    
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCoinsProtocol?
    var coins = [CoinData]()
    
    func loadCoins() {
        
        let group = DispatchGroup()
        
        urlStrings.map { urlString in
            group.enter()
            NetworkDataFetcher.shared.fetchCoins(urlString: urlString) { [weak self] (searchResponse) in
                guard let searchResponce = searchResponse else { return }
                guard let oneCoin = searchResponce.data else { return }
                self?.coins.append(oneCoin)
                self?.presenter?.fetchCoinsSuccess(coins: self!.coins)
                group.leave()
            }
        }
        
        //            // не нужен                   self?.presenter?.fetchQuotesFailure(error: error)
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
    
    func sortTableViewAscending() {
        coins = coins.sorted { Double($0.marketData?.priceUsd ?? -1.0) < Double($1.marketData?.priceUsd ?? -1.0) }
        presenter?.fetchCoinsSuccess(coins: coins)
    }
    
    func sortTableViewDescending() {
        coins = coins.sorted { Double($0.marketData?.priceUsd ?? -1.0) > Double($1.marketData?.priceUsd ?? -1.0) }
        presenter?.fetchCoinsSuccess(coins: coins)
    }
    
    func logoutButtonTapped() {
        SceneDelegate().defaults.set(false, forKey: "UserLogged")
        presenter?.didLogoutButtonTapped()
    }
}

