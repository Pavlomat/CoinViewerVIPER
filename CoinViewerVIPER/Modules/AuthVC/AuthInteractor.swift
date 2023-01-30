//
//  AuthInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class AuthInteractor: PresenterToInteractorAuthProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterAuthProtocol?
    var loginString = "1234"
    var passwordString = "1234"
    
    func checkPassword(login: String, password: String) {
        if login == loginString && password == passwordString {
            SceneDelegate().defaults.set(true, forKey: "UserLogged")
            presenter?.showTableView()
        } else {
            presenter?.showAlert()
        }
    }
    
}


