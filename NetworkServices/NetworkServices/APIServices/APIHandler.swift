//
//  APIHandler.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation

class APIHandler {
    
    func fetchData(url: String, Completion:@escaping(Result<Data , APIError>)-> Void ) {
        guard let url = URL(string: url) else {
            return Completion(.failure(.BadURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                Completion(.failure(.NoData))
                return
            }
            Completion(.success(data))
        }.resume()
    }
}
