//
//  CoinsRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinsRouter: PresenterToRouterCoinsProtocol {
    
    // MARK: - Navigation
    func pushToCoinDetail(on view: PresenterToViewCoinsProtocol, with coin: CoinData) {
        print("CoinsRouter is instructed to push CoinDetailViewController onto the navigation stack.")
        DispatchQueue.main.async { [weak self] in
            let coinDetailViewController = CoinDetailRouter.createModule(with: coin)
//            let navigationController = UINavigationController(rootViewController: coinDetailViewController)
            let viewController = view as! CoinsViewController
            
//            let scenes = UIApplication.shared.connectedScenes
//            let windowScene = scenes.first as? UIWindowScene
//            let window = windowScene?.windows.first
//            window?.rootViewController = navigationController
            
            viewController.navigationController?.pushViewController(coinDetailViewController, animated: true)
        }
    }
    
    // MARK: Static methods
//    static func createModule() -> UIViewController {
//        
//        print("QuotesRouter creates the Quotes module.")
//        let viewController = CoinsViewController()
////        let navigationController = UINavigationController(rootViewController: viewController)
//        
//        let presenter: ViewToPresenterCoinsProtocol & InteractorToPresenterCoinsProtocol = CoinsPresenter()
//        
//        viewController.presenter = presenter
//        viewController.presenter?.router = CoinsRouter()
//        viewController.presenter?.view = viewController
//        viewController.presenter?.interactor = CoinsInteractor()
//        viewController.presenter?.interactor?.presenter = presenter
//        
//        return viewController
//    }
    
    static func createModule() -> UINavigationController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = CoinsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterCoinsProtocol & InteractorToPresenterCoinsProtocol = CoinsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CoinsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CoinsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToAuthViewController() {
        print("Logout")
        let authViewController = AuthRouter.logoutCreateModule()
//        let coinsViewController = CoinsViewController()
        let navigationController = UINavigationController(rootViewController: authViewController)
        
//        getTopMostViewController()?.present(authViewController, animated: true)
//        coinsViewController.present(authViewController, animated: true)
       
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = navigationController
    }
}

