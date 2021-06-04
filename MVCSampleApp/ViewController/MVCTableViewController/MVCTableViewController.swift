//
//  MVCTableViewController.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import UIKit

final class MVCTableViewController: UIViewController {
    
    // cellのファイル名を指定しておく
    private let CELL_NIB_NAME = String(describing: MVCTableViewCell.self)
    private let CELL_ID = String(describing: MVCTableViewCell.self)
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            // storyboardから読み込んだ時点でセルの登録を行う
            let cellNib = UINib(nibName: CELL_NIB_NAME, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: CELL_ID)
            
            // データを取得するまでviewを消す
            tableView.isHidden = true
        }
    }
    
    // apiから取得したものを保存しておく
    private var users: [MVCUserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // apiからデータの取得
        // クロージャー、非同期処理
        API.shared.getUsers(completion: {[weak self] users in
            // 取得したらテーブルをリロード
            self?.users = users
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        } )
        // デリゲートの設定
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

    // 拡張する
    private extension MVCTableViewController {
        // アラートを出す処理
        func showAlert(user: MVCUserModel) {
            let alertVC = UIAlertController(title: "select cell", message: user.alertText, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

extension MVCTableViewController: UITableViewDelegate {
   
    // セルをタッチした時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // apiから取得したデータのindexPath.row番目のインスタンスを取得
        let user = users[indexPath.row]
        // タップした時のアクションを記載
        // アラート発報
        showAlert(user: user)
    }
}

extension MVCTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPathから登録したセルの方にキャストする
        // 失敗したらそのままuitableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MVCTableViewCell
        else {
            // エラー処理
            print("error")
            return UITableViewCell()
            
        }
        // apiから取得したデータからインスタンスを取得
        let user = users[indexPath.row]
        // cellの表示更新メソッドにモデルのインスタンスを渡す
        cell.configure(user: user)
        
        return cell
    }
}
