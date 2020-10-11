//
//  ViewController.swift
//  whingingEater
//
//  Created by 尾原徳泰 on 2020/03/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
   
    @IBOutlet weak var textField: UITextField!
    
    let text = UserDefaults.standard
    let key = "key"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        
       }
       
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.textField.isFirstResponder) {
            self.textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        text.set(textField.text, forKey: key)
        
        textField.text = ""
        
        performSegue(withIdentifier: "toNext", sender: nil)
        
        
        return true
    }
    
    

}

