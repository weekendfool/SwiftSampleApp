//
//  MakeToDoViewController.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/06/29.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

//何個目のセリフかをカウントする
var catCount:Int?

class MakeToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
   
    //パーツの紐付け
    @IBOutlet weak var makeToDoTableView: UITableView!
    @IBOutlet weak var makeToDoTextField: UITextField!
    @IBOutlet weak var makeToDoTextFieldButton: UIButton!
    @IBOutlet weak var makeToDoTableViewCellHeight: NSLayoutConstraint!
    @IBOutlet weak var makeToDoStackView: UIStackView!
    
    var keyBoardHeight:CGFloat?
    var tableViewOriginalHeight:CGFloat?
    //ツールバーボタンのインスタンス作成
    var toolBar = UIToolbar()
    //coreDataのインスタンス作成
    var coreData = CoreData()
    //datePickerのインスタンス作成
    let datePickerView = UIDatePicker()
    //Pickerのインスタンス作成
    let finalAnswerPicker = UIPickerView()
    //Pickerの選択肢
    var answerArray = ["Yes", "No"]
    //catCellのアイコン名を入れる変数
    var catImageName = ""
    //自分が入力した言葉
    var myTalkDic:[String:Any] = ["name":"", "date":"", "point":"", "error":"error"]
    //自分が入力した言葉
    var myTalk:String?
    //猫のセリフ配列作成
    let catTalkArray:[String] = ["クエスト名を教えて欲しいにゃん！", "締め切りを設定して欲しいにゃん！", "成功報酬を設定して欲しいにゃん！", "この条件でいいかにゃん？",  "トップページに戻るにゃん！"]
    //猫のimage配列作成
    let catImageArray:[String] = ["catIcon1", "catIcon2", "catIcon3", "catIcon4", "catIcon5", "catIcon6", "catIcon7", "catIcon8", "catIcon9", "catIcon10", "catIcon11"]
    var catText = ""
    //indexPathを入れる変数
    var indexPath:Int?
    //キーボードのタイプを記憶する変数
    var kyboardTypeIsNumber = false
    //最終の判断を格納する変数を宣言
    var finalAnswer = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //UITableViewDelegate, UITableViewDataSourceの紐付け
        makeToDoTableView.dataSource = self
        makeToDoTableView.delegate =  self
        makeToDoTextField.delegate = self
        finalAnswerPicker.delegate = self
        finalAnswerPicker.dataSource = self
        
        //catCountを1にする
        catCount = 1
        //catIconのimageを決定
        catImageName = catImageArray.randomElement()!
        //アイコンのナンバーを保存
        UserDefaults.standard.set(catImageName, forKey: "catImageName")
        //tableViewの更新
        makeToDoTableView.reloadData()
        makeToDoTextFieldButton.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //tableView,pickerViewの設定
        setNotification()
        catCount = 1
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        finishedNotification()
    }
    
    
    // MARK: - tableView
    //tableViewの初期設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //cat:3,my:3の合計６
//        print(catCount)
        var returnNumber:Int?
        if catCount == 10 {
            returnNumber = 1
        } else if catCount == 0 {
            returnNumber = 1
//            catCount! += 1
        } else {
            returnNumber = catCount
        }
        
        return returnNumber!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellName = ""
        //myCellかcatCellの場合わけ
        print("indexPath\(indexPath.row)")
        if (indexPath.row % 2) == 0 {
            cellName = "catCell"
        } else {
            cellName = "myCell"
        }
        //cellを定義
        let cell = makeToDoTableView.dequeueReusableCell(withIdentifier: cellName) as! MakeToDoTableViewCell
        //catとmyで場合わけしてそれぞれの表示処理を行う
        if cellName == "catCell" {
            //猫のセリフを表示
//            print(catCount)
            switch indexPath.row {
            case 0:
                catText = catTalkArray[0]
            case 2:
                catText = catTalkArray[1]
            case 4:
                catText = catTalkArray[2]
            case 6:
                catText = catTalkArray[3]
            case 10:
                catText = catTalkArray[4]
            default:
                catText = "error"
            }
            //cellを表示する関数起動
            catImageName = UserDefaults.standard.object(forKey: "catImageName") as! String
            cell.setUpCatCell(catImageName: catImageName, catTalk: catText)
//            print(cell.makeToDoTableViewCellCatLabel.text)
        } else {
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
            print(myTalkDic["name"])
            switch indexPath.row {
            case 1:
                myTalk = myTalkDic["name"] as! String
            case 3:
                myTalk = myTalkDic["date"] as! String
            case 5:
                myTalk = myTalkDic["point"] as! String
            default:
                myTalk = myTalkDic["error"] as! String
            }
            if let myTalk = myTalk {
                cell.setUpMyCell(myTalk: myTalk)
            }
        }
