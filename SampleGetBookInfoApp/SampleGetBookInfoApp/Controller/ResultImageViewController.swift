//
//  ResultImageViewController.swift
//  SampleGetBookInfoApp
//
//  Created by 尾原徳泰 on 2021/07/03.
//

import UIKit

class ResultImageViewController: UIViewController {
    
    static func makeFromStoryboadrd() -> ResultImageViewController {
        let vc = UIStoryboard.resultImageViewController
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
