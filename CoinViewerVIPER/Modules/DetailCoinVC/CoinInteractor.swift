//
//  CoinInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class CoinDetailInteractor: PresenterToInteractorCoinDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCoinDetailProtocol?
    var coin: CoinData?
    
    func getImageDataFromURL() {
        presenter?.getTappedCoinSuccess(coin: self.coin!)
    }
    
    func logoutButtonTapped() {
        Prefs.shared.boolForLogin = false
        presenter?.didLogoutButtonTapped()
    }

}
