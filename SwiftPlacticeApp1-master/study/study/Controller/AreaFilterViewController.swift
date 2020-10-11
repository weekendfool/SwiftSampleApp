//
//  AreaFilterViewController.swift
//  study
//
//  Created by 尾原徳泰 on 2020/05/07.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

protocol AreaFilterViewControllerDelegate: AnyObject {
    //プロトコルの宣言                  引数名　　　　　　　　　　　　　引数型　　　　　　　　　　　　　ラベル                     引数名             引数型、Setという値を保存するためのデータブロック、Int型
    func areaFilterViewController(_ areaFilterViewController: AreaFilterViewController, didChangeSelectedAreaIds selectedAreaIds: Set<Int>)
}
//独自の型を宣言（地方の名前）
enum Area: Int, CaseIterable {
    
    case hokkaido
    case tohoku
    case kanto
    case chubu
    case kinki
    case chugoku
    case shikoku
    case kyushu
}
//finalとは継承されないクラスの目印
final class AreaFilterViewController: UIViewController {
    //委任先を指定するプロパティを作成
    weak var delegate:AreaFilterViewControllerDelegate?
    //Setという値を保存するためのデータブロックを空でint型で作成
    var selectedAreaIds: Set<Int> = [] {
        //変数の値の変更後に行われる処理
        didSet {
            //委任先のメソッド実行
            delegate?.areaFilterViewController(self, didChangeSelectedAreaIds: selectedAreaIds)
        }
    }
    
    //privateとは同じファイルからしかアクセスできないという目印、クロージャーな気がする
    private let mainStackView: UIStackView = {
        //mainStackViewをコードで生成している
        //インスタンスの生成
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    //tableViewの生成
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorInset = .zero
        table.rowHeight = 44
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    //buttonの生成
    private let allCheckButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("すべて", for: .normal)
        button.setImage(UIImage(named: "btn_check_normal"), for: .normal)
        button.setImage(UIImage(named: "btn_check_selected"), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 0)
        button.contentEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 0)
        button.contentHorizontalAlignment = .leading
        return button
    }()
    //列挙隊の全てを代入
    private let areaList = Area.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewのバックグラウンドカラー設定
        view.backgroundColor = .white
        addSubView()
        setupLayout()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        allCheckButton.addTarget(self, action: #selector(allCheck(_:)), for: .touchUpInside)
        allCheckButton.isSelected = areaList.allSatisfy { selectedAreaIds.contains($0.rawValue) }
        
    }
    
    //MARK: -　（//MARK: -で線が描ける）
    //viewの生成
    private func addSubView() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(allCheckButton)
        mainStackView.addArrangedSubview(makeSeparatorView())
        mainStackView.addArrangedSubview(tableView)
    }
    //レイアウトの制約を記述
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            allCheckButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    //makeSeparatorViewの生成
    private func makeSeparatorView() -> UIView {
        //UIViewのインスタンス生成
        let separator = UIView()
        separator.backgroundColor = .gray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        return separator
    }
    
    //MARK: - アクション
    @objc private func allCheck(_ sender: Any) {
        allCheckButton.isSelected.toggle()
        updateAreaIds(isAllCheck: allCheckButton.isSelected)
        tableView.reloadData()
    }
    
    //MARK: - アップデート、エリアID
    //同じ名前の関数でも引数違うと別物扱い
    private func updateAreaIds(_ id: Int) {
        //contains：データブロックの中の特定の文字を探す
        if selectedAreaIds.contains(id) {
            //remove：値を指定して削除する
            selectedAreaIds.remove(id)
        } else {
            //insert：値を挿入
            selectedAreaIds.insert(id)
        }
    }
    private func updateAreaIds(isAllCheck: Bool) {
        if isAllCheck {
            //mapはデータブロック内の全要素に適応したい時に使用、$0.rawValue←0番目からrawValueを各要素に実行,rawValueはEnumの中身の型を取り出せる
            selectedAreaIds = Set(areaList.map { $0.rawValue })
        } else {
            //要素前削除
            selectedAreaIds.removeAll()
        }
    }
}

extension AreaFilterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let area = areaList[indexPath.row]
        updateAreaIds(area.rawValue)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        allCheckButton.isSelected = areaList.allSatisfy { selectedAreaIds.contains($0.rawValue) }
    }
}

extension AreaFilterViewController: UITableViewDataSource {
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaList.count
    }
    //テーブルのセルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let area = areaList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.imageView?.highlightedImage = UIImage(named: "btn_check_selected")
        cell.imageView?.image = UIImage(named: "btn_check_normal")
        cell.imageView?.isHighlighted = selectedAreaIds.contains(area.rawValue)
        switch area {
        case .hokkaido:
            cell.textLabel?.text = "北海道"
        case .tohoku:
            cell.textLabel?.text = "東北"
        case .kanto:
            cell.textLabel?.text = "関東"
        case .chubu:
            cell.textLabel?.text = "中部"
        case .kinki:
            cell.textLabel?.text = "近畿"
        case .chugoku:
            cell.textLabel?.text = "中国"
        case .shikoku:
            cell.textLabel?.text = "四国"
        case .kyushu:
            cell.textLabel?.text = "九州"
        }
        return cell
    }
}
