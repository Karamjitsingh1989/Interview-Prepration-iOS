//
//  APIHandler.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

class APIHandler: RequestDataProtocol {
    
    func fetchData(url: String) async throws -> Result<Data, APIError> {
        
        guard let url = URL(string: url) else {
            return .failure(.badURL)
        }
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        
        return verifyResponse(data: data, response: urlResponse)
        
    }
    
    private func verifyResponse(data: Data, response:URLResponse) -> Result<Data, APIError> {
        
        guard let htttpResponse = response as? HTTPURLResponse else {
            return .failure(.unknown)
        }
        
        switch htttpResponse.statusCode {
        case 200...299:
            return .success(data)
        case 400...499:
            return .failure(.badServerResponse)
        case 500...599:
            return .failure(.internalServerError)
        default:
            return .failure(.unknown)
        }
    }
}
