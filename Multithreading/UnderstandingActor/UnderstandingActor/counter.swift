//
//  counter.swift
//  UnderstandingActor
//
//  Created by Karamjit Singh on 07/02/23.
//

import Foundation


actor counter {
    
    var value = 0
    
    func increment()-> Int {
        value += 1
        return value
    }
}

