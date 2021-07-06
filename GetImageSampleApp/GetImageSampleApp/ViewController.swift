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
        
        setUpWebView()
        recuestURL()
        setImage()
    }
    
    // webViewの設定
    // @Configuration意味は構成
    func setUpWebView() {
        let webConfiguration = WKWebViewConfiguration()
//        sampleWebView = WKWebView(frame: .zero, configuration: webConfiguration)
//        sampleWebView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        sampleWebView.uiDelegate = self
        sampleWebView.navigationDelegate = self
//        view = sampleWebView
    }
    
    func recuestURL() {
        let myUrl = URL(string: "https://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")
        let myRecuest = URLRequest(url: myUrl!)
        
        sampleWebView.load(myRecuest)
    }
    
    func setImage() {
        let myUrl = URL(string: "https://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")
        
        do {
            let data = try Data(contentsOf: myUrl!)
            sampleImageView.image = UIImage(data: data)
        } catch let error {
            print("error: \(error)")
        }
    }
}

    extension ViewController: WKUIDelegate {
    }

    extension ViewController: WKNavigationDelegate {

    }



