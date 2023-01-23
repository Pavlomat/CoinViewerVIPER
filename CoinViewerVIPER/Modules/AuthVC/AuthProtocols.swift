//
//  AuthProtocols.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAuthProtocol: AnyObject { }

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAuthProtocol: AnyObject {
    var view: PresenterToViewAuthProtocol? { get set }
    var interactor: PresenterToInteractorAuthProtocol? { get set }
    var router: PresenterToRouterAuthProtocol? { get set }
    
    func viewDidLoad()
    
    func authButtonTapped(login: String, password: String)
    
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAuthProtocol: AnyObject {
    
    var loginString: String  { get set }
    var passwordString: String   { get set }
    
    var presenter: InteractorToPresenterAuthProtocol? { get set }

    func checkPassword(login: String, password: String)
    
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAuthProtocol: AnyObject {
    
    func showTableView()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAuthProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func pushToCoinsTableView(on view: PresenterToViewAuthProtocol)
}


