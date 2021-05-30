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
        if !UserDefaults.standard.isLogined
    }
}
