//
//  AuthPresenter.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class AuthPresenter: ViewToPresenterAuthProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewAuthProtocol?
    var interactor: PresenterToInteractorAuthProtocol?
    var router: PresenterToRouterAuthProtocol?

    // MARK: Inputs from view
    func viewDidLoad() {
        
    }
    
    func authButtonTapped(login: String, password: String) {
        interactor?.checkPassword(login: login, password: password)
    }
}

// MARK: - Outputs to view
extension AuthPresenter: InteractorToPresenterAuthProtocol {
   
    func showAlert() {
        view?.showAlert()
    }
    
    func showTableView() {
        router?.pushToCoinsTableView()
    }
}