//        //textFieldの中身が空ならボタンが押せないようにする
//        if makeToDoTextField.text == "" {
//            makeToDoTextFieldButton.isEnabled = false
//        } else {
//            makeToDoTextFieldButton.isEnabled = true
//        }
        if catCount == 0 {
            catCount! += 1
        }
        return cell
    }
    
    //cellの高さを設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
       
    // MARK: - DownTextField
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
        tableViewOriginalHeight = makeToDoTableViewCellHeight.constant
    }
    
    //終了処理
    func finishedNotification() {
        //キーボードの表示・非表示を監視を終了する処理
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //textFieldを上方に移動させる処理
    @objc func keyBoardWillShow(notification: NSNotification) {
        //キーボードの高さ取得
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //キーボードの高さを格納
            keyBoardHeight = keyboardSize.height
            //キーボードの高さ分だけtableViewの座標を移動させる
            makeToDoTableViewCellHeight.constant = tableViewOriginalHeight! - keyboardSize.height
            //stackViewを上方へ移動
            makeToDoStackView.transform = CGAffineTransform(translationX: 0, y: -keyBoardHeight!)
            }
        }
    
    //textFieldを下方に移動させる処理
    @objc func keyboardWillHide() {
        //stackViewを元の位置に戻す
        makeToDoStackView!.transform = CGAffineTransform.identity
        makeToDoTableViewCellHeight!.constant = tableViewOriginalHeight!
    }
    
    //実際にタップでキーボードを下げる処理
    @objc func dismissKeyboard() {
        makeToDoTextField.endEditing(true)
    }
    
    //リターンボタンでキーボードをさげる命令
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        makeToDoTextField.resignFirstResponder()
        doReturnButton()
        return true
    }
    
    // MARK: - PickertViewDown
    //datePickerViewの作成
    func createDatePickerView() {
        //dataPickerの設定
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.timeZone = NSTimeZone.local
        datePickerView.locale = Locale.current
        //テキストフィールドのインプットにpickerViewを設定
        makeToDoTextField.inputView = datePickerView

        }

    //atePickerViewのスタイルの設定
    func lookDatePickerView() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        makeToDoTextField.text = "\(formatter.string(from: datePickerView.date))"
    }
     
    // MARK: - ButtonAction
      
    @IBAction func myTextFieldButtonAction(_ sender: Any) {
        //キーボードを下げる
        makeToDoTextField.endEditing(true)
        //入力を反映する処理
        doReturnButton()
    }

    func keepTodoList(catCount: Int) {
        //todoListに保存する内容を一次保存する変数
        var todoListName:String
        var todoListDate:String
        var todoListPoint:String
        
        
        switch catCount {
        case 1:
            todoListName = makeToDoTextField.text!
        case 2:
            todoListDate = makeToDoTextField.text!
        case 3:
            todoListPoint = makeToDoTextField.text!
//        case 6:
//            coreData.addTodoList(todoListName: todoListName, todoListDate: todoListDate, todoListPoint: todoListPoint)
        default:
            return
        }
    }
