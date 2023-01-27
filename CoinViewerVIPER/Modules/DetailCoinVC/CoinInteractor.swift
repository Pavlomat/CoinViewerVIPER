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
    var coin: DataClass?
    
    func getImageDataFromURL() {
        print("Interactor receives the request from Presenter to get image data from the server.")
        presenter?.getTappedCoinSuccess(coin: self.coin!)
    }
    

}
