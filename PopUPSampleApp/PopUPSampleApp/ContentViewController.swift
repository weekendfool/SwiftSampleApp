//
//  ContentViewController.swift
//  PopUPSampleApp
//
//  Created by 尾原徳泰 on 2021/01/31.
//

import UIKit

class ContentViewController: UIViewController {
    
    var button = UIButton()
    var vc = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        button.setTitle("tap", for: UIControl.State.normal)
        
        button.backgroundColor = UIColor.black
        
        button.addTarget(ViewController(), action: #selector(ContentViewController().doPrint), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    

    @objc func doPrint() {
        print("do!")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
