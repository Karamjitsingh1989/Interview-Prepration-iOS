//
//  ServiceManager.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

class ServiceManager {
    
    private let apiHandler: RequestDataProtocol
    private let responseHandler: ResponseModelProtocol
    
    init(apiHandler: RequestDataProtocol = APIHandler(), responseHandler: ResponseModelProtocol = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    
    func APIRequest<T>(url: String, Type:T.Type) async throws -> Result<T, APIError>  where T : Decodable, T : Encodable {
    
       let result = try await apiHandler.fetchData(url: url)
        switch result {
        case .success(let data):
          let dataResult = try await self.responseHandler.fetchModel(data: data, type: T.self)
            switch dataResult {
            case .success(let object):
                return .success(object)
            case .failure(let error):
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
