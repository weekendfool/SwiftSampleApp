//
//  PrefectureListViewController.swift
//  study
//
//  Created by 尾原徳泰 on 2020/05/07.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

let BASE_URL = "http://weather.livedoor.com/forecast/webservice/json/v1"
//列挙体、型はエラー
enum APIError: Error {
    case network
    case server
    case invalidJSON
}
//上記の列挙体を拡張
extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network:
            return "ネットワークの接続状態を確認してください。"
        case .server:
            return "サーバーと通信できません。"
        case .invalidJSON:
            return "JSONパース失敗。"
        }
    }
}

final class PrefectureListViewController: UIViewController {
    
    enum CellItemTag: Int {
        case favoriteButton = 1
        case nameLabel = 2
    }
    
    enum UserDefaultsKey: String {
        case favoriteIds = "FAVORITE_PREFECTURE_CITY_IDS"
    }
    //MARK: - ui関係
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.rowHeight = 44
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private let areaFilterButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("地方で絞込む", for: .normal)
        button.setBackgroundImage(UIImage(named: "btn_normal"), for: .normal)
        button.setImage(UIImage(named: "btn_filter"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let favoriteFilterButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("お気に入りのみ表示する", for: .normal)
        button.setImage(UIImage(named: "btn_check_normal"), for: .normal)
        button.setImage(UIImage(named: "btn_check_selected"), for: .selected)
        button.titleEdgeInsets = .init(top: 0, left: 4, bottom: 0, right: 0)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let headerView: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private let progressView: UIView = {
        let progress = UIView()
        progress.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    private let indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .whiteLarge
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    //MARK: -
    //                          [[]]：多次元配列
    private let prefectureList:[[String: Any]] = {
        let url = Bundle.main.url(forResource: "CityData", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            return result ?? []
        } catch {
            print(error.localizedDescription)
            return[]
        }
    }()
}
