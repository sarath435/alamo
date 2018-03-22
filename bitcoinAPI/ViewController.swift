//
//  ViewController.swift
//  bitcoinAPI
//
//  Created by brn.developers on 3/21/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "..."
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { response in
            
            print(response)
            
            if let bitcoinJSON = response.result.value{
            let bitcoinObject:Dictionary = bitcoinJSON as! Dictionary<String,Any>
                let bpiObject:Dictionary = bitcoinObject["bpi"] as! Dictionary<String,Any>
                let usdObject:Dictionary = bpiObject["USD"] as! Dictionary<String,Any>
                let rate:Float = usdObject["rate_float"] as! Float
                self.labelText.text = "$\(rate)"
            
                
            }
        }

    print("loading web services...")
       
    }

   

}

