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
    func onFetchCoinsFailure(error: String)
    
    func deselectRowAt(row: Int)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCoinsProtocol: AnyObject {
    var view: PresenterToViewCoinsProtocol? { get set }
    var interactor: PresenterToInteractorCoinsProtocol? { get set }
    var router: PresenterToRouterCoinsProtocol? { get set }
    
    var coins: [List]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> List?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCoinsProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCoinsProtocol? { get set }
    func loadCoins()
    func retrieveCoin(at index: Int)
    
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCoinsProtocol: AnyObject {
    
//    func didFetchCoinsFromNet(with result: Result<[List], Error>)
    
    func fetchCoinsSuccess(coins: [List])
    func fetchQuotesFailure(error: Error)
  
    func getCoinSuccess(_ coin: List)
    func getCoinFailure()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCoinsProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
    func pushToCoinDetail(on view: PresenterToViewCoinsProtocol, with coin: List)
}

