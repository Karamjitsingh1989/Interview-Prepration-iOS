//
//  WebServices.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 05/02/23.
//

import Foundation

class Webservices {
    
    func getRandomImages(ids: [Int]) async throws -> [RandomImage] {
      
        var randomImages = [RandomImage]()
        
        try await withThrowingTaskGroup(of: (Int, RandomImage).self, body: { group in
          
            for id in ids {
                group.addTask { [self] in
                   // guard let selfRef = self else {return}
                    return (id, try await getRandomImage(id: id))
                }
            }
            for try await (_ , randomImage) in group {
                randomImages.append(randomImage)
            }
        })
        
        return randomImages
    }
    
     func getRandomImage(id: Int) async throws -> RandomImage {
        
        guard let url =  Constants.url.getImageURL(id: id) else {
            throw HttpError.badURL
        }
        
        guard let randomQuote = Constants.url.randomQuoteUrl else {
            throw HttpError.badURL
        }
        
        async let (data, _) = URLSession.shared.data(from: url)
        async let (quoteData , _) = URLSession.shared.data(from: randomQuote)
        
        guard let quote = try? JSONDecoder().decode(Quote.self, from: try await quoteData) else {
            throw HttpError.decodingError
        }
        return RandomImage(image: try await data, quote: quote)
    }
    
}
