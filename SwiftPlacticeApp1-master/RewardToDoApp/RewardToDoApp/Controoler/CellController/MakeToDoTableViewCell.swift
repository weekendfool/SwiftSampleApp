//
//  MakeToDoTableViewCell.swift
//  RewardToDoApp
//
//  Created by 尾原徳泰 on 2020/07/04.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit



class MakeToDoTableViewCell: UITableViewCell {
    
    //パーツの紐付け
    @IBOutlet weak var makeToDoTableViewCellCatImage: UIImageView!
    @IBOutlet weak var makeToDoTableViewCellMyImage: UIImageView!
    @IBOutlet weak var makeToDoTableViewCellCatLabel: UILabel!
    @IBOutlet weak var makeToDoTableViewCellMyLabel: UILabel!
    @IBOutlet weak var makeToDoTableViewCellCatTalkImage: UIImageView!
    @IBOutlet weak var makeToDoTableViewCellMyTalkImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setUpCatCell(catTalk: <#String#>, catImageName: <#String#>)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
    

    //catのcellの表示コントロールする処理
    func setUpCatCell(catImageName: String, catTalk: String) {
        //アイコンを設定
        makeToDoTableViewCellCatImage.image = UIImage(named: catImageName)
        //話す内容を反映
        makeToDoTableViewCellCatLabel.text = catTalk
        
    }

    //自分の発言を反映
    func setUpMyCell(myTalk: String) {
        //アイコンを設定
        makeToDoTableViewCellMyImage.image = UIImage(named: "myIcon")
        makeToDoTableViewCellMyLabel.text = myTalk
    }
    
    
    
}
