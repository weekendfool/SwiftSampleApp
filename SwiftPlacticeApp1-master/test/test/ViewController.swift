//
//  ViewController.swift
//  test
//
//  Created by 尾原徳泰 on 2020/05/07.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //privateとは同じファイルからしかアクセスできないという目印、クロージャーな気がする
    private let mainStackView: UIStackView = {
        //mainStackViewをコードで生成している
        //インスタンスの生成
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //tableViewの生成
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorInset = .zero
        table.rowHeight = 44
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

}

