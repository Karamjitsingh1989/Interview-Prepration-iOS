//
//  ResponseHandler.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

class ResponseHandler: ResponseModelProtocol {
    
    func fetchModel<T>(data: Data, type: T.Type) async throws -> Result<T, APIError> where T : Decodable, T : Encodable {
        
        guard let object = try? JSONDecoder().decode(type.self, from: data) else {
            return .failure(.DecodingError)
        }
        return .success(object)
    }
}
