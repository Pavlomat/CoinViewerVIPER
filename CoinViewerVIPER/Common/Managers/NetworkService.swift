//
//  NetworkService.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 27.01.2023.
//

import Foundation

class NetworkService {
    
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                guard responce is HTTPURLResponse else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        }.resume()
    }
}
