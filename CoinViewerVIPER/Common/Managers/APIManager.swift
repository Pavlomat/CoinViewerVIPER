//
//  APIManager.swift
//  CoinViewerVIPER
//
//  Created by Pavlov Matvey on 23.01.2023.
//

import Foundation

class ApiManager {  //не нужен удалить
    
//    static let shared = ApiManager()
    
    let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=48.8534&lon=2.3488&appid=208febed9f28a657758f1654191cc5e7"
    
    
    func getDataFromNet(completionHandler: @escaping (Result<MainStruct, Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
                completionHandler(.failure(error!))
                return
            }

            do {
                guard
                    let data = data,
                    let decodedData = try? JSONDecoder().decode(MainStruct.self, from: data)

                else { return }

                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }

            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
