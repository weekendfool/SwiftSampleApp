//
//  ViewController.swift
//  GetImageSampleApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleWebView: WKWebView!
    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // webViewの設定
    // @Configuration意味は構成
    func setUpWebView() {
        let webConfiguration = WKWebViewConfiguration()
        sampleWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        sampleWebView.uiDelegate = self
        view = sampleWebView
    }

}


