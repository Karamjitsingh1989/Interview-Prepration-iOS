//
//  APIError.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

enum APIError: Error {
    case badURL
    case errorNoData
    case DecodingError
    case unknown
    case badServerResponse
    case internalServerError
}
