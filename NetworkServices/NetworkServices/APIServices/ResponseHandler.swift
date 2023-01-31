//
//  ResponseHandler.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation

class ResponseHandler {
    
    func fetchModel<T:Codable>(data:Data, resultType: T.Type, completion:@escaping(Result<T, APIError>)->Void) {
        let response = try? JSONDecoder().decode(resultType.self, from: data)
        if let responseModel = response {
            completion(.success(responseModel))
        } else {
            completion(.failure(.DecodingError))
        }
    }
}
