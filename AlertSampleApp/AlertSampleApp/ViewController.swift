//
//  ViewController.swift
//  AlertSampleApp
//
//  Created by 尾原徳泰 on 2021/07/07.
//

import UIKit

class ViewController: UIViewController {

    var makeKAlert = MakeAlert()
    let printDo = PrintDo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var test = printDo.printDo()
        makeKAlert.sampleDelegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("------------------------")
        print("ok")
        
    
    }

    @IBAction func buttonAction(_ sender: Any) {
        
       
        makeKAlert.makeAlert(vc: self, buttonAction: printDo.printDo())
    }
    
}

extension ViewController: SampleDelegate {
    func printingDo() {
        printDo.printDo()
    }
    
    
}

