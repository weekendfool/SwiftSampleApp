//
//  ViewController.swift
//  PopUPSampleApp
//
//  Created by 尾原徳泰 on 2021/01/31.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let contentVC = ContentViewController()
        // スタイルの指定
        contentVC.modalPresentationStyle = .popover
        // サイズの指定
        contentVC.preferredContentSize = CGSize(width: 200, height: 200)
        // 表示するviewの指定
        contentVC.popoverPresentationController?.sourceView = view
        // 表示する位置の指定
        contentVC.popoverPresentationController?.sourceRect = sender.frame
        // 矢印が出る方向
        contentVC.popoverPresentationController?.permittedArrowDirections = .any
        // デリゲートの設定
        contentVC.popoverPresentationController?.delegate = self
        // 表示する
        present(contentVC, animated: true, completion: nil)
    }
    
    // iPhone
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

