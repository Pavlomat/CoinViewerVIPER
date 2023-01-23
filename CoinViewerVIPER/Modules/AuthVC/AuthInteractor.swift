//
//  AuthInteractor.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class AuthInteractor: PresenterToInteractorAuthProtocol {
    
    var loginString = "1234"
    var passwordString = "1234"
    
    var presenter: InteractorToPresenterAuthProtocol?
    
    func checkPassword(login: String, password: String) {
        if login == loginString && password == passwordString {
            presenter?.showTableView()
        } else {
            //print
        }
    }
    
}


