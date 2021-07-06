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
    
    var count: Int? {
        didSet{
            if let count = count {
                if count % 2 == 0 {
                    myColor.changeMyColor()
                } else {
                    print("stay")
                }
                print("count is nil")
            }
            
            }
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0
        myColor.delegate = blueColorAge
        blueColorAge.beforeDo()
//        myColor.changeMyColor()
//        blueColorAge.changeColor()
        
    }

    @IBAction func buttonAction(_ sender: Any) {
        count! += 1
    }
    
}

