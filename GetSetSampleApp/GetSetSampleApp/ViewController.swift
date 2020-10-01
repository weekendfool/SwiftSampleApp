//
//  ViewController.swift
//  GetSetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/01.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Itemクラスのインスタンスを生成
        var item = Item()
        // Itemのgetを起動させる
        item.intextPrice = 110
        print(item.price)
    }


}

