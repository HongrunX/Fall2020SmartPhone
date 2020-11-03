//
//  ViewController.swift
//  Stockupdate
//
//  Created by Hongrun Xin on 11/2/20.
//  Copyright © 2020 edu.northeastern.HongrunXin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    let apiKey = "bd8712a3a6b4f72fc15ca7a696bc270b"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    @IBOutlet weak var numStock: UITextField!
    
    @IBOutlet weak var lblStockCEO: UILabel!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = numStock.text else {return}
                
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        getStockValue(stockURL: url, stockName: stockName)
        
    }
    
    
    func getStockValue(stockURL : String!, stockName : String!) {
        SwiftSpinner.show("Getting Stock information for \(String(describing: stockName))")
        Alamofire.request(stockURL).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess{
                guard let jsonString = response.result.value else {return}
                
                guard let stockJSON: [JSON] = JSON(jsonString).array else {return}
                
                if stockJSON.count < 1 {return}
                guard let price = stockJSON[0]["price"].double else {return}
                guard let ceo = stockJSON[0]["ceo"].rawString() else {return}
                
                self.lblStockCEO.text = "\(ceo)"
                self.lblStockPrice.text = "\(price)"
                
            }
        }
    }
}

