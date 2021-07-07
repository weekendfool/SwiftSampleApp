//
//  ViewController.swift
//  AlertSampleApp
//
//  Created by 尾原徳泰 on 2021/07/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let makeKAlert = MakeAlert()
        let printDo = printDo()
        
        makeKAlert.makeAlert(vc: self, buttonAction: printDo.printDo())
    
        
    }


}

