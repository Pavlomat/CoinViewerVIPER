//
//  NetworkDataFetcher.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 27.01.2023.
//

import Foundation

class NetworkDataFetcher {
    
    static let shared = NetworkDataFetcher()
    let networkService = NetworkService()
    
    func fetchCoins(urlString: String, response: @escaping (PurpleData?) -> ()) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let coins = try JSONDecoder().decode(PurpleData.self, from: data)
                    response(coins)
                } catch let jsonError {
                    print("Failed to decode json: \(jsonError)")
                    response(nil)
                }
            case .failure(let error):
                print("Error requesting data: \(error)")
                response(nil)
            }
        }
    }
}
