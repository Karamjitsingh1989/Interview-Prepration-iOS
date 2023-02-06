//
//  ContentView.swift
//  ImageDownloadAsync
//
//  Created by Karamjit Singh on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var randomImageList  = RandomImageListViewModel()
    
    var body: some View {
        List(randomImageList.randomImages) { randomImage in
            HStack {
                
                randomImage.image.map { image in
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
                }
                Text(randomImage.quote)
            }
            
        }.task {
            await randomImageList.getRandomImages(ids: Array(1...50))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
