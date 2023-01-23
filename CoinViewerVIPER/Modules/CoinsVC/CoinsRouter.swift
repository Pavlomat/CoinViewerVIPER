//
//  CoinsRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinsRouter: PresenterToRouterCoinsProtocol {
    
    // MARK: - Navigation
    func pushToCoinDetail(on view: PresenterToViewCoinsProtocol, with coin: List) {
        print("CoinsRouter is instructed to push CoinDetailViewController onto the navigation stack.")
        DispatchQueue.main.async { [weak self] in
            let coinDetailViewController = CoinDetailRouter.createModule(with: coin)
            let viewController = view as! CoinsViewController
            viewController.navigationController?.pushViewController(coinDetailViewController, animated: true)
        }
       
        
    }
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = CoinsViewController()
        
        let presenter: ViewToPresenterCoinsProtocol & InteractorToPresenterCoinsProtocol = CoinsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CoinsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CoinsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

