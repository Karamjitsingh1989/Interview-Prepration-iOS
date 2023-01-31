//
//  AppConfig.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import Foundation


struct AppConfig {
    static let baseURL = "https://rickandmortyapi.com/api"
}

struct RequestURL: Codable {
    var characters: String
    var locations: String
    var episodes: String
}
