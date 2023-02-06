//
//  CoinProtocols.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCoinDetailProtocol: AnyObject {
    func onGetCoinSuccess(for coin: CoinData)
    func onGetCoinFailure()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCoinDetailProtocol: AnyObject {
    var view: PresenterToViewCoinDetailProtocol? { get set }
    var interactor: PresenterToInteractorCoinDetailProtocol? { get set }
    var router: PresenterToRouterCoinDetailProtocol? { get set }

    func viewDidLoad()
    func logoutButtonTapped()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCoinDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterCoinDetailProtocol? { get set }
    var coin: CoinData? { get set }
    
    func getCoinData()
    func logoutButtonTapped()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCoinDetailProtocol: AnyObject {
    func getTappedCoinSuccess(coin: CoinData)
    func getTappedCoinFailure()
    func didLogoutButtonTapped()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCoinDetailProtocol: AnyObject {
    static func createModule(with coin: CoinData) -> UIViewController
    
    func pushToAuthViewController()
}

