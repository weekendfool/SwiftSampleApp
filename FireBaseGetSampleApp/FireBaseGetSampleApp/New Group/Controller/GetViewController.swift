//
//  GetViewController.swift
//  FireBaseGetSampleApp
//
//  Created by 尾原徳泰 on 2020/10/30.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class GetViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    
    // 取得した情報を入れておく配列
    // 構造体を要素に持つ
    var players: [User]!
    
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sarchButtonAction(_ sender: Any) {
        
        //　passが入力されてるかの確認
        guard let passText = passTextField else { return }
        
        // fireBaseのルートを宣言
        let ref = Database.database().reference()
        
        
        // 情報の検索
        let referencr = ref.when
        //　情報の取得
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passTextField.resignFirstResponder()
        
        return true
    }

}
