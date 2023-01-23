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
        print("Presenter is being notified that the View was loaded.")
        interactor?.getImageDataFromURL()
    }
    
}

extension CoinDetailPresenter: InteractorToPresenterCoinDetailProtocol {
    func getTappedCoinSuccess(coin: List) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetCoinSuccess(for: coin)
    }
    
    func getTappedCoinFailure() {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.onGetCoinFailure()
    }
    
}


