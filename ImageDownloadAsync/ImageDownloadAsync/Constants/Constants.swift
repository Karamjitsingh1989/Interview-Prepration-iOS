//
//  Constants.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 04/02/23.
//

import Foundation

struct Constants {
    
    struct url {
        static func getImageURL(id: String)->URL?{
            return URL(string: "https://picsum.photos/id/\(id)/200/300")
        }
        static func getRandomImageURL()->URL? {
            return URL(string: "https://picsum.photos/seed/picsum/200/300")
        }
    }
}
