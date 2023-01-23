//
//  AuthRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class AuthRouter: PresenterToRouterAuthProtocol {
   
    func pushToCoinsTableView(on view: PresenterToViewAuthProtocol) {
        print("CoinsRouter is instructed to push CoinDetailViewController onto the navigation stack.")
        let coinsTableViewController = CoinsRouter.createModule()
//
        let viewController = view as! AuthViewController
        viewController.navigationController?.pushViewController(coinsTableViewController, animated: true)
        
    }
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = AuthViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterAuthProtocol & InteractorToPresenterAuthProtocol = AuthPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AuthRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AuthInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
}

