//
//  GetAndSet.swift
//  GetSetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/01.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Item {
    // 税抜き価格
    var price:Double = 0
    
    // 税込み価格
    var intextPrice:Double {
        // 値を取得するときに呼ばれる
        get{
            return self.price * 1.10
            print("Done Get")
        }
        
        // 値をセットされる時に呼ばれる
        set(p){
            price = p / 1.10
            print("Done Set")
        }
    }
}
