//
//  UsersListViewController.swift
//  FirebaseSignInSampleApp
//
//  Created by 尾原徳泰 on 2020/10/27.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import Firebase

class UsersListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var usersTableView: UITableView!
    
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // デリゲートの設定
//        usersTableView.delegate = self
        usersTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // firebaseのルートを宣言
        let ref = Database.database().reference()
        
        ref.child("Users").observe(.value) { (snapshot) in
            // 初期化
            self.users = []
            
            for data in snapshot.children {
                let snapData = data as! DataSnapshot
                let decitionarySnapData = snapData.value as! [String: Any]
                // Userクラスのインスタンス生成
                var user = User()
                // 取得した内容をユーザー型にセット
                user.setFromDictionary(decitionarySnapData)
                // ユーザリストに追加
                self.users.append(user)
            }
            
            // 全てリストに格納したらtableViewを更新
            self.usersTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _users = users else { return 0}
        return _users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: "UserTableCell", for: indexPath)
        let user = users[indexPath.row]
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = user.name
        
        let ageLabel = cell.viewWithTag(2) as! UILabel
        ageLabel.text = String(user.age)
        
        let favoriteLabel = cell.viewWithTag(3) as! UILabel
        favoriteLabel.text = user.favoriteBook
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    

    // セル削除時のデータ削除機能
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "削除") { (action, sourceview, completionHandler) in
            completionHandler(true)
            
            let ref = Database.database().reference()
            ref.child("Users").child(self.keys[indexPath.row]).removeValue()
        }
    }
}
