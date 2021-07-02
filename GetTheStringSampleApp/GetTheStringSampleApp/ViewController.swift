//
//  ViewController.swift
//  GetTheStringSampleApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chuseTargetString()
    }
    
    func chuseTargetString() {
        var targetString = "http://books.google.com/books/content?id=hsFCMQAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"
        
        let result = targetString.range(of: "http")
        
        print("result:\(result)")
        
        if let range = result {
            targetString.removeSubrange(range)
            print("targetString:\(targetString)")
            let afterString = "https" + targetString
            print("afterString: \(afterString)")
        }
    }

    

}

