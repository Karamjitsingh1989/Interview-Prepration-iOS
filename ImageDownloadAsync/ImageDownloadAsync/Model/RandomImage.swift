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

// MARK: - 
struct Quote : Decodable {
    let id, content, author: String?
    let tags: [String]?
    let authorSlug: String?
    let length: Int?
    let dateAdded, dateModified: String?
}
