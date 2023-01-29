//
//  LoggerServices.swift
//  SingletonPatternDemo
//
//  Created by Karamjit Singh on 29/01/23.
//

/*
 What is singleton?
 How can we create Sigleton?
 Is Singleton Thread safe?
 How to make singleton thread safe?
 Is Singleton Bad?
 Which scenarios we can consider for singleton pattern ?
 
 Default singleton classes used by apple are
 FileManager , UserDefaults , UIApplication and UIAccelerometer
 
 Singleton is a design pattern that ensures a class can have only one object. It can be used through out the app
 
 
 */


import Foundation

//********************************
//How can we create Sigleton?
//********************************
class LoggerServices {
    static let shared = LoggerServices()
    
    private var logData: [String: String] = [:]
    private init(){}
    
    private let queue = DispatchQueue(label: "ThreadSafe",attributes: .concurrent)
  
    // Without Thread Safe
    func addLogData(value: String , forkey: String) {
            self.logData[forkey] = value
            debugPrint("Logged Data:[ \(forkey): \(value) ]")
       
    }
    
    // With Thread Safe
    func addLogDataWithThreadSafe(value: String , forkey: String) {
        
        queue.async(flags: .barrier) {[weak self] in
            guard let selfRef = self else {return}
            selfRef.logData[forkey] = value
            debugPrint("Logged Data:[ \(forkey): \(value) ]")
        }
    }
    
}
