//
//  ViewController.swift
//  SingletonPatternDemo
//
//  Created by Karamjit Singh on 29/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     // 1: implementationOfSingletonPattern()
        
     // 2: isSingletonThreadSafe()
        
      //3: makeSingletonPatternThreadSafe()
    }

    
    func implementationOfSingletonPattern(){
        let loggerService = LoggerServices.shared
        loggerService.addLogData(value: "Karamjit", forkey: "Name")
    }
    
    //*******************************
    // Is Singleton Thread safe?
    //*******************************
    
    /*
     The singleton is not thread safe  because mutliple classes can access same shared instance at same time which casue race data and race condition.
       It also caused the memory leakage
       dangling Pointer and caused the crash
     */
    
    func isSingletonThreadSafe(){
        
        let queue = DispatchQueue(label: "concurreny", attributes: .concurrent)
        for i in 1...300 {
            queue.async {
                LoggerServices.shared.addLogData(value: "Test \(i)", forkey: "Log \(i)")
            }
        }
    }
    
    
    /*
     How to make thread safe?
     
     */
    func makeSingletonPatternThreadSafe(){
        
        let queue = DispatchQueue(label: "concurreny", attributes: .concurrent)
        for i in 1...300 {
            queue.async {
                LoggerServices.shared.addLogDataWithThreadSafe(value: "Test \(i)", forkey: "Log \(i)")
            }
        }
       
    }
    
}

