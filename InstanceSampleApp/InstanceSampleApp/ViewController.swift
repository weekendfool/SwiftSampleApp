//
//  ViewController.swift
//  InstanceSampleApp
//
//  Created by 尾原徳泰 on 2020/09/29.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MakeLabel().make(view: self.view)
    }


    @IBAction func buttonTapped1(_ sender: Any) {
        MakeLabel().make1()
    }
    
    @IBAction func buttonTapped2(_ sender: Any) {
        MakeLabel().make2()
    }
    
    @IBAction func buttonTapped3(_ sender: Any) {
//        MakeLabel().make3()
    }
}

