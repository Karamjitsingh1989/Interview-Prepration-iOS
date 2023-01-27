//
//  EmployeeModel.swift
//  JsonDecoder
//
//  Created by Harsimrat on 27/01/23.
//

import Foundation

struct EmployeeModel: Decodable {
    var Employee:[EmployeeInfo]
}

struct EmployeeInfo: Decodable {
    let userId: Int
    let name: String
    let age: AgeDataType
    let createdDate: Date
    let privacyDescription: String
    //*****************************
     //  Adding Custom Keys
    //*****************************
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case age
        case createdDate = "formed"
        case privacyDescription
    }
    //*******************************************
    // How can we decode using custom property?
    //*******************************************
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(AgeDataType.self, forKey: .age)
        self.createdDate = try container.decode(Date.self, forKey: .createdDate)
        self.privacyDescription = try container.decode(String.self, forKey: .privacyDescription)
    }
}


//***********************************************************
// How can we decode same property with different data type?
//***********************************************************

enum AgeDataType:Decodable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(stringValue)
            return
        }
        throw AgeTypeError.missing
    }
    enum AgeTypeError: Error {
        case missing
    }
}
