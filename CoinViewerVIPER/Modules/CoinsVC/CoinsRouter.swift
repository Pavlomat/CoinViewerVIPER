//
//  CoinsRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinsRouter: PresenterToRouterCoinsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
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
    
    // MARK: - Navigation
    func pushToCoinDetail(on view: PresenterToViewCoinsProtocol, with coin: CoinData) {
        DispatchQueue.main.async { [weak self] in
            let coinDetailViewController = CoinDetailRouter.createModule(with: coin)
            let viewController = view as! CoinsViewController
           
            viewController.navigationController?.pushViewController(coinDetailViewController, animated: true)
        }
    }
    
    func pushToAuthViewController() {
        let authViewController = AuthRouter.createModule()
       
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = authViewController
    }
}

