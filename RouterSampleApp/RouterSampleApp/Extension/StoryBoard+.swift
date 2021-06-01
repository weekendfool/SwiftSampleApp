//
//  StoryBoard+.swift
//  RouterSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
// 2

import UIKit

// storyboardの読み込みを一箇所にまとめる

extension UIStoryboard {
    
    
    
    static var firstViewController: FirstViewController {
        UIStoryboard.init(name: "First", bundle: nil).instantiateInitialViewController() as! FirstViewController
    
    }
    
    static var secondViewController: SecondViewController {
        UIStoryboard.init(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
    }
    
    static var thirdViewController: ThirdViewController {
        UIStoryboard.init(name: "Third", bundle: nil).instantiateInitialViewController() as! ThirdViewController
    }
}
