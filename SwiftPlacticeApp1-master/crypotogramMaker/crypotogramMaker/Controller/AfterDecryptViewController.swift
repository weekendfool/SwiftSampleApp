//
//  AfterDecryptViewController.swift
//  crypotogramMaker
//
//  Created by 尾原徳泰 on 2020/04/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class AfterDecryptViewController: UIViewController {

    @IBOutlet weak var decryptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //出力する絵文字を格納する配列をuserdefaultから引き出す処理
        let encryptStringArray = UserDefaults.standard.stringArray(forKey: "decryptionStringArray")!
        var outputText = ""
        for i in encryptStringArray {
            outputText.append(i)
        }
        //textViewの選択禁止処理
        decryptTextView.isEditable = false
        decryptTextView.text = outputText
    }
    
    
    @IBAction func backHomeButtonAction(_ sender: Any) {
        //画面遷移の処理
        performSegue(withIdentifier: "goHomeFromAfterDecryptVC", sender: nil)
    }
}
