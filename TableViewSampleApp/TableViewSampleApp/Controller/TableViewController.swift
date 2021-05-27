//
//  TableViewController.swift
//  TableViewSampleApp
//
//  Created by 尾原徳泰 on 2021/05/22.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let cellClassName = "TableViewCell"
    private let reusedId = "TableViewCell"
    
    //インスタンス化
    private var character: [CharacterModel] = []
    private var heightCache: [CGFloat] = []
    var getDataModel = SampleData()
    
    // パーツの紐付け
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            // セルの登録
            // xibファイルを読み込む
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reusedId)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        character = getDataModel.getSampleData() as! [CharacterModel]
    }
    
    // MARK: -
    // tableViewの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusedId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let characters = character[indexPath.row]
        cell.configure(character: characters)
        return cell
    }
    

}
