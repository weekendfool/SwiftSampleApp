//
//  ViewController.swift
//  ViewSampleApp
//
//  Created by 尾原徳泰 on 2021/05/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = UIScreen.main.bounds.width
        sizeLabel.text = "width:\(width)"
        let image = UIImage(named: "image")!
        image1 = UIImageView(image: image)
        image2 = UIImageView(image: image)
        image3 = UIImageView(image: image)
    }


}

