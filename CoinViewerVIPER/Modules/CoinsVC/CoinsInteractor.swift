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
    var coins = [CoinData]()
    
    func loadCoins() {
        let group = DispatchGroup()
        
        URLAdress.allCases.forEach {
            oneGroupTask(for: $0.url, group: group)
        }
        
        group.notify(queue: .main) {
            self.presenter?.fetchCoinsSuccess(coins: self.coins)
        }
    }
    
    func oneGroupTask(for url: URL, group: DispatchGroup) {
        group.enter()
        NetworkDataFetcher.shared.fetchCoins(url: url) { [weak self] (searchResponse) in
            defer {
                group.leave()
            }
            guard let oneCoin = searchResponse?.data else { return }
            self?.coins.append(oneCoin)
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
    
    func sortTableViewAscending() {
        coins = coins.sorted { Double($0.marketData?.priceUsd ?? -1.0) < Double($1.marketData?.priceUsd ?? -1.0) }
        presenter?.fetchCoinsSuccess(coins: coins)
    }
    
    func sortTableViewDescending() {
        coins = coins.sorted { Double($0.marketData?.priceUsd ?? -1.0) > Double($1.marketData?.priceUsd ?? -1.0) }
        presenter?.fetchCoinsSuccess(coins: coins)
    }
    
    func logoutButtonTapped() {
        Prefs.shared.boolForLogin = false
        presenter?.didLogoutButtonTapped()
    }
}

