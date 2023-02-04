//
//  HttpHandler.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

class HttpRequestHandler: RequestProtocol {
    func fetchData(url: URL?) async throws -> Result<Data, Error> {
        guard let url = url else {
            return .failure(HttpError.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return .success(data)
        }
        catch {
            throw error
        }
    }
}
