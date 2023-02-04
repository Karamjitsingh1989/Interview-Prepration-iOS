//
//  ResponseHandler.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

class ResponseHandler: ResponseProtocol {
   
    func fetchResponseModel<T>(data: Data, type: T.Type) async throws -> Result<T, Error> where T : Decodable {
        do {
            guard let result = try?  JSONDecoder().decode(type.self, from: data) else {
                return .failure(HttpError.decodingError)
            }
            return .success(result)
        }
    }
}
