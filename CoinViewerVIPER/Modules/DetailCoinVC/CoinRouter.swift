//
//  CoinRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class CoinDetailRouter: PresenterToRouterCoinDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with coin: CoinData) -> UIViewController {
        let viewController = CoinDetailViewController()
        
        let presenter: ViewToPresenterCoinDetailProtocol & InteractorToPresenterCoinDetailProtocol = CoinDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CoinDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CoinDetailInteractor()
        viewController.presenter?.interactor?.coin = coin
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    // MARK: - Navigation
    func pushToAuthViewController() {
        let authViewController = AuthRouter.createModule()
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = authViewController
    }
}

