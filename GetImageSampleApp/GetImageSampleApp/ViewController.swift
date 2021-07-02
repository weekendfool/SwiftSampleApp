//
//  ViewController.swift
//  GetImageSampleApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var sampleWebView: WKWebView!
    @IBOutlet weak var sampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpWebView()
        recuestURL()
    }
    
    // webViewの設定
    // @Configuration意味は構成
    func setUpWebView() {
        let webConfiguration = WKWebViewConfiguration()
        sampleWebView = WKWebView(frame: .zero, configuration: webConfiguration)
        sampleWebView.uiDelegate = self
        sampleWebView.navigationDelegate = self
        view = sampleWebView
    }
    
    func recuestURL() {
        let myUrl = URL(string: "http://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")
        let myRecuest = URLRequest(url: myUrl!)
        
        sampleWebView.load(myRecuest)
    }

//    extension ViewController: WKUIDelegate {
//    }
//
//    extension ViewController: WKNavigationDelegate {
//
//    }
}


