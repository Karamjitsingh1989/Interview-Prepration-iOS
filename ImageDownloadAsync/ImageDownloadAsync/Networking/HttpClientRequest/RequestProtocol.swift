//
//  RequestProtocol.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

protocol RequestProtocol {
    func fetchData(url: URL?) async throws -> Result<Data, Error>
}