//    //todoListに保存する内容を一次保存する変数
//    func saveTodoList(catCount: Int) {
//        //最後まで情報を確認できたら保存の処理を実行する
//        if catCount == 6 {
//            coreData.addTodoList(todoListName: <#T##String#>, todoListDate: <#T##Date#>, todoListPoint: <#T##Int#>)
//        }
//    }
    //入力された内容をチャットに反映する処理
    func doReturnButton() {
        print("catcount:\(catCount)")
        //最終の判断を格納する変数を宣言
        finalAnswer = false
        //猫のチャットを出すためにカウントアップ
//        if let catCount = catCount {
        if makeToDoTextField.text != "" && (catCount! % 2) != 0 {
//            print(makeToDoTextField.text)
            makeToDoTableView.reloadData()
            var dicName = ""
            //打ち込んだ言葉をtableViewのLableに反映させる
            switch catCount {
            case 1:
                dicName = "name"
            case 3:
                dicName = "date"
            case 5:
                dicName = "point"
            case 7:
                dicName = "answer"
            default:
                dicName = "error"
            }
            
            if let inputMyTalk = makeToDoTextField.text {
                myTalkDic[dicName] = inputMyTalk
                print("dicName\(dicName)")
                print("myTalk\(myTalkDic[dicName])")
                makeToDoTextField.text = ""
            }
        }
//        } else if catCount! % 2 == 0{
//            print("gggg")
//            makeToDoTableView.reloadData()
//        }
                     
        //pickerViewの切り替えを行う
        if catCount == 1 {
            createDatePickerView()
            lookDatePickerView()
        } else if catCount == 5 {
            //pickerViewの切り替えを行う
            makeToDoTextField.text = answerArray[0]
            makeFinalAnswerPickerView()
            
        } else {
            if catCount == 3 {
            changeNumberInput()
            } else {
                makeToDoTextField.keyboardType = UIKeyboardType.default
                //数字の正規表現による規制を解除
                kyboardTypeIsNumber = true
            }
            makeToDoTextField.inputView = nil
        }
                    
        print("catcount:\(catCount)")
        //finalAnswerがYesの場合クエストを保存する処理
        if catCount == 7 {
            if (myTalkDic["answer"] as! String) == "Yes" {
                popupAlert()
            } else {
                
            }
           
        }
        //textFieldの中身が空ならボタンが押せないようにする
        if (catCount! % 2) != 0 {
            //猫のチャットを出すためにカウントアップ
            catCount! += 2
            //tableViewの更新
            makeToDoTableView.reloadData()
        }
        
    }
    
    //MARK: - キーボードを下げる処理
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
// MARK: - pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answerArray[row]
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        makeToDoTextField.text = answerArray[row]
        }
    
    func makeFinalAnswerPickerView() {
        //textFieldの入力をに設定
        makeToDoTextField.inputView = finalAnswerPicker
        if makeToDoTextField.text == "Yes" {
            finalAnswer = true
            
        }
    }
    
    // MARK: -　textFieldの変化を検知
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //もし空だったらボタンを無効化
        if makeToDoTextField.text == "" {
            makeToDoTextFieldButton.isEnabled = false
        } else {
            makeToDoTextFieldButton.isEnabled = true
        }
        return true
    }
    
    // MARK: -　textFieldで数字のみを入力できるようにする
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //返り値の変数
        var returnBoolType:Bool?
        //数字のみかの条件わけ
        if kyboardTypeIsNumber {
            //数字以外を入力できないので正規表現により数字だけ入力できるように変更
            var inputSting = string.range(of: "^[0-9]+$", options: .regularExpression, range: nil, locale: nil)
            print("inputSting:\(inputSting)")
            
            if inputSting == nil {
                returnBoolType = false
            } else {
                returnBoolType = true
            }
        } else {
            //数字以外を入力できるので常にtrue
            returnBoolType = true
        }
        return returnBoolType!
    }
    
    func changeNumberInput() {
        //キーボードの入力タイプを数字のみに変更
        makeToDoTextField.keyboardType = UIKeyboardType.numberPad
        //数字の正規表現を使用することの検知
        kyboardTypeIsNumber = true
    }
    
    // MARK: -　クエスト情報の入力が完了したらアラートを表示する
    
    func popupAlert() {
        //UIAlertControllerのインスタンス化
        let alertController = UIAlertController(title: "この設定でクエストを募集するにゃん！", message: "", preferredStyle: .alert)
        //UIAlertActionのインスタンス化
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
            //遅延実行処理
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                           self.navigationController?.popViewController(animated: true)
            }
        })
        //アクションの追加
        alertController.addAction(alertAction)
        //アクションの実行
       
        present(alertController, animated: true, completion: {
           
            
        })
        
        
    }
    // MARK: -　クエスト情報の入力が完了時の遷移と初期化
    func finishMakeTodo() {
        //初期化と保存
        catCount = 10
        //tableViewの更新
        self.makeToDoTableView.reloadData()
        
    }
}
