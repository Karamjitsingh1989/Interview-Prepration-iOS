//
//  RequestViewService.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation


class RequestViewService {
    func fetchRequestURLS(Completion:@escaping(Result<RequestURL, APIError>)-> Void){
        NetworkManager().httpRequest(url:AppConfig.baseURL , resultType:RequestURL.self , completion: Completion)
    }
}
