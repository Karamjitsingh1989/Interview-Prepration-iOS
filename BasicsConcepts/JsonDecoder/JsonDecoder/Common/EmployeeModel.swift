//
//  EmployeeModel.swift
//  JsonDecoder
//
//  Created by Harsimrat on 27/01/23.
//

import Foundation

struct EmployeeModel: Decodable {
    
    var Empoloyee:[EmployeeInfo]
}

struct EmployeeInfo: Decodable {
    let userId: Int
    let name: String
    let age: Int
    let formed: String
    let privacyDescription: String
}
