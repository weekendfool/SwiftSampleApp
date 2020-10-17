//
//  ViewController.swift
//  UIButtonSetTimingSampleApp
//
//  Created by 尾原徳泰 on 2020/10/18.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    
    let makeButton = MakeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.addSubview(la)
        print("--------------------------------")
        print("viewDidLoad")
        print(label)
        makeButton.setUIButton()
    }
    
    override func viewWillLayoutSubviews() {
        print("--------------------------------")
        print("viewWillLayoutSubviews")
        print(label)
        makeButton.setUIButton()
    }
    
    override func viewDidLayoutSubviews() {
        print("--------------------------------")
        print("viewDidLayoutSubviews")
        print(label)
        makeButton.setUIButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("--------------------------------")
        print("viewDidAppear")
        print(label)
        makeButton.setUIButton()
    }


}

