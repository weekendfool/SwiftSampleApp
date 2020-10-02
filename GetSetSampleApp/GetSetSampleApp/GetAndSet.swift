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
    var answer:Int = 0
    
    // 税込み価格
    var intextPrice:Double {
        // priceが変更した時に呼んでintextPrice自身の値を計算する
        // priceの値をgetするイメージ
        get{
            print("Done Get")
            return self.price * 1.10
            
        }
        
        // intextPriceの本体に値がセットされるた時に呼ばれる
        // intextPric自身を使ってクラス内のメンバ変数に値をsetするイメージ
        set { // numにはintextPricePの値が代入されている
            print("-------------------------------------")
            answer = Int(price * newValue) //newValueとは新しく定義されたintextPriceのこと
            print("price:\(price)")
//            print("num:\(num)")
            print("newValue:\(newValue)")
            print("Done Set")
        }
    }
    
}

