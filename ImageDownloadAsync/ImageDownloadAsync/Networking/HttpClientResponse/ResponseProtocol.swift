//
//  ResponseProtocol.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

protocol ResponseProtocol {
    func fetchResponseModel<T>(data: Data, type:T.Type) async throws -> Result<T, Error> where T: Decodable
}
