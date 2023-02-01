//
//  RequestDataProtocol.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

protocol RequestDataProtocol {
    func fetchData(url: String) async throws -> Result<Data, APIError>
}

protocol ResponseModelProtocol {
    func fetchModel<T: Codable>(data:Data, type:T.Type) async throws ->Result<T, APIError>
}

protocol NetworkResponse: RequestDataProtocol, ResponseModelProtocol {}
