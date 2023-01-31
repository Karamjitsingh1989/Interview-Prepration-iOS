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
        RequestViewService().fetchRequestURLS { result in
            switch result {
            case .success(let object):
                RequestURLViewModel.requestURLS = object
                debugPrint(object)
                break
            case .failure(let error):
                print("Unable to load Base URLS: \(error.localizedDescription)")
            }
        }
    }
}
