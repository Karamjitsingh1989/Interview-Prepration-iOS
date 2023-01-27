//
//  ViewController.swift
//  JsonDecoder
//
//  Created by Harsimrat on 27/01/23.
//

import UIKit


/*
 ***************************************
     JSON PARSE INTERVIEW QUESTIONS
 **************************************
    1. How you decode data in iOS? JsonDecoder / JsonSerialization
    2. What is Codable? Encodable & Decodable
    3. How you decode data with custom properties?
    4. How can we decode date to date property? .dateDecodingStrategy = .formatted
    5. What is convertFromSnakeCase?     //  keyDecodingStrategy = .convertFromSnakeCase
    6. How can we decode using custom property?
    7. How can we decode same property with different data type?
 */



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getJsonData()
        
        // Do any additional setup after loading the view.
    }


    func getJsonData(){
        
        if let jsonData =   JsonParse.decodeLocalJsonFile(fileName: "Employee"){
            decodeJsonResponse(jsonData: jsonData)
        }
    }
    
   private func decodeJsonResponse(jsonData: Data) {
        
       do {
           let jsonDecoder = JSONDecoder()
           jsonDecoder.dateDecodingStrategy = .formatted(self.getDateFormat())
           jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
           
           let  jsonResponse = try? jsonDecoder.decode(EmployeeModel.self, from:jsonData)
           
           print("Employee:\(jsonResponse)")
       }
       catch let error {
           
        print("it could not decode the data")
       }
    }
    
    func getDateFormat()-> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm EEE, dd MMM y"
        return formatter
    }
    
}

