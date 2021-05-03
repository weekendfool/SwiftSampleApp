//
//  ViewController.swift
//  ScroolleSampleVerCodeApp
//
//  Created by 尾原徳泰 on 2021/05/04.
//


// 写経
import UIKit

class ViewController: UIViewController {
    
    // インスタンス化
    let outView = UIView()
    let scrollView = UIScrollView()
    let inView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // 背景色の決定
        outView.backgroundColor = UIColor.red
        scrollView.backgroundColor = UIColor.orange
        inView.backgroundColor = UIColor.yellow
        
        // かくviewに子要素を追加
        scrollView.addSubview(inView)
        outView.addSubview(scrollView)
        view.addSubview(outView)
        
        // サイズ調整
        outView.translatesAutoresizingMaskIntoConstraints = false
        outView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50.0).isActive = true
        outView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50.0).isActive = true
        outView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0).isActive = true
        outView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50.0).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leftAnchor.constraint(equalTo: outView.leftAnchor, constant: 50.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: outView.rightAnchor, constant: -50.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: outView.topAnchor, constant: 50.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: outView.bottomAnchor, constant: -50.0).isActive = true
        
        inView.translatesAutoresizingMaskIntoConstraints = false
        inView.widthAnchor.constraint(equalToConstant: 1000.0).isActive = true
        inView.heightAnchor.constraint(equalToConstant: 1000.0).isActive = true
        inView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 50.0).isActive = true
        inView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -50.0).isActive = true
        inView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50.0).isActive = true
        inView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50.0).isActive = true
        
    }


}

