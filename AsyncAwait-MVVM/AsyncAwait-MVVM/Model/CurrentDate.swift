//
//  CurrentDate.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

struct CurrentDate: Codable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
