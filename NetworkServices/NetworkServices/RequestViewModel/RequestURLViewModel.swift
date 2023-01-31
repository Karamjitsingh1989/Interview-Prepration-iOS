//
//  RequestURLViewModel.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation

class RequestURLViewModel {
    
    static var requestURLS: RequestURL?
    
   static func getRickAndMortyURLS(){
         NetworkManager().fetchResponseModel(url: AppConfig.baseURL, resultType: RequestURL.self) { response, error in
            if let responseObject = response {
                RequestURLViewModel.requestURLS = responseObject
            }
        }
    }
}
