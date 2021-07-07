//
//  Router.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/04.
//

import UIKit

final class Router {
    // ＠init関数を格納した変数の宣言
    static let shared: Router = .init()
    // ＠init関数の宣言？
     init() {}
    
    private (set) var window: UIWindow?
    
    // 起動直後の画面を表示する
    func showRoot(window: UIWindow?) {
        let vc = BarcodeReaderViewController.makeFromStoryboard()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        self.window = window
    }
    
    // BarcodeReaderViewを表示する処理
    func showBarcodeReaderView(from: UIViewController) {
        let vc = BarcodeReaderViewController.makeFromStoryboard()
        show(from: from, next: vc)
    }
    
    // showBarcodeReaderViewを表示する処理
    func showResultImageView(from: UIViewController) {
        let vc = ResultImageViewController.makeFromStoryboadrd()
        show(from: from, next: vc)
    }
}

private extension Router {
    func show(from: UIViewController, next: UIViewController, animated: Bool = true) {
        if let nav = from.navigationController {
            nav.pushViewController(next, animated: animated)
        } else {
            from.present(next, animated: animated, completion: nil)
        }
    }
}
