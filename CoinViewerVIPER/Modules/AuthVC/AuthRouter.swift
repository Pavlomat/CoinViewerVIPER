//
//  AuthRouter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

class AuthRouter: PresenterToRouterAuthProtocol {
    
    var scene: SceneDelegate?
    
    func pushToCoinsTableView() {
        print("CoinsRouter is instructed to push CoinDetailViewController onto the navigation stack.")
        
        let coinsTableViewController = CoinsRouter.createModule()
//        let navigationController = UINavigationController(rootViewController: coinsTableViewController)
        //        if let sceneDelegate = scene?.window?.windowScene?.delegate as? SceneDelegate {
        //            sceneDelegate.window?.rootViewController = coinsTableViewController
        //            print("Goo")
        //        }
        
        //        scene?.window?.switchRootViewController(CoinsRouter.createModule())
        
        //        let viewController = view as! AuthViewController
        //        viewController.navigationController?.pushViewController(coinsTableViewController, animated: true)
        
        //        UIApplication.shared.keyWindow?.rootViewController = coinsTableViewController
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        window?.rootViewController = coinsTableViewController
        
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
    
    static func logoutCreateModule() -> UIViewController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = AuthViewController()
        
        let presenter: ViewToPresenterAuthProtocol & InteractorToPresenterAuthProtocol = AuthPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AuthRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AuthInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

