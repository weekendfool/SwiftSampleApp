//
//  Router.swift
//  RouterSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
//

import UIKit

// 画面遷移を管理
final class Router {
    
    static let shared: Router = .init()
    
    private init() {}
    
    private (set) var window: UIWindow?
    
    // 起動直後の画面を表示する
    func showRoot(window: UIWindow?) {
        
        // パラメータから初期画面を切り替える
        if !UserDefaults.standard.isLogined {
            // viewcontrollerを作成
            let vc = FirstViewController.makeFromStoryboard()
            // ナビゲーションコントローラーのrootを指定
            let nav = UINavigationController(rootViewController: vc)
            window?.rootViewController = nav
        } else {
            let vc = SecondViewController.makeFromStoryboard()
            let nav = UINavigationController(rootViewController: vc)
            window?.rootViewController = nav
        }
        window?.makeKeyAndVisible()
        self.window = window
    }
    
    func showFirst(from: UIViewController) {
        let vc = FirstViewController.makeFromStoryboard()
        show(from: from, next: vc)
    }
    
    func  showSecond(from: UIViewController) {
        let vc = SecondViewController.makeFromStoryboard()
        show(from: from, next: vc)
    }

    func showReStart() {
        UserDefaults.standard.isLogined = [true, false].randomElement()!
        // 最初から画面構築を行う
        showRoot(window: window)
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
    

