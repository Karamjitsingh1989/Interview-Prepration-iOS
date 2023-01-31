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
    func fetchResponseModel<T:Codable>(url: String, resultType:T.Type, completion:@escaping(_ response:T? , _ error: Error?)->Void){
        
        self.apiHandler.httpRequest(url:url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.getResponseModel(data: data, resultType: resultType.self) { result in
                    switch result {
                    case .success(let modelObj):
                        completion(modelObj, nil)
                    case .failure(let error):
                        completion(nil, error)
                    }
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}




