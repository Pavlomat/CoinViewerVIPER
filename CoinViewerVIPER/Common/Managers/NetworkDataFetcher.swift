//
//  NetworkDataFetcher.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 27.01.2023.
//

import Foundation

class NetworkDataFetcher {
    
    //MARK: - Properties
    static let shared = NetworkDataFetcher()
    let networkService = NetworkService()
    
    func fetchCoins(url: URL, response: @escaping (Coin?) -> ()) {
        networkService.request(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let coins = try decoder.decode(Coin.self, from: data)
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
