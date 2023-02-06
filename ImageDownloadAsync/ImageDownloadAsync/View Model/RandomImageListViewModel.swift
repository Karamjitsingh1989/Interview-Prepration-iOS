//
//  RandomImageListViewModel.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 06/02/23.
//

import Foundation
import UIKit

@MainActor
class RandomImageListViewModel: ObservableObject {
    
    @Published var randomImages: [RandomImageViewModel]  = []
 
    func getRandomImages(ids: [Int]) async {
        do {
            let randomImageResponse =  try await  Webservices().getRandomImages(ids: ids)
            self.randomImages = randomImageResponse.map(RandomImageViewModel.init)
        }
        catch {
          print(error)
        }
    }
}

struct RandomImageViewModel: Identifiable {
    
    let id = UUID()
    fileprivate let randomImage: RandomImage
    
    var  image: UIImage? {
        UIImage(data: randomImage.image)
    }
    
    var quote: String {
        randomImage.quote.content ?? ""
    }
}

