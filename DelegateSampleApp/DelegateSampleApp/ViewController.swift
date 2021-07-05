//
//  ViewController.swift
//  DelegateSampleApp
//
//  Created by 尾原徳泰 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    let myColor = MyColor()
    let blueColorAge = BlueColorAge()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myColor.delegate = blueColorAge
        
        myColor.changeMyColor()
//        blueColorAge.changeColor()
        
    }


}

