//
//  CoinsProtocols.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCoinsProtocol: AnyObject {
    func onFetchCoinsSuccess()
    func deselectRowAt(row: Int)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCoinsProtocol: AnyObject {
    var view: PresenterToViewCoinsProtocol? { get set }
    var interactor: PresenterToInteractorCoinsProtocol? { get set }
    var router: PresenterToRouterCoinsProtocol? { get set }
    var coins: [CoinData]? { get set }
    
    func viewDidLoad()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> CoinData?
    
    func sortTableViewAscending()
    func sortTableViewDescending()
    func logoutButtonTapped()
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCoinsProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCoinsProtocol? { get set }
    func loadCoins()
    func oneGroupTask(for url: URL, group: DispatchGroup)
    func retrieveCoin(at index: Int)
    func sortTableViewAscending()
    func sortTableViewDescending()
    func logoutButtonTapped()
    
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCoinsProtocol: AnyObject {
    
    func fetchCoinsSuccess(coins: [CoinData])
    func getCoinSuccess(_ coin: CoinData)
    func getCoinFailure()
    func didLogoutButtonTapped()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCoinsProtocol: AnyObject {
    static func createModule() -> UINavigationController
    
    func pushToCoinDetail(on view: PresenterToViewCoinsProtocol, with coin: CoinData)
    func pushToAuthViewController()
}

