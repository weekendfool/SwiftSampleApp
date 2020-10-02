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
        item.price = 100
        print("税込み価格\(item.intextPrice)")
        
        item.intextPrice = 200
//        item.num = 10
        
        print("合計価格\(item.answer)")
    }


}

