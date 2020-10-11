//
//  SetRewardPointViewController.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/06/29.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class SetRewardPointViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    //パーツの紐付け
    @IBOutlet weak var backGroundPaperView: UIImageView!
    @IBOutlet weak var RewardPointTableView: UITableView!
    @IBOutlet weak var setRewardPointTextField: UITextField!
    @IBOutlet weak var setRewardPointButton: UIButton!
    @IBOutlet weak var RewardPointTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var setRewardPointStackView: UIStackView!
    
    //RewarePointを保存しておく配列
    var saveRewardPointArray:[Int] = []
    var OriginalRewardPointTableViewHeight:CGFloat?
    var keyBoardHeight:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewについての設定
        RewardPointTableView.delegate = self
        RewardPointTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tableViewの設定
        setNotification()
       }
       
       override func viewDidAppear(_ animated: Bool) {
           finishedNotification()
       }
    //tableViewの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //RewarePointの数だけ呼び出す
        return saveRewardPointArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = RewardPointTableView.dequeueReusableCell(withIdentifier: "RewardPointCell") as! UITableViewCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .brown
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - TextViewDown
    //開始処理
    func setNotification() {
        
        //キーボードの表示・非表示を監視を開始する処理
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //キーボードをタップの検知で下げる処理を定義
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        //処理として追加
        self.view.addGestureRecognizer(tapGesture)
        //tableViewの高さ取得
        OriginalRewardPointTableViewHeight = RewardPointTableViewHeight.constant
    }
    
    //終了処理
    func finishedNotification() {
        //キーボードの表示・非表示を監視を終了する処理
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //textFieldを上方に移動させる処理
    @objc func keyBoardWillShow(notification: NSNotification, targetVC: UIViewController) {
        //キーボードの高さ取得
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //キーボードの高さを格納
            keyBoardHeight = keyboardSize.height
             //キーボードの高さ分だけtableViewの座標を移動させる
            RewardPointTableViewHeight!.constant = OriginalRewardPointTableViewHeight! - keyboardSize.height
            //stackViewを上方へ移動
            setRewardPointStackView.transform = CGAffineTransform(translationX: 0, y: -keyBoardHeight!)
                
            }
        }
    
    //textFieldを下方に移動させる処理
    @objc func keyboardWillHide() {
        //stackViewを元の位置に戻す
        setRewardPointStackView.transform = CGAffineTransform.identity
        
        RewardPointTableViewHeight!.constant = OriginalRewardPointTableViewHeight!
    }
    
    //実際にタップでキーボードを下げる処理
    @objc func dismissKeyboard() {
        setRewardPointTextField.endEditing(true)
         print("$$$$$$$$$$$$")
    }
    
    //リターンボタンでキーボードをさげる命令
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.setRewardPointTextField.endEditing(true)
        return false
    }
    

    
    @IBAction func setRewardPointButtonAction(_ sender: Any) {
        //textFieldをボタンで閉じる
        setRewardPointTextField.endFloatingCursor()
    }
    
    //MARK: - キーボードを下げる処理
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           view.endEditing(true)
       }
       
}
