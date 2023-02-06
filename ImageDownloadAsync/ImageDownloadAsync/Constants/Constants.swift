//
//  Constants.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

struct Constants {
    
    struct url {
        static func getImageURL(id: Int)->URL?{
            return URL(string: "https://picsum.photos/200/300?id=\(id)")
        }
        static func getRandomImageURL()->URL? {
            return URL(string: "https://picsum.photos/200/300?uuid=\(UUID().uuidString)")
        }
        static let randomQuoteUrl: URL?  = URL(string: "https://api.quotable.io/random")
    }
}
