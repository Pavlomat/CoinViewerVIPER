//
//  AuthRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class AuthRouter: PresenterToRouterAuthProtocol {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
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
    
    // MARK: - Navigation
    func pushToCoinsTableView() {
        let coinsTableViewController = CoinsRouter.createModule()
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = coinsTableViewController
    }
}

