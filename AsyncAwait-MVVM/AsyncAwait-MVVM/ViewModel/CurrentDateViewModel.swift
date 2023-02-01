//
//  CurrentDateViewModel.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

struct CurrentDateViewModel {
    
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
