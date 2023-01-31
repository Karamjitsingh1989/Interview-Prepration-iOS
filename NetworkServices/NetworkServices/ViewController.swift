//
//  ViewController.swift
//  NetworkServices
//
//  Created by Karamjit Singh on 31/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager().fetchResponseModel(url: AppConfig.baseURL, resultType:RequestURL.self) { response, error in
            guard let responseOject = response, error == nil else {
                return
            }
            print("URLS \(responseOject)")
        }
        // Do any additional setup after loading the view.
    }
}

