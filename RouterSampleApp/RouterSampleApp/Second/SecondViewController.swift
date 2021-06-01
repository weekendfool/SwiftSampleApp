//
//  SecondViewController.swift
//  RouterSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // storyboardからvcを生成する
    static func makeFromStoryboard() -> SecondViewController {
        
        let vc = UIStoryboard.secondViewController
        return vc
    }
    
    // countの初期化
    private var countModel = CountModel.init(count: 0)
    
    @IBOutlet private weak var countLabel: UILabel! {
        didSet {
            // countLabelにcountModelの保持している値を代入(初回のみ起動？)
            countLabel.text = countModel.count.description
        }
    }
    
    @IBOutlet private weak var countUpButton: UIButton! {
        didSet {
            countUpButton.addTarget(self, action: #selector(tapCountUpButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func tapCountUpButton(_ sender: UIResponder) {
        countModel.count += 1
        countLabel.text = countModel.count.description
    }
    
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.addTarget(self, action: #selector(tapNextButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func tapNextButton(_ sender: UIResponder) {
        Router.shared.showt
    }
    
}
