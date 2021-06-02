//
//  MVCTableViewCell.swift
//  MVCSampleApp
//
//  Created by 尾原徳泰 on 2021/06/02.
//

import UIKit

final class MVCTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var atNameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userSwitch: UISwitch!
    
    // セルの初期化メソッド、再利用時に使用
    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
        atNameLabel.text = nil
        userSwitch.isOn = false
    }
    
    // セルの更新　モデルを受け取る
    func configure(user: MVCUserModel) {
        userNameLabel.text = user.name
        atNameLabel.text = user.atName
        userSwitch.isOn = user.isOn
    }
    
}
