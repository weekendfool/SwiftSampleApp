//
//  MVCCountryViewController.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import UIKit

final class MVCCountryViewController: UIViewController {
    
    private let CELL_NIB_NAME = String(describing: MVCCountryTableViewCell.self)
    private let CELL_ID = String(describing: MVCCountryTableViewCell.self)
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            // storyboardから読み込んだ時にセルの登録を済ませる
            let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
            tableView.register(cellNIB, forCellReuseIdentifier: CELL_ID)
        }
    }
    
    private var countris: [MVCCountryModel] = MVCCountryModel.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
}

extension MVCCountryViewController: UITableViewDelegate {
}

extension MVCCountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countris.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MVCCountryTableViewCell
        else {
            return UITableViewCell()
        }
        
        let country = countris[indexPath.row]
        
        // cellの表示更新メソッドにモデルのインスタンスを渡す
        cell.configure(country: country)
        
        return cell
    }
}
