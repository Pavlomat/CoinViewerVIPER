//
//  UserDefaults.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 02.02.2023.
//

import Foundation

class Prefs
{
    private let defaults = UserDefaults.standard
    
    private let loginKey = "isLogged"
    
    var boolForLogin : Bool {
        set {
            defaults.setValue(newValue, forKey: loginKey)
        }
        get {
            return defaults.bool(forKey: loginKey)
        }
    }
    
    class var shared: Prefs {
        struct Static {
            static let instance = Prefs()
        }
        
        return Static.instance
    }
}
