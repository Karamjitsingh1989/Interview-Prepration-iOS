//
//  JsonParse.swift
//  JsonDecoder
//
//  Created by Harsimrat on 27/01/23.
//

import Foundation

struct JsonParse
{
   static  func decodeLocalJsonFile(fileName: String) -> Data? {
         if  let jsonFile = Bundle.main.path(forResource:fileName, ofType: "json") {
             return try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: .alwaysMapped)
        }
        return nil
    }
}
