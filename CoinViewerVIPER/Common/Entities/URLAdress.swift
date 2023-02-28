//
//  URLAdress.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 28.02.2023.
//

import Foundation

enum URLAdress: CaseIterable {
    
    private var baseURL: String {
        return "https://data.messari.io/api/v1/assets"
    }
    
    private var metricsURL: String {
        return "metrics"
    }

    case btc
    case eth
    case tron
    case luna
    case polcadot
    case dogecoin
    case tether
    case stellar
    case cardano
    case xrp
    
    private var urlPath: String {
        var endpoint: String
        switch self {
        case .btc:
            endpoint = "btc"
        case .eth:
            endpoint = "eth"
        case .tron:
            endpoint = "tron"
        case .luna:
            endpoint = "luna"
        case .polcadot:
            endpoint = "polcadot"
        case .dogecoin:
            endpoint = "dogecoin"
        case .tether:
            endpoint = "tether"
        case .stellar:
            endpoint = "stellar"
        case .cardano:
            endpoint = "cardano"
        case .xrp:
            endpoint = "xrp"
        }
        return baseURL + "/" + endpoint + "/" + metricsURL
    }
    
    var url: URL {
        guard let url = URL(string: urlPath) else {
            preconditionFailure("The url used in \(URLAdress.self) is not valid")
        }
        return url
    }
}

