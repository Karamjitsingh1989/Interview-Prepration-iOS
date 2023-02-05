//
//  RandomImage.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

struct RandomImage: Decodable {
    let image: Data
    let quote: Quote
}
struct Quote: Decodable {
    let content: String
}
