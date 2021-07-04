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
    private init() {}
    
    private (set) var window: UIWindow?
    
    // 起動直後の画面を表示する
    func showRoot(window: UIWindow?) {
        
    }
}
