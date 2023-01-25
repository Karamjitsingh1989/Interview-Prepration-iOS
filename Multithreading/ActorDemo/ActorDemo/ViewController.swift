//
//  ViewController.swift
//  ActorDemo
//
//  Created by Harsimrat on 24/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stocks = Stocks()

        let queue = DispatchQueue(label: "Stocks", attributes: .concurrent)
        
            queue.async {
                Task(priority: .utility) {
                    await stocks.purchasePhone(phoneName: "iphone 13")
                }
               
            }
            queue.async {
                Task(priority: .utility) {
                    await stocks.getAllAvailablePhones()
                }
               
            }
        // Do any additional setup after loading the view.
    }


}

