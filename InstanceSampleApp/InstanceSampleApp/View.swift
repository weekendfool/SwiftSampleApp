//
//  View.swift
//  InstanceSampleApp
//
//  Created by 尾原徳泰 on 2020/09/29.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation
import UIKit

var label1 = UILabel()

struct Label {
    var label2 = UILabel()
    
    
}

class MakeLabel {
    var label2 = UILabel()
//    @IBOutlet weak var label3:UILabel!
    
    func make(view:UIView) {
        
//        // グローバル変数
//        label1.frame = CGRect(x: 10, y: 30, width: 160, height: 30)
//        label1.text = "Buttn Name 1"
//        label1.textColor = UIColor.black
//        view.addSubview(label1)

        // ローカル変数
        label2.frame = CGRect(x: 10, y: 70, width: 160, height: 30)
        label2.text = "Buttn Name 2"
        label2.textColor = UIColor.black
        view.addSubview(label2)
        
//        // @IBOutlet
//        Label().label3.frame = CGRect(x: 10, y: 400, width: 160, height: 30)
//        Label().label3.text = "Buttn Name 3"
//        Label().label3.textColor = UIColor.black
//        view.addSubview(Label().label3)
    }
    func make1() {
        label1.textColor = UIColor.red
    }
    
    func make2() {
        MakeLabel().label2.textColor = UIColor.blue
    }
    
//    func make3() {
//        Label().label3.textColor = UIColor.green
//    }
}
