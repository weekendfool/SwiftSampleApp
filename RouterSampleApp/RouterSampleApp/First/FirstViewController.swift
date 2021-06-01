//
//  FirstViewController.swift
//  RouterSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
// 3

import UIKit


final class FirstViewController: UIViewController {
    
    // storyboardからvcを生成する
    static func makeFromStoryboard() ->  FirstViewController {
    
        let vc = UIStoryboard.firstViewController
        
        
        return vc
    }
    
    
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.addTarget(self, action: #selector(tapNextButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc func tapNextButton(_ sender: UIResponder) {
        Router.shared.showSecond(from: self)
    }
        
}
