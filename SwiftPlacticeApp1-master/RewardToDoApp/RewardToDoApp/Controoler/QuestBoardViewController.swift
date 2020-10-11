//
//  QuestBoardViewController.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/06/29.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit



class QuestBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //パーツの紐付け
    @IBOutlet weak var questBoardTableView: UITableView!
    
    //ToDoListを格納する配列
    var toDoListArray:[String] = []
    
    //インスタンスを作成
    var coreData = CoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableViewDataSource, UITableViewDelegateの紐付け
        questBoardTableView.delegate  = self
        questBoardTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //UITableViewDataSource, UITableViewDelegateの紐付け
        questBoardTableView.delegate  = self
        questBoardTableView.dataSource = self
        
        //coredataのデータを更新する
        coreData.readCoreData()
    }
    
    //tableViewの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //ToDoListに格納されている数だけtableviewを表示する
       print(toDoListArray.count)
        
        return toDoListArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todoNameString = todoListArray[indexPath.row].name
        let todoDateString = todoListArray[indexPath.row].date
        let todoPointString = todoListArray[indexPath.row].point
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "questBoardCell") as! QuestBoardTableViewCell
        //QuestBoardViewControllerのtextに反映
        cell.questBoardTableViewCellDoLabel.text = "\(todoNameString)"
        cell.questBoardTableViewCellDateLabel.text = "\(todoDateString)"
        cell.questBoardTableViewCellRewardPointLabel.text = "\(todoPointString)"
        
        
        
        return cell
    }
    
//    //coreDataの中身を反映する処理
//    func openCoreData() {
//        //データの個数を取得
//        let numberOfData = todoListArray.count
//        //データの読み出し
//        for number in 0..<numberOfData {
//            let todoNameString = todoListArray[numberOfData].name
//            let todoDateString = todoListArray[numberOfData].date
//            let todoPointString = todoListArray[numberOfData].point
//        }
//    }

    
    @IBAction func goToMakeToDoVCButtonAction(_ sender: Any) {
    }
    
    @IBAction func goToSetRewardPointVCButtonAction(_ sender: Any) {
    }
    
}
