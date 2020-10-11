//
//  Timer.swift
//  N'stimer
//
//  Created by 尾原徳泰 on 2020/04/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class TimerCount {
    //設定に使う分数を設定
    var Minutestimer:[Int] = []
    //for文を使って0から60までを設定
    func settingMinumte() {
        for number in 0...60 {
            Minutestimer.append(number)
        }
        
    }
}
