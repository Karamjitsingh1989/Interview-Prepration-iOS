//
//  NetworkManager.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation

class NetworkManager {
    
    private  let apiHandler: APIHandler
    private  let responseHandler: ResponseHandler
    
    init(apiHandler: APIHandler = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
    func httpRequest<T:Codable>(url: String, resultType:T.Type, completion:@escaping(Result<T ,APIError>)->Void){
        
        self.apiHandler.fetchData(url:url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(data: data, resultType: resultType.self) { result in
                    switch result {
                    case .success(let modelObj):
                        completion(.success(modelObj))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}




