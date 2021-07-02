//
//  ViewController.swift
//  ApiSampleApp
//
//  Created by 尾原徳泰 on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {

//    var api = getAPI(query: "チェンソーマン")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAPI(query: "9784041042083")
        
    }

    @IBAction func getButtonAction(_ sender: Any) {
    }
    
}

