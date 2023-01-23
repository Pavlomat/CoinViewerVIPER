//
//  CoinProtocols.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCoinDetailProtocol: AnyObject {
    
    func onGetCoinSuccess(for coin: List)
    func onGetCoinFailure()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCoinDetailProtocol: AnyObject {
    
    var view: PresenterToViewCoinDetailProtocol? { get set }
    var interactor: PresenterToInteractorCoinDetailProtocol? { get set }
    var router: PresenterToRouterCoinDetailProtocol? { get set }

    func viewDidLoad()
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCoinDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCoinDetailProtocol? { get set }
    
    var coin: List? { get set }
    
    func getImageDataFromURL()
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCoinDetailProtocol: AnyObject {
    
    func getTappedCoinSuccess(coin: List)
    func getTappedCoinFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCoinDetailProtocol: AnyObject {
    
    static func createModule(with coin: List) -> UIViewController
}

