//
//  HttpError.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

enum HttpError: Error {
    case badURL
    case decodingError
    case unkownError
}
